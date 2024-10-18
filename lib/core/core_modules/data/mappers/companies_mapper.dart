import 'package:tractian/core/core_modules/domain/entities/companies_entity.dart';

class CompaniesMapper {
  static CompaniesEntity fromMap(Map<String, dynamic> map) {
    return CompaniesEntity(
      id: map['id'],
      name: map['name'],
    );
  }
}
