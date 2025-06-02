import 'package:coach/core/networking/responses/auth/user_model.dart';
import 'package:get_storage/get_storage.dart';

import 'caching_keys.dart';

class PreferenceManager {
  void saveIsLoggedIn(bool loginStatus) => GetStorage().write(CachingKey.IS_LOGGED_IN, loginStatus);

  bool isLoggedIn() => GetStorage().read(CachingKey.IS_LOGGED_IN) as bool? ?? false;

  void saveIsFirstTime(bool isFirstTime) =>
      GetStorage().write(CachingKey.IS_FIRTS_TIME, isFirstTime);

  bool isFirstTime() => GetStorage().read(CachingKey.IS_FIRTS_TIME) as bool? ?? true;

  void saveAuthToken(String authToken) =>
      GetStorage().write(CachingKey.AUTH_TOKEN, authToken != '' ? "Bearer $authToken" : '');

  String authToken() => GetStorage().read(CachingKey.AUTH_TOKEN) as String? ?? "";

  void saveUser(UserModel userData) => GetStorage().write(CachingKey.USER, userData.toJson());
  UserModel getUser() => UserModel.fromJson(GetStorage().read(CachingKey.USER));

  void saveValue(String cachingKey, String value) => GetStorage().write(cachingKey, value);

  String getValue(String cachingKey) => GetStorage().read(cachingKey) as String;

  void saveLanguage(String lang) => GetStorage().write(CachingKey.LANGUAGE, lang);

  String currentLang() => GetStorage().read(CachingKey.LANGUAGE) as String? ?? "en";

  void logout() {
    GetStorage().erase();
  }
}
