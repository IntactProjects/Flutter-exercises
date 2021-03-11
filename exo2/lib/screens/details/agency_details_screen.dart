import 'package:exo2/domain/agency.dart';
import 'package:flutter/material.dart';

class AgencyDetailsScreen extends StatelessWidget {
  final Agency agency;

  const AgencyDetailsScreen({Key? key, required this.agency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(agency.city),
      ),
    );
  }
}
