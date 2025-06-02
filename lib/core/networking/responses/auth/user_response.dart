import 'package:coach/core/networking/network-mappers.dart';
import 'package:coach/core/networking/responses/auth/user_model.dart';

class UserResponse extends BaseMappable {
  bool? status;
  UserModel? data;

  UserResponse({
    this.status,
    this.data,
  });

  @override
  Mappable fromJson(Map<String, dynamic> json) => UserResponse(
        status: json["status"],
        data: UserModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}
