import 'dart:io';

import 'package:tractian/core/core_modules/data/datasources/datasoruce.dart';
import 'package:tractian/core/core_modules/domain/entities/assets_entity.dart';
import 'package:tractian/core/core_modules/domain/entities/companies_entity.dart';
import 'package:tractian/core/core_modules/domain/entities/locations_entity.dart';
import 'package:tractian/core/core_modules/domain/failures/failures.dart';
import 'package:tractian/core/core_modules/domain/repositories/repository.dart';
import 'package:tractian/core/types/type.dart';
import 'package:tractian/core/widgets/either.dart';

class RepositoryImpl implements IRepository {
  final IDataSource dataSource;

  RepositoryImpl({required this.dataSource});

  @override
  Future<Either<IFailures, List<AssetsEntity>>> getAssets(
      {required String companyId}) async {
    try {
      final assetsMap = await dataSource.getAssets(companyId: companyId);

      final result = assetsMap
          .map((assetsMap) => AssetsEntity.fromMap(assetsMap))
          .toList();

      return Right(result);
    } on HttpException catch (error, stackTrace) {
      return Left(
        Failures(
            message: error.toString(),
            stackTrace: stackTrace,
            type: FailureType.unknown),
      );
    }
  }

  @override
  Future<Either<IFailures, List<CompaniesEntity>>> getCompanies(
      {required List<CompaniesEntity> companies}) async {
    try {
      final companiesMap = await dataSource.getCompanies(companies: companies);

      final result = companiesMap
          .map((companiesMap) => CompaniesEntity.fromMap(companiesMap))
          .toList();

      return Right(result);
    } on HttpException catch (error, stackTrace) {
      return Left(
        Failures(
          message: error.toString(),
          stackTrace: stackTrace,
          type: FailureType.unknown,
        ),
      );
    }
  }

  @override
  Future<Either<IFailures, List<LocationsEntity>>> getLocations(
      {required String companyId}) async {
    try {
      final locationsMap = await dataSource.getLocations(companyId: companyId);

      final result = locationsMap
          .map((locationsMap) => LocationsEntity.fromMap(locationsMap))
          .toList();

      return Right(result);
    } on HttpException catch (error, stackTrace) {
      return Left(
        Failures(
          message: error.toString(),
          stackTrace: stackTrace,
          type: FailureType.unknown,
        ),
      );
    }
  }
}
