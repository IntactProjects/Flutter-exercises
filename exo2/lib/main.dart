import 'package:exo2/screens/dashboard/dashboard_screen.dart';
import 'package:exo2/screens/details/agency_details_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Agencies',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => DashboardScreen(),
          '/agency': (context) => AgencyDetailsNavigation.createScreen(context)
        });
  }
}
