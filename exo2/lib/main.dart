import 'package:exo2/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:exo2/screens/details/agency_details_screen.dart';
import 'package:exo2/screens/details/agency_details_arguments.dart';

const AgenciesRoute = '/';
const AgencyDetailsRoute = '/agency_details_screen';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      switch (settings.name) {
        case AgenciesRoute:
          screen = DashboardScreen();
          break;
        case AgencyDetailsRoute:
          final AgencyDetailsArguments args =
              settings.arguments as AgencyDetailsArguments;
          screen = AgencyDetailsScreen(agency: args.agency);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
      primarySwatch: Colors.orange,
    );
  }
}
