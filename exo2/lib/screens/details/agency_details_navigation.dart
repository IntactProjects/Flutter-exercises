import 'package:exo2/domain/agency.dart';
import 'package:exo2/domain/agency_repository.dart';
import 'package:flutter/material.dart';

import 'agency_details_screen.dart';

class AgencyDetailsNavigation {
  AgencyDetailsNavigation._();

  static bool matches(Uri uri) =>
      uri.pathSegments.length == 2 && uri.pathSegments.first == 'agency';

  static void push(BuildContext context, Agency agency) {
    Navigator.pushNamed(context, "/agency/${agency.id}", arguments: agency);
  }

  static Widget load(BuildContext context, Uri uri) {
    if (!matches(uri)) throw ArgumentError("Uri $uri does not match");

    final agencyId = int.parse(uri.pathSegments[1]);
    final arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments is Agency && arguments.id == agencyId) {
      return AgencyDetailsScreen(agency: arguments);
    } else {
      return FutureBuilder<Agency>(
        future: AgencyRepository.get().getAgencyById(agencyId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Column(
                children: [
                  Text("Agency $agencyId could not be loaded"),
                  Text(snapshot.error.toString())
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return AgencyDetailsScreen(agency: snapshot.data!);
          } else {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      );
    }
  }
}
