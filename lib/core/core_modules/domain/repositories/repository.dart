import 'package:tractian/core/core_modules/domain/entities/assets_entity.dart';
import 'package:tractian/core/core_modules/domain/entities/companies_entity.dart';
import 'package:tractian/core/core_modules/domain/entities/locations_entity.dart';
import 'package:tractian/core/core_modules/domain/failures/failures.dart';
import 'package:tractian/core/widgets/either.dart';

abstract interface class IRepository {
  Future<Either<IFailures, List<AssetsEntity>>> getAssets({
    required String companyId,
  });
  Future<Either<IFailures, List<CompaniesEntity>>> getCompanies({
    required List<CompaniesEntity> companies,
  });
  Future<Either<IFailures, List<LocationsEntity>>> getLocations({
    required String companyId,
  });
}
