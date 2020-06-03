import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/services/database/abstract_firestore.dart';
import 'package:veggie_go_malaysia/services/geolocation/location_service.dart';
import 'package:veggie_go_malaysia/services/geolocation/mock_geolocation_service.dart';

class FirestoreService implements DatabaseService {
  final CollectionReference _collectionRef =
      Firestore.instance.collection('places');

  final LocationService _geoLocationService = locator<MockGeoLocationService>();

  final StreamController<List<Restaurant>> _resultsController =
      StreamController<List<Restaurant>>.broadcast();

  final List<List<Restaurant>> _allPagedResults = <List<Restaurant>>[];

  static const int ResultsLimit = 3;

  DocumentSnapshot _lastDocument;
  bool _hasMoreResults = true;

  Stream listenToResults() {
    _fetchResults();
    return _resultsController.stream;
  }

  void _fetchResults() async {
    var userLocation = _geoLocationService.currentLocation;
    userLocation ??= await _geoLocationService.getUserLocation();

    print('fetching');
    var q = _collectionRef
        .where('status', isEqualTo: 'OPERATIONAL')
        .limit(ResultsLimit);

    if (_lastDocument != null) {
      q = q.startAfterDocument(_lastDocument);
    }

    if (!_hasMoreResults) return;

    var currentRequestIndex = _allPagedResults.length;
    print('attempting');
    var placesStream =
        _geoLocationService.geo.collection(collectionRef: q).within(
              center: userLocation,
              radius: 10.0, //km
              field: 'location',
            );
    print('attempted');
    placesStream.listen((List<DocumentSnapshot> documentList) {
      if (documentList.isNotEmpty) {
        var results = documentList
            .map((snapshot) =>
                Restaurant.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.name != null)
            .toList();

        print(results);

        // check if page exists or not
        var pageExists = currentRequestIndex < _allPagedResults.length;

        // if page exists update the results for that page
        if (pageExists) {
          _allPagedResults[currentRequestIndex] = results;
        } // else add the page data
        else {
          _allPagedResults.add(results);
        }

        // concatenate the full list to be shown
        var allResults = _allPagedResults.fold<List<Restaurant>>(<Restaurant>[],
            (initialValue, pageItems) => initialValue..addAll(pageItems));

        // broadcast all results
        _resultsController.add(allResults);

        // save the last doc from the results if its the last page
        if (currentRequestIndex == _allPagedResults.length - 1) {
          _lastDocument = documentList.last;
        }

        // determine if there's more results to request
        _hasMoreResults = results.length == 3;
      } else {
        print('no results');
      }
    });
  }

  void fetchResults() => _fetchResults();
}
