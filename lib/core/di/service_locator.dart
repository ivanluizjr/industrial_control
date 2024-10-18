import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tractian/core/core_modules/cubit/companies_cubit.dart';
import 'package:tractian/core/core_modules/data/datasources/datasoruce.dart';
import 'package:tractian/core/core_modules/data/datasources/implementation/datasource_impl.dart';
import 'package:tractian/core/core_modules/data/repositories/repository_impl.dart';
import 'package:tractian/core/core_modules/domain/repositories/repository.dart';
import 'package:tractian/core/core_modules/domain/usecases/get_assets_usecase.dart';
import 'package:tractian/core/core_modules/domain/usecases/get_companies_usecase.dart';
import 'package:tractian/core/core_modules/domain/usecases/get_locations_usecase.dart';
import 'package:tractian/core/env/env.dart';
import 'package:tractian/core/services/dio/http_client_dio_service_impl.dart';
import 'package:tractian/core/services/http_client_service.dart';
import 'package:tractian/core/services/internet_connection/internet_connection_service.dart';
import 'package:tractian/core/services/internet_connection/internet_connection_service_impl.dart';
import 'package:tractian/modules/jaguar_unit/presenter/cubit/jaguar_page_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init(Env env) async {
    await _services(env);
    await _injectableData();
    await _injectableRepositories();
    await _injectableUseCases();
    await _cubits();
  }

  static Future<void> _services(Env env) async {
    sl.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: env.baseUrl,
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 3000),
        ),
      ),
    );

    sl.registerLazySingleton<IInternetConnectionService>(
      () => InternetConnecionServiceImpl(),
    );

    sl.registerLazySingleton<IHttpClientService>(
      () => HttpClientDioServiceImpl(
        dio: sl(),
        internetConnectionService: sl(),
      ),
    );
  }

  static Future<void> _injectableData() async {
    sl.registerLazySingleton<IDataSource>(
      () => DataSourceImpl(
        httpClientService: sl(),
      ),
    );
  }

  static Future<void> _injectableRepositories() async {
    sl.registerLazySingleton<IRepository>(
      () => RepositoryImpl(
        dataSource: sl(),
      ),
    );
  }

  static Future<void> _injectableUseCases() async {
    sl.registerLazySingleton<IGetCompaniesUsecase>(
      () => GetCompaniesUsecaseImpl(
        repository: sl(),
      ),
    );
    sl.registerLazySingleton<IGetLocationsUsecase>(
      () => GetLocationsUsecaseImpl(
        repository: sl(),
      ),
    );
    sl.registerLazySingleton<IGetAssetsUsecase>(
      () => GetAssetsUsecaseImpl(
        repository: sl(),
      ),
    );
  }

  static Future<void> _cubits() async {
    sl.registerFactory<CompaniesCubit>(
      () => CompaniesCubit(
        getCompaniesUsecase: sl(),
      ),
    );

    sl.registerFactory<JaguarPageCubit>(
      () => JaguarPageCubit(
        getAssetsUsecase: sl(),
        getLocationsUsecase: sl(),
      ),
    );
  }
}
