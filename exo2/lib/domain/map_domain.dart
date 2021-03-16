/*
import 'dart:typed_data';

// Replace all content of this file with
//   export 'package:google_maps_flutter/google_maps_flutter.dart';
// once Google Maps Flutter is added to the project

class LatLng {
  final double latitude;
  final double longitude;

  const LatLng(this.latitude, this.longitude);
}

class LatLngBounds {
  final LatLng northeast;
  final LatLng southwest;

  LatLngBounds({required this.northeast, required this.southwest});
}

class BitmapDescriptor {
  BitmapDescriptor._();

  factory BitmapDescriptor.fromBytes(Uint8List bytes) {
    return BitmapDescriptor._();
  }
}
*/

// Replace our domain LatLng with the one provided by Google Maps
export 'package:google_maps_flutter/google_maps_flutter.dart';