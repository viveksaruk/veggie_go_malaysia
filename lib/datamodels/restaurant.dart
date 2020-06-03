import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  final GeoPoint location;
  final String mapUrl;

  final double rating;
  final List<Map<String, dynamic>> reviews;

  double distanceFromUser;

  Restaurant({
    @required this.docId,
    @required this.name,
    @required this.location,
    this.distanceFromUser,
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
    this.mapUrl,
    this.rating,
    this.reviews,
    this.website,
  });

  void updateDistanceFromUser(GeoPoint userLocation) {
    // TODO: calculate new distance
  }

  factory Restaurant.fromMap(
      Map<dynamic, dynamic> firestoreObject, String documentID) {
    return Restaurant(
      docId: documentID,
      name: firestoreObject['name'],
      location: firestoreObject['location']['geopoint'],
    );
  }
}
