import 'package:exo1/screens/users/users_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User listing',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: UsersScreen(),
    );
  }
}
