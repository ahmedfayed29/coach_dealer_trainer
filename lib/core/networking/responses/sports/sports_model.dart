class SportsModel {
  int? id;
  String? name;

  SportsModel({
    this.id,
    this.name,
  });

  factory SportsModel.fromJson(Map<String, dynamic> json) => SportsModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
