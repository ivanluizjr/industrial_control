import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/core/%20routes/routes.dart';
import 'package:tractian/core/core_modules/cubit/companies_cubit.dart';
import 'package:tractian/core/core_modules/cubit/states/companies_state.dart';
import 'package:tractian/core/di/service_locator.dart';
import 'package:tractian/core/themes/extensions/color_theme_extension.dart';
import 'package:tractian/core/widgets/button_companies_widget.dart';
import 'package:tractian/core/widgets/image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CompaniesCubit _companiesCubit;

  @override
  void initState() {
    super.initState();
    _companiesCubit = sl<CompaniesCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _companiesCubit.getCompanies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.appColors.darkBlue,
        title: ImageWidget.logoTractianAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Center(
          child: BlocBuilder(
            bloc: _companiesCubit,
            builder: (context, state) => Column(
              children: [
                ButtonCompaniesWidget(
                  titleCompanie: state is CompaniesSuccessState
                      ? state.companies[0].name
                      : 'Jaguar Unit',
                  onPressed: () => Navigator.pushNamed(
                    context,
                    Routes.jaguarPage,
                    arguments: state is CompaniesSuccessState
                        ? state.companies[0]
                        : null,
                  ),
                ),
                const SizedBox(height: 40.0),
                ButtonCompaniesWidget(
                  titleCompanie: state is CompaniesSuccessState
                      ? state.companies[1].name
                      : 'Tobias Unit',
                  onPressed: () => Navigator.pushNamed(
                    context,
                    Routes.tobiasPage,
                    arguments: state is CompaniesSuccessState
                        ? state.companies[1]
                        : null,
                  ),
                ),
                const SizedBox(height: 40.0),
                ButtonCompaniesWidget(
                  titleCompanie: state is CompaniesSuccessState
                      ? state.companies[2].name
                      : 'Apex Unit',
                  onPressed: () => Navigator.pushNamed(
                    context,
                    Routes.apexPage,
                    arguments: state is CompaniesSuccessState
                        ? state.companies[2]
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
