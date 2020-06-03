import 'package:stacked/stacked.dart';
import 'package:veggie_go_malaysia/app/locator.dart';
import 'package:veggie_go_malaysia/datamodels/restaurant.dart';
import 'package:veggie_go_malaysia/services/database/firestore.dart';

class HomeViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  List<Restaurant> _places;
  List<Restaurant> get places => _places;

  void listenToPlaces() {
    setBusy(true);
    _firestoreService.listenToResults().listen((resultsData) {
      List<Restaurant> updatedPlaces = resultsData;
      if (updatedPlaces != null && updatedPlaces.isNotEmpty) {
        _places = updatedPlaces;
        notifyListeners();
      }
      setBusy(false);
    });
  }

  void fetchResults() => _firestoreService.fetchResults();
}
