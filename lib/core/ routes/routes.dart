import 'package:flutter/material.dart';
import 'package:tractian/core/core_modules/domain/entities/companies_entity.dart';
import 'package:tractian/modules/apex_unit/presenter/pages/apex_unit_page.dart';
import 'package:tractian/modules/home_page.dart';
import 'package:tractian/modules/jaguar_unit/presenter/pages/jaguar_page.dart';
import 'package:tractian/modules/tobias_unit/presenter/pages/tobias_unit_page.dart';

class Routes {
  static const String homePage = '/';
  static const String apexPage = '/apex';
  static const String jaguarPage = '/jaguar';
  static const String tobiasPage = '/tobias';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final name = settings.name;

    switch (name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case apexPage:
        return MaterialPageRoute(builder: (_) => const ApexUnitPage());
      case jaguarPage:
        if (settings.arguments is CompaniesEntity) {
          final company = settings.arguments as CompaniesEntity;
          return MaterialPageRoute(
            builder: (_) => JaguarPage(company: company),
          );
        } else {
          return MaterialPageRoute(builder: (_) => const Placeholder());
        }
      case tobiasPage:
        return MaterialPageRoute(builder: (_) => const TobiasUnitPage());
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
