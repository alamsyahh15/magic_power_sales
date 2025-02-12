class Distributor {
  int? id;
  String? distributionId;
  String? distributionName;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;

  Distributor({
    this.id,
    this.distributionId,
    this.distributionName,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  Distributor copyWith({
    int? id,
    String? distributionId,
    String? distributionName,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? publishedAt,
  }) =>
      Distributor(
        id: id ?? this.id,
        distributionId: distributionId ?? this.distributionId,
        distributionName: distributionName ?? this.distributionName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        publishedAt: publishedAt ?? this.publishedAt,
      );

  factory Distributor.fromJson(Map<String, dynamic> json) => Distributor(
        id: json["id"],
        distributionId: json["distribution_id"],
        distributionName: json["distribution_name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "distribution_id": distributionId,
        "distribution_name": distributionName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}
