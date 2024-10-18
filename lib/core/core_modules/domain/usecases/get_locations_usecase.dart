import 'package:tractian/core/core_modules/domain/entities/locations_entity.dart';
import 'package:tractian/core/core_modules/domain/failures/failures.dart';
import 'package:tractian/core/core_modules/domain/repositories/repository.dart';
import 'package:tractian/core/types/type.dart';
import 'package:tractian/core/widgets/either.dart';

sealed class IGetLocationsUsecase {
  Future<Either<IFailures, List<LocationsEntity>>> call(
      {required String companyId});
}

class GetLocationsUsecaseImpl implements IGetLocationsUsecase {
  final IRepository repository;

  GetLocationsUsecaseImpl({required this.repository});

  @override
  Future<Either<IFailures, List<LocationsEntity>>> call(
      {required String companyId}) async {
    try {
      final response = await repository.getLocations(companyId: companyId);

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
