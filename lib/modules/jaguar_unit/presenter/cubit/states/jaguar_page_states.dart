import 'package:tractian/core/core_modules/domain/entities/assets_entity.dart';
import 'package:tractian/core/core_modules/domain/entities/locations_entity.dart';

abstract interface class IJaguarPageStates {
  final List<AssetsEntity> assets;
  final List<LocationsEntity> locations;

  IJaguarPageStates({
    required this.assets,
    required this.locations,
  });
}

class JaguarPageInitialState implements IJaguarPageStates {
  @override
  // TODO: implement assets
  List<AssetsEntity> get assets => [];

  @override
  // TODO: implement locations
  List<LocationsEntity> get locations => [];
}

class JaguarPageLoadingState implements IJaguarPageStates {
  @override
  // TODO: implement assets
  List<AssetsEntity> get assets => [];

  @override
  // TODO: implement locations
  List<LocationsEntity> get locations => [];
}

class JaguarPageSuccessState implements IJaguarPageStates {
  @override
  final List<AssetsEntity> assets;
  @override
  final List<LocationsEntity> locations;

  JaguarPageSuccessState({
    required this.assets,
    required this.locations,
  });
}

class JaguarPageErrorState implements IJaguarPageStates {
  final String message;

  JaguarPageErrorState({
    required this.message,
  });

  @override
  // TODO: implement assets
  List<AssetsEntity> get assets => [];

  @override
  // TODO: implement locations
  List<LocationsEntity> get locations => [];
}
