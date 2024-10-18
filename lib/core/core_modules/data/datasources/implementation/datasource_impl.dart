import 'package:tractian/core/core_modules/data/datasources/datasoruce.dart';
import 'package:tractian/core/core_modules/domain/entities/companies_entity.dart';
import 'package:tractian/core/core_modules/domain/failures/failures.dart';
import 'package:tractian/core/services/http_client_service.dart';
import 'package:tractian/core/types/type.dart';

class DataSourceImpl implements IDataSource {
  final IHttpClientService httpClientService;

  DataSourceImpl({required this.httpClientService});

  @override
  Future<List<Map<String, dynamic>>> getAssets(
      {required String companyId}) async {
    try {
      final response =
          await httpClientService.get('/companies/$companyId/assets');

      final data = List<Map<String, dynamic>>.from(response.data);

      return data;
    } catch (error, stackTrace) {
      throw Failures(
        message: error.toString(),
        stackTrace: stackTrace,
        type: FailureType.serverError,
      );
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCompanies(
      {required List<CompaniesEntity> companies}) async {
    try {
      final response = await httpClientService.get('/companies');

      final data = List<Map<String, dynamic>>.from(response.data);

      return data;
    } catch (error, stackTrace) {
      throw Failures(
        message: error.toString(),
        stackTrace: stackTrace,
        type: FailureType.serverError,
      );
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getLocations(
      {required String companyId}) async {
    try {
      final response =
          await httpClientService.get('/companies/$companyId/locations');

      final data = List<Map<String, dynamic>>.from(response.data);

      return data;
    } catch (error, stackTrace) {
      throw Failures(
        message: error.toString(),
        stackTrace: stackTrace,
        type: FailureType.serverError,
      );
    }
  }
}
