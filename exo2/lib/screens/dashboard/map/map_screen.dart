import 'package:exo2/domain/agency.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  static final _initialPos = CameraPosition(
    target: LatLng(45.77019119262695, 4.837228298187256),
  );

  final List<Agency>? agencies;

  const MapScreen({Key? key, required this.agencies}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin {
  // Prevent redraw each time the map is displayed
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.agencies != null) {
      return GoogleMap(
        initialCameraPosition: MapScreen._initialPos,
        myLocationButtonEnabled: false,
        mapToolbarEnabled: false,
        markers: widget.agencies!.map((e) => _createMarker(e)).toSet(),
        onMapCreated: _configureMap,
      );
    } else {
      return Center(child: CircularProgressIndicator.adaptive());
    }
  }

  void _configureMap(GoogleMapController controller) {}

  Marker _createMarker(Agency agency) => Marker(
        markerId: MarkerId(agency.id.toString()),
        position: agency.position,
      );
}
