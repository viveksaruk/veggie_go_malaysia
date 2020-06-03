import 'dart:async';

import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';
import 'package:veggie_go_malaysia/services/geolocation/location_service.dart';

class GeoLocationService implements LocationService {
  final Location location = Location.instance;

  @override
  Geoflutterfire geo = Geoflutterfire();

  GeoFirePoint _currentLocation;
  @override
  GeoFirePoint get currentLocation => _currentLocation;

  @override
  Future<dynamic> getUserLocation() async {
    // Check for enabled service
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // TODO: throw user error
        return null;
      }
    }

    // Check for permission
    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // TODO: throw user error
        return null;
      }
    }

    try {
      var userLocation = await location.getLocation();
      _currentLocation = geo.point(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      throw Exception('Could not get location: ${e.toString()}');
    }
    return currentLocation;
  }
}
