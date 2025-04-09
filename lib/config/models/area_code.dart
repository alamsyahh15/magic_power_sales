class AreaCode {
  final int id;
  final String idArea;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  AreaCode({
    required this.id,
    required this.idArea,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AreaCode.fromJson(Map<String, dynamic> json) => AreaCode(
        id: json["id"],
        idArea: json["id_area"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_area": idArea,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
