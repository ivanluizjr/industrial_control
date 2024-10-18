import 'package:tractian/core/core_modules/domain/entities/companies_entity.dart';

abstract interface class ICompaniesState {}

class CompaniesInitialState implements ICompaniesState {}

class CompaniesLoadingState implements ICompaniesState {}

class CompaniesSuccessState implements ICompaniesState {
  final List<CompaniesEntity> companies;

  CompaniesSuccessState({
    required this.companies,
  });
}

class CompaniesErrorState implements ICompaniesState {
  final String message;

  CompaniesErrorState({
    required this.message,
  });
}
