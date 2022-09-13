import 'dart:ui' as ui;

import 'package:exo2/domain/map_domain.dart';
import 'package:flutter/services.dart';

LatLngBounds boundsFromLatLngList(List<LatLng> list) {
  if (list.isEmpty) throw ArgumentError("list must have at least one element");

  double x0, x1, y0, y1;
  x0 = x1 = list[0].latitude;
  y0 = y1 = list[0].longitude;

  for (LatLng latLng in list) {
    if (latLng.latitude > x1) x1 = latLng.latitude;
    if (latLng.latitude < x0) x0 = latLng.latitude;
    if (latLng.longitude > y1) y1 = latLng.longitude;
    if (latLng.longitude < y0) y0 = latLng.longitude;
  }
  return LatLngBounds(northeast: LatLng(x1, y1), southwest: LatLng(x0, y0));
}

Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
    String path, int width) async {
  final Uint8List imageData = await _getBytesFromAsset(path, width);
  return BitmapDescriptor.fromBytes(imageData);
}

Future<Uint8List> _getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}
