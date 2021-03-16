import 'package:exo2/domain/agency.dart';
import 'package:exo2/utils/lorem_fetcher.dart';
import 'package:flutter/material.dart';

class AgencyDetailsScreen extends StatelessWidget {
  final Agency agency;

  const AgencyDetailsScreen({Key? key, required this.agency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Agency details")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(agency.company.logo, width: 56),
                  SizedBox(width: 8),
                  Text(
                    agency.city,
                    style: textTheme.headline4,
                  ),
                ],
              ),
              SizedBox(height: 16),
              FutureBuilder<List<String>>(
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
                                style:
                                    textTheme.bodyText2!.copyWith(fontSize: 16),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
