import 'package:exo2/domain/agency.dart';
import 'package:flutter/material.dart';

import 'agency_details_screen.dart';

class AgencyDetailsNavigation {
  AgencyDetailsNavigation._();

  static String get routeName => '/agency';

  static AgencyDetailsScreen createScreen(BuildContext context) {
    final agency = ModalRoute.of(context)!.settings.arguments as Agency;
    return AgencyDetailsScreen(agency: agency);
  }

  static void push(BuildContext context, Agency agency) {
    Navigator.pushNamed(context, routeName, arguments: agency);
  }
}
