import 'dart:async';

import 'package:geoflutterfire/geoflutterfire.dart';

abstract class LocationService {
  Geoflutterfire geo;

  GeoFirePoint get currentLocation;

  Future<dynamic> getUserLocation();
}
