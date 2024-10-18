class CompaniesEntity {
  String id;
  String name;

  CompaniesEntity({
    required this.id,
    required this.name,
  });

  factory CompaniesEntity.fromMap(Map<String, dynamic> map) {
    return CompaniesEntity(
      id: map['id'],
      name: map['name'],
    );
  }
}
