class LocationsEntity {
  String id;
  String name;
  String? parentId;

  LocationsEntity({
    required this.id,
    required this.name,
    this.parentId,
  });

  factory LocationsEntity.fromMap(Map<String, dynamic> map) {
    return LocationsEntity(
      id: map['id'],
      name: map['name'],
      parentId: map['parentId'],
    );
  }
}
