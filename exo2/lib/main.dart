import 'package:exo2/screens/dashboard/dashboard_screen.dart';
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
      home: DashboardScreen(),
    );
  }
}
