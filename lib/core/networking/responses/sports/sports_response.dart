import 'package:coach/core/networking/responses/sports/sports_model.dart';

import '../../network-mappers.dart';

class SportsResponse extends BaseMappable {
  bool status;
  List<SportsModel> data;

  SportsResponse({
    this.status = false,
    required this.data,
  });

  @override
  Mappable fromJson(Map<String, dynamic> json) => SportsResponse(
        status: json["status"],
        data: List<SportsModel>.from(json["data"].map((x) => SportsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
