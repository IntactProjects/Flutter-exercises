import 'package:exo2/domain/agency.dart';
import 'package:exo2/domain/map_domain.dart';

class AgencyRepository {
  // Prevent using default constructor
  AgencyRepository._();

  static final _instance = AgencyRepository._();
  factory AgencyRepository.get() => _instance;

  Future<List<Agency>> getAgencies() =>
      Future.delayed(Duration(milliseconds: 600), () => _agencies);

  Future<Agency> getAgencyById(int id) => getAgencies()
      .then((agencies) => agencies.firstWhere((element) => element.id == id));

  static final _agencies = <Agency>[
    Agency(
      id: 1,
      city: "Barcelona",
      position: LatLng(41.41545867919922, 2.2033181190490723),
      company: Company.inTact,
    ),
    Agency(
      id: 2,
      city: "Lille",
      position: LatLng(50.66374206542969, 3.12908673286438),
      company: Company.Atecna,
    ),
    Agency(
      id: 3,
      city: "Lyon",
      position: LatLng(45.77019119262695, 4.837228298187256),
      company: Company.inTact,
    ),
    Agency(
      id: 4,
      city: "Montreal",
      position: LatLng(45.527676, -73.59678),
      company: Company.Atecna,
    ),
    Agency(
      id: 5,
      city: "Paris",
      position: LatLng(48.8748882, 2.340813),
      company: Company.Atecna,
    ),
    Agency(
      id: 6,
      city: "Paris",
      position: LatLng(48.85170364379883, 2.386417865753174),
      company: Company.inTact,
    ),
    Agency(
      id: 7,
      city: "Toulouse",
      position: LatLng(43.60384750366211, 1.4458614587783813),
      company: Company.inTact,
    ),
  ];
}
