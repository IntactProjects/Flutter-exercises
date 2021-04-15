import 'package:exo2/domain/agency.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_utils.dart';
import 'package:exo2/main.dart';
import 'package:exo2/screens/details/agency_details_arguments.dart';

class MapScreen extends StatefulWidget {
  final List<Agency>? agencies;

  const MapScreen({Key? key, required this.agencies}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin {
  Map<Company, BitmapDescriptor>? _companyIcons;

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers.clear();
      for (final agency in widget.agencies!) {
        final marker = Marker(
          markerId: MarkerId(agency.id.toString()),
          position: LatLng(agency.position.latitude, agency.position.longitude),
          icon:
              _companyIcons?[agency.company] ?? BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: agency.city,
            snippet: agency.company.label,
            onTap: () => _onItemTap(context, agency),
          ),
        );
        _markers[agency.id.toString()] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _createMarkerIcons(context);
    if (widget.agencies != null) {
      return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(48.856614, 2.3522219),
          zoom: 5.0,
        ),
        markers: _markers.values.toSet(),
      );
    } else {
      return Center(child: CircularProgressIndicator.adaptive());
    }
  }

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

  _onItemTap(BuildContext context, Agency agency) {
    Navigator.pushNamed(context, AgencyDetailsRoute,
        arguments: AgencyDetailsArguments(agency));
  }

  @override
  bool get wantKeepAlive => true;
}
