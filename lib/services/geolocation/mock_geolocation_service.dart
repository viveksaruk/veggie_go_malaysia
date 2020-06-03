import 'dart:async';

import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:veggie_go_malaysia/services/geolocation/location_service.dart';

class MockGeoLocationService implements LocationService {
  @override
  Geoflutterfire geo = Geoflutterfire();

  GeoFirePoint _currentLocation;
  @override
  GeoFirePoint get currentLocation => _currentLocation;

  @override
  Future<dynamic> getUserLocation() async {
    _currentLocation =
        geo.point(latitude: 4.549170500000001, longitude: 101.1087441);
    return currentLocation;
  }
}
