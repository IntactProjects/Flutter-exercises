import 'package:exo2/domain/agency.dart';
import 'package:exo2/domain/agency_repository.dart';
import 'package:flutter/material.dart';

import 'list/list_screen.dart';
import 'map/map_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Agencies"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list_outlined), text: "List"),
              Tab(icon: Icon(Icons.map_outlined), text: "Map"),
            ],
          ),
        ),
        body: FutureBuilder<List<Agency>>(
          future: AgencyRepository.get().getAgencies(),
          builder: (context, snapshot) => TabBarView(children: [
            ListScreen(agencies: snapshot.data),
            MapScreen(agencies: snapshot.data),
          ]),
        ),
      ),
    );
  }
}
