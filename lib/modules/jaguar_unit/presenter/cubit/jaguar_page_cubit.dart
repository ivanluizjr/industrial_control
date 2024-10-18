import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/core/core_modules/domain/entities/assets_entity.dart';
import 'package:tractian/core/core_modules/domain/entities/locations_entity.dart';
import 'package:tractian/core/core_modules/domain/usecases/get_assets_usecase.dart';
import 'package:tractian/core/core_modules/domain/usecases/get_locations_usecase.dart';
import 'package:tractian/modules/jaguar_unit/presenter/cubit/states/jaguar_page_states.dart';

class JaguarPageCubit extends Cubit<IJaguarPageStates> {
  final IGetLocationsUsecase _getLocationsUsecase;
  final IGetAssetsUsecase _getAssetsUsecase;

  JaguarPageCubit({
    required IGetLocationsUsecase getLocationsUsecase,
    required IGetAssetsUsecase getAssetsUsecase,
  })  : _getLocationsUsecase = getLocationsUsecase,
        _getAssetsUsecase = getAssetsUsecase,
        super(JaguarPageInitialState());

  List<AssetsEntity> assets = [];
  List<LocationsEntity> locations = [];
  List<String> expandedNodes = [];

  final TextEditingController searchController = TextEditingController();

  Future<void> getAssets({required companyId}) async {
    emit(JaguarPageLoadingState());

    final response = await _getAssetsUsecase(companyId: companyId);

    response.fold(
      onLeft: (error) => emit(
        JaguarPageErrorState(message: error.message),
      ),
      onRight: (data) {
        assets = data;
        emit(
          JaguarPageSuccessState(
            assets: assets,
            locations: locations,
          ),
        );
      },
    );
  }

  Future<void> getLocations({required companyId}) async {
    emit(JaguarPageLoadingState());

    final response = await _getLocationsUsecase(companyId: companyId);

    response.fold(
      onLeft: (error) => emit(
        JaguarPageErrorState(message: error.message),
      ),
      onRight: (data) {
        locations = data;
        emit(
          JaguarPageSuccessState(
            assets: assets,
            locations: locations,
          ),
        );
      },
    );
  }

  void filterTree(String name) {
    expandedNodes.clear();

    if (name.isEmpty) {
      emit(
        JaguarPageSuccessState(
          assets: assets,
          locations: locations,
        ),
      );
      return;
    }

    final lowerQuery = name.toLowerCase();

    final filteredAssets = assets
        .where(
          (asset) => asset.name.toLowerCase().contains(
                lowerQuery,
              ),
        )
        .toList();
    final filteredLocations = locations
        .where(
          (location) => location.name.toLowerCase().contains(
                lowerQuery,
              ),
        )
        .toList();

    for (final location in filteredLocations) {
      _expandParents(location);
    }

    for (final assets in filteredAssets) {
      _expandParents(assets);
    }

    emit(
      JaguarPageSuccessState(
        assets: assets,
        locations: locations,
      ),
    );
  }

  void _expandParents(dynamic node) {
    if (node is LocationsEntity) {
      expandedNodes.add(node.name);
      if (node.name.isNotEmpty) {
        final name = locations.firstWhere(
          (name) => name.name == node.name,
        );
        if (name.id.isNotEmpty) {
          _expandParents(name);
        }
      }
    } else if (node is AssetsEntity) {
      expandedNodes.add(node.name);
      if (node.id.isNotEmpty) {
        _expandParents(node.name);
      }
    }
  }

  bool isExpanded(String name) {
    return expandedNodes.contains(name);
  }

  void toggleExpand(String name) {
    if (expandedNodes.contains(name)) {
      expandedNodes.remove(name);
    } else {
      expandedNodes.add(name);
    }
    emit(
      JaguarPageSuccessState(
        assets: assets,
        locations: locations,
      ),
    );
  }
}
