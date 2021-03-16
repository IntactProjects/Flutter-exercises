import 'package:exo2/domain/agency.dart';

String getHeroTag(Agency agency, String type) =>
    "${agency.company}_${agency.city}_$type";
