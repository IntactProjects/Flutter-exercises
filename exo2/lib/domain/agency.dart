import 'package:exo2/domain/map_domain.dart';

class Agency {
  final int id;
  final String city;
  final LatLng position;
  final Company company;

  const Agency({
    required this.id,
    required this.city,
    required this.company,
    required this.position,
  });
}

enum Company { inTact, Atecna }

extension CompanyInfo on Company {
  String get label {
    if (this == Company.inTact)
      return "in-Tact";
    else
      return "Atecna";
  }

  String get logo {
    if (this == Company.inTact)
      return "assets/in-tact.png";
    else
      return "assets/atecna.png";
  }
}
