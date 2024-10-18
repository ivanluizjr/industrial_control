import 'package:tractian/core/core_modules/domain/entities/assets_entity.dart';
import 'package:tractian/core/core_modules/domain/failures/failures.dart';
import 'package:tractian/core/core_modules/domain/repositories/repository.dart';
import 'package:tractian/core/types/type.dart';
import 'package:tractian/core/widgets/either.dart';

sealed class IGetAssetsUsecase {
  Future<Either<IFailures, List<AssetsEntity>>> call(
      {required String companyId});
}

class GetAssetsUsecaseImpl implements IGetAssetsUsecase {
  final IRepository repository;

  GetAssetsUsecaseImpl({required this.repository});

  @override
  Future<Either<IFailures, List<AssetsEntity>>> call(
      {required String companyId}) async {
    try {
      final response = await repository.getAssets(companyId: companyId);

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
