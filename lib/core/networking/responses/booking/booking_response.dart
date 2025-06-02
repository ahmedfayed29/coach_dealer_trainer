import 'package:coach/core/networking/network-mappers.dart';

import 'booking_model.dart';

class BookingResponse extends BaseMappable {
  bool? status;
  List<BookingModel>? data;

  BookingResponse({
    this.status,
    this.data,
  });

  @override
  Mappable fromJson(Map<String, dynamic> json) => BookingResponse(
        status: json["status"],
        data: List<BookingModel>.from(json["data"].map((x) => BookingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
