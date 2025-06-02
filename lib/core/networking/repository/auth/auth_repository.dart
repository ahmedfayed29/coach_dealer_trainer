import 'package:coach/core/networking/responses/auth/user_response.dart';
import 'package:dio/dio.dart';

import '../../../caching/preference_manager.dart';
import '../../dot/complete_profile.dart';
import '../../network_response.dart';
import '../../responses/countries/countries_response.dart';
import '../../responses/global_response.dart';
import '../../responses/sports/sports_response.dart';
import '../base_repository.dart';

class AuthRepository extends BaseRepository {
  /// End Points
  final String _loginEndPoint = '/coach/auth/login';
  final String _completeProfileEndPoint = '/coach/auth/profile';
  final String _registerEndPoint = '/coach/auth/register';
  final String _checkOTPEndPoint = '/coach/auth/verify-code';
  final String _getCountriesEndPoint = '/countries';
  final String _getSportsEndPoint = '/sports';
  final String _profileEndPoint = '/coach/auth/profile';
  final String _logout = '/coach/auth/logout';

  /// Login
  Future<NetworkResponse<GlobalResponse>> login({
    required String phone,
    required String countryCode,
  }) async {
    body = {"phone": phone, "country_code": countryCode, "fcm_token": "sdsdssd"};

    return networkHandler.post<GlobalResponse>(
      GlobalResponse(),
      _loginEndPoint,
      body: body,
    );
  }

  /// Login
  Future<NetworkResponse<GlobalResponse>> logout() async {
    return networkHandler.post<GlobalResponse>(
      GlobalResponse(),
      _logout,
    );
  }

  /// Login
  Future<NetworkResponse<UserResponse>> completeProfile({
    required CompleteProfileModel updateProfileModel,
  }) async {
    final body = updateProfileModel.toJson();
    if (updateProfileModel.image.path.isNotEmpty) {
      body['image'] = await MultipartFile.fromFile(updateProfileModel.image.path);
    }
    for (int i = 0; i < updateProfileModel.gallery.length; i++) {
      body['images[$i]'] = await MultipartFile.fromFile(updateProfileModel.gallery[i].path);
    }
    return networkHandler.post<UserResponse>(
      UserResponse(),
      _completeProfileEndPoint,
      body: FormData.fromMap(body),
    );
  }

  /// Register
  Future<NetworkResponse<GlobalResponse>> register({
    required String phone,
    required String countryCode,
    required String name,
  }) async {
    body = {
      "name": name,
      "phone": phone,
      "country_code": countryCode,
      "fcm_token": "sdsdssd",
      "language": PreferenceManager().currentLang(),
    };

    return networkHandler.post<GlobalResponse>(
      GlobalResponse(),
      _registerEndPoint,
      body: body,
    );
  }

  /// Verify OTP
  Future<NetworkResponse<UserResponse>> verifyOTP({
    required String phone,
    required String countryCode,
    required String otp,
  }) async {
    body = {
      "phone": phone,
      "country_code": countryCode,
      "code": otp,
    };

    return networkHandler.post<UserResponse>(
      UserResponse(),
      _checkOTPEndPoint,
      body: body,
    );
  }

  /// Get Countries
  Future<NetworkResponse<CountriesResponse>> countries() async {
    return networkHandler.get<CountriesResponse>(
      CountriesResponse(),
      _getCountriesEndPoint,
    );
  }

  /// Get Sports
  Future<NetworkResponse<SportsResponse>> sports() async {
    return networkHandler.get<SportsResponse>(
      SportsResponse(data: []),
      _getSportsEndPoint,
    );
  }

  /// Get Profile
  Future<NetworkResponse<UserResponse>> getProfile() async {
    return networkHandler.get<UserResponse>(
      UserResponse(),
      _profileEndPoint,
    );
  }

  /// Update Profile
  Future<NetworkResponse<UserResponse>> updateProfile({
    String? name,
    String? phone,
    String? countryCode,
    String? image,
    String? tall,
    String? weight,
    String? age,
    String? healthProblems,
    String? gender,
  }) async {
    FormData body = FormData.fromMap({});
    if (name != null) body.fields.add(MapEntry('name', name));
    if (phone != null) body.fields.add(MapEntry('phone', phone));
    if (countryCode != null) body.fields.add(MapEntry('country_code', countryCode));
    if (image != null) body.files.add(MapEntry('image', await MultipartFile.fromFile(image)));
    if (tall != null) body.fields.add(MapEntry('tall', tall));
    if (weight != null) body.fields.add(MapEntry('weight', weight));
    if (age != null) body.fields.add(MapEntry('age', age));
    if (healthProblems != null) body.fields.add(MapEntry('health_problems', healthProblems));
    if (gender != null) body.fields.add(MapEntry('gender', gender));

    return networkHandler.post<UserResponse>(UserResponse(), _profileEndPoint, body: body);
  }
}
