import 'package:tractian/core/core_modules/domain/entities/companies_entity.dart';

abstract interface class IDataSource {
  Future<List<Map<String, dynamic>>> getAssets({
    required String companyId,
  });
  Future<List<Map<String, dynamic>>> getCompanies({
    required List<CompaniesEntity> companies,
  });
  Future<List<Map<String, dynamic>>> getLocations({
    required String companyId,
  });
}
