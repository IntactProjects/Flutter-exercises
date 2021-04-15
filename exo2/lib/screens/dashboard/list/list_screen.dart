import 'package:exo2/domain/agency.dart';
import 'package:flutter/material.dart';
import 'agency_list_item.dart';

class ListScreen extends StatelessWidget {
  final List<Agency>? agencies;
  final ValueSetter<Agency>? onAgencyClicked;

  const ListScreen({Key? key, required this.agencies, this.onAgencyClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (agencies != null) {
      return ListView.builder(
        itemCount: agencies!.length,
        itemBuilder: (context, index) => AgencyListItem(agencies![index]),
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
