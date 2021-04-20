import 'package:exo2/domain/agency.dart';
import 'package:exo2/main.dart';
import 'package:flutter/material.dart';
import 'package:exo2/screens/details/agency_details_arguments.dart';

class AgencyListItem extends StatelessWidget {
  final Agency _agency;

  AgencyListItem(this._agency);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _agency.id.toString(),
      child: Material(
        child: ListTile(
          onTap: () => _onItemTap(context, _agency),
          title: Text(_agency.city),
          leading: Image.asset(_agency.company.logo),
          subtitle: Text(_agency.company.label),
        ),
      ),
    );
  }

  _onItemTap(BuildContext context, Agency agency) {
    Navigator.pushNamed(context, AgencyDetailsRoute,
        arguments: AgencyDetailsArguments(agency));
  }
}
