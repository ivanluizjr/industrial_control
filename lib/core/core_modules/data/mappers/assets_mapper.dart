import 'package:tractian/core/core_modules/domain/entities/assets_entity.dart';

class AssetsMapper {
  static AssetsEntity fromMap(Map<String, dynamic> map) {
    return AssetsEntity(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      parentId: map['parentId'],
      locationId: map['locationId'],
      sensorType: map['sensorType'],
    );
  }
}
