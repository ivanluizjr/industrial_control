import 'package:tractian/core/core_modules/domain/entities/companies_entity.dart';
import 'package:tractian/core/core_modules/domain/failures/failures.dart';
import 'package:tractian/core/types/type.dart';
import 'package:tractian/core/widgets/either.dart';

import '../repositories/repository.dart';

sealed class IGetCompaniesUsecase {
  Future<Either<IFailures, List<CompaniesEntity>>> call(
      {required List<CompaniesEntity> companies});
}

class GetCompaniesUsecaseImpl implements IGetCompaniesUsecase {
  final IRepository repository;

  GetCompaniesUsecaseImpl({required this.repository});

  @override
  Future<Either<IFailures, List<CompaniesEntity>>> call(
      {required List<CompaniesEntity> companies}) async {
    try {
      final response = await repository.getCompanies(companies: companies);

      return response;
    } catch (error, stackTrace) {
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
