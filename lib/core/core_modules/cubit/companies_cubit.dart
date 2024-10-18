import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/core/core_modules/cubit/states/companies_state.dart';
import 'package:tractian/core/core_modules/domain/entities/companies_entity.dart';
import 'package:tractian/core/core_modules/domain/usecases/get_companies_usecase.dart';

class CompaniesCubit extends Cubit<ICompaniesState> {
  final IGetCompaniesUsecase _getCompaniesUsecase;

  CompaniesCubit({required IGetCompaniesUsecase getCompaniesUsecase})
      : _getCompaniesUsecase = getCompaniesUsecase,
        super(CompaniesInitialState());

  List<CompaniesEntity> companies = [];

  Future<void> getCompanies() async {
    emit(CompaniesLoadingState());

    final response = await _getCompaniesUsecase(companies: companies);

    response.fold(
      onLeft: (error) => emit(
        CompaniesErrorState(message: error.message),
      ),
      onRight: (data) {
        companies = data;
        emit(
          CompaniesSuccessState(companies: companies),
        );
      },
    );
  }
}
