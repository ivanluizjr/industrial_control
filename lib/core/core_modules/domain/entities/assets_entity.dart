class AssetsEntity {
  String id;
  String? locationId;
  String name;
  String? parentId;
  String? sensorType;
  String? status;

  AssetsEntity({
    required this.id,
    this.locationId,
    required this.name,
    this.parentId,
    this.sensorType,
    this.status,
  });

  factory AssetsEntity.fromMap(Map<String, dynamic> map) {
    return AssetsEntity(
      id: map['id'],
      locationId: map['locationId'],
      name: map['name'],
      parentId: map['parentId'],
      sensorType: map['sensorType'],
      status: map['status'],
    );
  }
}
