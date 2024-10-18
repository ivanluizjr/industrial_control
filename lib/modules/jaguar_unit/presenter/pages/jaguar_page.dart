import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/core/core_modules/domain/entities/companies_entity.dart';
import 'package:tractian/core/di/service_locator.dart';
import 'package:tractian/core/themes/extensions/color_theme_extension.dart';
import 'package:tractian/core/widgets/image_widget.dart';
import 'package:tractian/core/widgets/text_field_search_widget.dart';
import 'package:tractian/core/widgets/text_widget.dart';
import 'package:tractian/core/widgets/tree_node_wedget.dart';
import 'package:tractian/modules/jaguar_unit/presenter/cubit/jaguar_page_cubit.dart';
import 'package:tractian/modules/jaguar_unit/presenter/cubit/states/jaguar_page_states.dart';

class JaguarPage extends StatefulWidget {
  final CompaniesEntity company;

  const JaguarPage({
    super.key,
    required this.company,
  });

  @override
  State<JaguarPage> createState() => _JaguarPageState();
}

class _JaguarPageState extends State<JaguarPage> {
  late final JaguarPageCubit _jaguarPageCubit;
  final Map<String, bool> expandedNodes = {};

  @override
  void initState() {
    super.initState();
    _jaguarPageCubit = sl<JaguarPageCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _jaguarPageCubit.getAssets(companyId: widget.company.id);
      await _jaguarPageCubit.getLocations(companyId: widget.company.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          child: IconButton(
            icon: ImageWidget.iconBack(),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: context.appColors.darkBlue,
        centerTitle: true,
        title: TextWidget(
          text: widget.company.name,
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
          colorText: context.appColors.white,
        ),
      ),
      body: BlocBuilder(
        bloc: _jaguarPageCubit,
        builder: <IJaguarPageState>(contextBlocBuilder, state) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: TextFieldSearchWidget.search(
                controller: _jaguarPageCubit.searchController,
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                hintText: 'Buscar Ativo ou Local',
                colorHintStyle: context.appColors.greyNeutral,
                colorIcon: context.appColors.greyNeutral,
                iconWidget: ImageWidget.iconSearch(),
                onChanged: (name) {
                  _jaguarPageCubit.filterTree(name);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.locations.length + state.assets.length,
                itemBuilder: (contextListView, index) {
                  final locations = state.locations[index];
                  final assets = state.assets[index];
                  return TreeNodeWidget(
                    leadingIcon: ImageWidget.iconExpand(),
                    trailingIcon: ImageWidget.iconLocations(),
                    title: state is JaguarPageSuccessState
                        ? locations[3].first.name
                        : '',
                    isExpanded: state is JaguarPageSuccessState
                        ? _jaguarPageCubit.isExpanded(locations.name[3])
                        : false,
                    onToggleExpand: () => _jaguarPageCubit.toggleExpand(
                      locations.name[3],
                    ),
                    children: [
                      TreeNodeWidget(
                        leadingIcon: ImageWidget.iconExpand(),
                        trailingIcon: ImageWidget.iconLocations(),
                        title: state is JaguarPageSuccessState
                            ? locations.name[0]
                            : '',
                        isExpanded: state is JaguarPageSuccessState
                            ? _jaguarPageCubit.isExpanded(locations.name[0])
                            : false,
                        onToggleExpand: () => _jaguarPageCubit.toggleExpand(
                          locations.name[0],
                        ),
                        children: [
                          TreeNodeWidget(
                            leadingIcon: ImageWidget.iconExpand(),
                            trailingIcon: ImageWidget.iconAssets(),
                            title: state is JaguarPageSuccessState
                                ? assets.name[0]
                                : '',
                            isExpanded: state is JaguarPageSuccessState
                                ? _jaguarPageCubit.isExpanded(assets.name[0])
                                : false,
                            onToggleExpand: () => _jaguarPageCubit.toggleExpand(
                              assets.name[0],
                            ),
                            children: [
                              TreeNodeWidget(
                                leadingIcon: ImageWidget.iconExpand(),
                                trailingIcon: ImageWidget.iconAssets(),
                                title: state is JaguarPageSuccessState
                                    ? assets.name[4]
                                    : '',
                                isExpanded: state is JaguarPageSuccessState
                                    ? _jaguarPageCubit
                                        .isExpanded(assets.name[4])
                                    : false,
                                onToggleExpand: () =>
                                    _jaguarPageCubit.toggleExpand(
                                  assets.name[4],
                                ),
                                children: [
                                  TreeNodeWidget(
                                    leadingIcon: Container(),
                                    trailingIcon: ImageWidget.iconComponents(),
                                    rightIcon: ImageWidget.iconBolt(),
                                    title: state is JaguarPageSuccessState
                                        ? assets.name[3]
                                        : '',
                                    isExpanded: state is JaguarPageSuccessState
                                        ? _jaguarPageCubit
                                            .isExpanded(assets.name[3])
                                        : false,
                                    onToggleExpand: () =>
                                        _jaguarPageCubit.toggleExpand(
                                      assets.name[3],
                                    ),
                                    children: const [],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      TreeNodeWidget(
                        leadingIcon: ImageWidget.iconExpand(),
                        trailingIcon: ImageWidget.iconLocations(),
                        title: state is JaguarPageSuccessState
                            ? _jaguarPageCubit.locations[2].name
                            : '',
                        isExpanded: state is JaguarPageSuccessState
                            ? _jaguarPageCubit
                                .isExpanded(_jaguarPageCubit.locations[2].name)
                            : false,
                        onToggleExpand: () => _jaguarPageCubit.toggleExpand(
                          _jaguarPageCubit.locations[2].name,
                        ),
                        children: [
                          TreeNodeWidget(
                            leadingIcon: ImageWidget.iconExpand(),
                            trailingIcon: ImageWidget.iconAssets(),
                            title: state is JaguarPageSuccessState
                                ? _jaguarPageCubit.assets[8].name
                                : '',
                            isExpanded: state is JaguarPageSuccessState
                                ? _jaguarPageCubit
                                    .isExpanded(_jaguarPageCubit.assets[8].name)
                                : false,
                            onToggleExpand: () => _jaguarPageCubit.toggleExpand(
                              _jaguarPageCubit.assets[8].name,
                            ),
                            children: [
                              TreeNodeWidget(
                                leadingIcon: const SizedBox(),
                                trailingIcon: ImageWidget.iconComponents(),
                                rightIcon: ImageWidget.iconCritical(),
                                title: state is JaguarPageSuccessState
                                    ? _jaguarPageCubit.assets[5].name
                                    : '',
                                isExpanded: state is JaguarPageSuccessState
                                    ? _jaguarPageCubit.isExpanded(
                                        _jaguarPageCubit.assets[5].name)
                                    : false,
                                onToggleExpand: () =>
                                    _jaguarPageCubit.toggleExpand(
                                  _jaguarPageCubit.assets[5].name,
                                ),
                                children: const [],
                              ),
                              TreeNodeWidget(
                                leadingIcon: const SizedBox(),
                                trailingIcon: ImageWidget.iconComponents(),
                                rightIcon: ImageWidget.iconCritical(),
                                title: state is JaguarPageSuccessState
                                    ? _jaguarPageCubit.assets[6].name
                                    : '',
                                isExpanded: state is JaguarPageSuccessState
                                    ? _jaguarPageCubit.isExpanded(
                                        _jaguarPageCubit.assets[6].name)
                                    : false,
                                onToggleExpand: () =>
                                    _jaguarPageCubit.toggleExpand(
                                  _jaguarPageCubit.assets[6].name,
                                ),
                                children: const [],
                              ),
                              TreeNodeWidget(
                                leadingIcon: const SizedBox(),
                                trailingIcon: ImageWidget.iconComponents(),
                                rightIcon: ImageWidget.iconCritical(),
                                title: state is JaguarPageSuccessState
                                    ? _jaguarPageCubit.assets[7].name
                                    : '',
                                isExpanded: state is JaguarPageSuccessState
                                    ? _jaguarPageCubit.isExpanded(
                                        _jaguarPageCubit.assets[7].name)
                                    : false,
                                onToggleExpand: () =>
                                    _jaguarPageCubit.toggleExpand(
                                  _jaguarPageCubit.assets[7].name,
                                ),
                                children: const [],
                              ),
                            ],
                          ),
                        ],
                      ),
                      TreeNodeWidget(
                        leadingIcon: const SizedBox(),
                        trailingIcon: ImageWidget.iconLocations(),
                        title: state is JaguarPageSuccessState
                            ? _jaguarPageCubit.locations[1].name.toUpperCase()
                            : '',
                        isExpanded: state is JaguarPageSuccessState
                            ? _jaguarPageCubit
                                .isExpanded(_jaguarPageCubit.locations[1].name)
                            : false,
                        onToggleExpand: () => _jaguarPageCubit.toggleExpand(
                          _jaguarPageCubit.locations[1].name,
                        ),
                        children: const [],
                      ),
                      TreeNodeWidget(
                        leadingIcon: const SizedBox(),
                        trailingIcon: ImageWidget.iconComponents(),
                        rightIcon: ImageWidget.iconBolt(),
                        title: state is JaguarPageSuccessState
                            ? _jaguarPageCubit.assets[1].name
                            : '',
                        isExpanded: state is JaguarPageSuccessState
                            ? _jaguarPageCubit
                                .isExpanded(_jaguarPageCubit.assets[1].name)
                            : false,
                        onToggleExpand: () => _jaguarPageCubit.toggleExpand(
                          _jaguarPageCubit.assets[1].name,
                        ),
                        children: const [],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
