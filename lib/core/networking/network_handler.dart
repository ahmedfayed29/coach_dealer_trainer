import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../caching/preference_manager.dart';
import 'network-mappers.dart';
import 'network_response.dart';

class NetworkHandler {
  PreferenceManager preferenceManager = Get.find();

  static final NetworkHandler _singleton = NetworkHandler._internal();
  Dio dio = Dio();

  factory NetworkHandler() {
    return _singleton;
  }

  String baseUrl = "http://coach-dealer.com/api/v1";

  NetworkHandler._internal();

  Future<NetworkResponse<ResponseType>> get<ResponseType extends Mappable>(ResponseType responseType, String url, {var body}) async {
    // bool result = await InternetConnectionChecker().hasConnection;
    //
    // if( !result){
    //   return NetworkResponse<ResponseType>(Mappable(responseType, jsonEncode(ErrorResponse(error: [
    //     Error(message: "No Network Found")
    //   ]).toJson())) as ResponseType, false, "No Network Found");
    // }

    var response;
    try {
      dio.options.baseUrl = baseUrl;

      dio.options.headers = {
        // "lang":AppLocalization.localeNow.toString(),
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': preferenceManager.authToken(),
        "Accept-Language": preferenceManager.currentLang()
      };
      response = await dio.get(url, queryParameters: body);
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> post<ResponseType extends Mappable>(ResponseType responseType, String url, {var body, encoding}) async {
    // bool result = await InternetConnectionChecker().hasConnection;
    //
    // if( !result){
    //   return NetworkResponse<ResponseType>(Mappable(responseType, jsonEncode(ErrorResponse(error: [
    //     Error(message: "No Network Found")
    //   ]).toJson())) as ResponseType, false, "No Network Found");
    // }

    var response;
    dio.options.baseUrl = baseUrl;

    try {
      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': preferenceManager.authToken(),
        "Accept-Language": preferenceManager.currentLang()
      };
      print(body);
      response = await dio.post(url, data: body, options: Options(requestEncoder: encoding));
    } on DioError catch (e) {
      print(e.toString());
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> update<ResponseType extends Mappable>(ResponseType responseType, String url, {var body, encoding}) async {
    // bool result = await InternetConnectionChecker().hasConnection;
    //
    // if( !result){
    //   return NetworkResponse<ResponseType>(Mappable(responseType, jsonEncode(ErrorResponse(error: [
    //     Error(message: "No Network Found")
    //   ]).toJson())) as ResponseType, false, "No Network Found");
    // }

    var response;
    dio.options.baseUrl = baseUrl;

    dio.options.headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': preferenceManager.authToken(),
      "Accept-Language": preferenceManager.currentLang()
    };
    try {
      response = await dio.patch(url, data: body, options: Options(requestEncoder: encoding));
    } on DioError catch (e) {
      print(e.toString());
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> put<ResponseType extends Mappable>(ResponseType responseType, String url, {var body, encoding}) async {
    // bool result = await InternetConnectionChecker().hasConnection;
    //
    // if( !result){
    //   return NetworkResponse<ResponseType>(Mappable(responseType, jsonEncode(ErrorResponse(error: [
    //     Error(message: "No Network Found")
    //   ]).toJson())) as ResponseType, false, "No Network Found");
    // }

    var response;
    dio.options.baseUrl = baseUrl;
    try {
      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': preferenceManager.authToken(),
        "Accept-Language": preferenceManager.currentLang()
      };

      response = await dio.put(url, data: body, options: Options(requestEncoder: encoding));
    } on DioError catch (e) {
      print(e.toString());
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  Future<NetworkResponse<ResponseType>> delete<ResponseType extends Mappable>(ResponseType responseType, String url, {var body, encoding}) async {
    // bool result = await InternetConnectionChecker().hasConnection;
    //
    // if( !result){
    //   return NetworkResponse<ResponseType>(Mappable(responseType, jsonEncode(ErrorResponse(error: [
    //     Error(message: "No Network Found")
    //   ]).toJson())) as ResponseType, false, "No Network Found");
    // }

    var response;

    dio.options.baseUrl = baseUrl;

    try {
      dio.options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': preferenceManager.authToken(),
        "Accept-Language": preferenceManager.currentLang()
      };

      response = await dio.delete(url, data: body, options: Options(requestEncoder: encoding));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse<ResponseType>(response, responseType);
  }

  NetworkResponse<ResponseType> handleResponse<ResponseType extends Mappable>(Response response, ResponseType responseType) {
    try {
      final int statusCode = response.statusCode!;
      print("Status Code is$statusCode");

      if (statusCode >= 200 && statusCode < 300) {
        print("correrct request: " + response.toString());
        if (responseType is ListMappable) {
          return NetworkResponse<ResponseType>(Mappable(responseType, response.data) as ResponseType, true, "");
        } else {
          return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, true, "");
        }
      } else if (statusCode == 401) {
        print("request errorckck: " + response.toString());
        // Get.offAllNamed(Routes.LOGIN);
        return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, false, response.statusMessage!);
      } else if (statusCode == 404) {
        print("request errorckck: " + response.toString());
        return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, false, response.statusMessage!);
      } else {
        print("request error: " + response.toString());
        return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, false, response.data['msg']);
      }
    } on DioError catch (e) {
      print(e.toString());
      // if (e.response != null) {
      //   response = e.response;
      // }
      return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, false, e.message ?? "An error occurred");
    } catch (e) {
      return NetworkResponse<ResponseType>(Mappable(responseType, response) as ResponseType, false, e.toString());
    }
  }
}
