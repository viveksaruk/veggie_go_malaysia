import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class Restaurant {
  final String docId;
  final String name;
  final String address;
  final String phoneNumber;
  final String website;

  final List<CachedNetworkImage> photos;

  final Map<String, bool> features;
  final Map<String, bool> types;

  final List<Map<String, Map<String, dynamic>>> openingHours; // 0 = Sunday
  final List<String> weekdayText; // 0 = Monday

  final bool isBudget;
  final bool isRecommended;
  final int priceLevel; // $, $$, $$$, $$$$

  final double latitude;
  final double longitude;
  final String mapUrl;

  final double rating;
  final List<Map<String, dynamic>> reviews;

  // Calculate distance from user with a method
  double _distanceFromUser;

  Restaurant({
    @required this.docId,
    @required this.name,
    this.address,
    this.phoneNumber,
    this.photos,
    this.features,
    this.types,
    this.openingHours,
    this.weekdayText,
    this.isBudget,
    this.isRecommended,
    this.priceLevel,
    this.latitude,
    this.longitude,
    this.mapUrl,
    this.rating,
    this.reviews,
    this.website,
  })  :
        // Don't allow restaurant to display to user if name isn't known
        assert(name != null && name != ''),
        // Both geolocation and address can't be missing at the same time
        assert(((latitude != null) && (longitude != null)) ||
            (address != null && address != ''));

  double get distanceFromUser {
    // TODO: calculate distance using latitude and longitude
    return _distanceFromUser;
  }

  factory Restaurant.fromMap(
      Map<dynamic, dynamic> firestoreObject, String documentID) {
    return Restaurant(
      name: firestoreObject['name'],
      docId: documentID,
    );
  }
}
