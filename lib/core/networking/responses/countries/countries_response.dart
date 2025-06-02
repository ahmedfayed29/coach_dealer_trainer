import 'package:coach/core/networking/network-mappers.dart';

import 'country_model.dart';

class CountriesResponse extends BaseMappable {
  bool? status;
  List<CountryModel>? data;

  CountriesResponse({this.status, this.data});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CountryModel>[];
      json['data'].forEach((v) {
        data!.add(CountryModel.fromJson(v));
      });
    }
    return CountriesResponse(
      status: status,
      data: data,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
