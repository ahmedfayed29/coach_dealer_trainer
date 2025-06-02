import '../network-mappers.dart';

class GlobalResponse extends BaseMappable {
  GlobalResponse({
    this.message,
    this.isSuccess,
  });

  bool? isSuccess;
  String? message;

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    message = json['data'];
    isSuccess = json['status'];

    return GlobalResponse(isSuccess: isSuccess, message: message);
  }
}
