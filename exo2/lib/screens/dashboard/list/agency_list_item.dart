import 'package:exo2/domain/agency.dart';
import 'package:flutter/material.dart';

class AgencyListItem extends StatelessWidget {
  final Agency _agency;

  AgencyListItem(this._agency);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        title: Text(_agency.city),
        leading: Image.asset(_agency.company.logo),
        subtitle: Text(_agency.company.label),
      ),
    );
  }
}
