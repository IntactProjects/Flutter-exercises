import 'package:exo2/domain/agency.dart';
import 'package:exo2/utils/hero_utils.dart';
import 'package:flutter/material.dart';

class AgencyListWidget extends StatelessWidget {
  final List<Agency> agencies;
  final ValueSetter<Agency>? onAgencyClicked;

  const AgencyListWidget({required this.agencies, this.onAgencyClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: agencies.length,
      itemBuilder: (context, index) => AgencyTile(
        agency: agencies[index],
        onAgencyClicked: onAgencyClicked,
      ),
    );
  }
}

class AgencyTile extends StatelessWidget {
  final Agency agency;
  final ValueSetter<Agency>? onAgencyClicked;

  const AgencyTile({required this.agency, this.onAgencyClicked});

  @override
  Widget build(BuildContext context) => Hero(
        tag: getHeroTag(agency, 'title'),
        child: Material(
          child: ListTile(
            leading: Image.asset(agency.company.logo),
            title: Text(agency.city),
            subtitle: Text(agency.company.label),
            onTap: () => onAgencyClicked?.call(agency),
          ),
        ),
      );
}
