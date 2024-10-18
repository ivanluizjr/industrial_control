import 'package:tractian/core/core_modules/domain/entities/locations_entity.dart';

class LocationsMapper {
  static LocationsEntity fromMap(Map<String, dynamic> map) {
    return LocationsEntity(
      id: map['id'],
      name: map['name'],
      parentId: map['parentId'],
    );
  }
}
