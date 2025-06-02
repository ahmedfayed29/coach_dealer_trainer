class CountryModel {
  int? id;
  String? name;
  String? image;
  String? countryCode;

  CountryModel({this.id, this.name, this.image, this.countryCode});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['country_code'] = countryCode;
    return data;
  }
}
