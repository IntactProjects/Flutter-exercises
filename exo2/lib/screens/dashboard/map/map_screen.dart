import 'package:exo2/domain/agency.dart';
import 'package:exo2/screens/details/agency_details_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_utils.dart';

class MapScreen extends StatefulWidget {
  static final _initialPos = CameraPosition(
    target: LatLng(45.77019119262695, 4.837228298187256),
  );

  final List<Agency>? agencies;

  const MapScreen({Key? key, required this.agencies}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();

  LatLngBounds get _bounds => boundsFromLatLngList(
      (agencies ?? []).map((e) => e.position).toList().cast());
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin {
  Map<Company, BitmapDescriptor>? _companyIcons;

  // Prevent redraw each time the map is displayed
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    _createMarkerIcons(context);
    super.build(context);
    if (widget.agencies != null) {
      return GoogleMap(
        initialCameraPosition: MapScreen._initialPos,
        myLocationButtonEnabled: false,
        mapToolbarEnabled: false,
        markers: widget.agencies!.map((e) => _createMarker(context, e)).toSet(),
        onMapCreated: _configureMap,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
          Factory(() => _IgnoreBorderGestureRecognizer())
        ].toSet(),
      );
    } else {
      return Center(child: CircularProgressIndicator.adaptive());
    }
  }

  void _configureMap(GoogleMapController controller) {
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(widget._bounds, 16),
    );
  }

  Marker _createMarker(BuildContext context, Agency agency) => Marker(
      markerId: MarkerId(agency.id.toString()),
      position: agency.position,
      icon: _companyIcons?[agency.company] ?? BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: agency.city,
        snippet: agency.company.label,
        onTap: () => AgencyDetailsNavigation.push(context, agency),
      ));

  Future<void> _createMarkerIcons(BuildContext context) async {
    final icons = Map<Company, BitmapDescriptor>();
    await Future.forEach<Company>(
      Company.values,
      (company) async {
        icons[company] =
            await getBitmapDescriptorFromAssetBytes(company.logo, 48);
      },
    );

    setState(() {
      _companyIcons = icons;
    });
  }
}

// Ignore event on the left border of the map to allow paging between tabs
class _IgnoreBorderGestureRecognizer extends EagerGestureRecognizer {
  @override
  bool isPointerAllowed(PointerDownEvent event) {
    return super.isPointerAllowed(event) && event.localPosition.dx > 100;
  }
}
