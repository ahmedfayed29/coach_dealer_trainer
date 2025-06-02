import 'network-mappers.dart';

class NetworkResponse<T> {
  final T body;

  final bool isRequestSuccess;
  final String errorMessage;

  NetworkResponse(this.body, this.isRequestSuccess, this.errorMessage);
}

///
class BoolResponse extends BaseMappable {
   bool? resBool;

  BoolResponse({this.resBool});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    resBool = json['isSuccess'] ?? false;

    return BoolResponse(resBool: resBool);
  }
}
