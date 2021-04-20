import 'package:exo2/domain/agency.dart';
import 'package:flutter/material.dart';
import 'package:exo2/utils/lorem_fetcher.dart';

class AgencyDetailsScreen extends StatelessWidget {
  final Agency agency;

  const AgencyDetailsScreen({Key? key, required this.agency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agency details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _cityWithLogo(context),
                _textSections(),
              ]),
        ),
      ),
    );
  }

  Widget _cityWithLogo(BuildContext context) {
    return Hero(
      tag: agency.id.toString(),
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Image.asset(agency.company.logo, height: 56.0),
              ),
              Text(
                agency.city,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textSections() {
    return FutureBuilder<List<String>>(
      future: fetchLorem(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data!
                .map(
                  (paragraph) => Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      paragraph,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
