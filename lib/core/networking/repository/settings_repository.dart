import 'package:coach/core/networking/responses/global_response.dart';

import '../network_response.dart';
import '../responses/settings_response.dart';
import 'base_repository.dart';

class SettingsRepository extends BaseRepository {
  /// Settings
  Future<NetworkResponse<SettingsResponse>> getSettings() async {
    return networkHandler.get<SettingsResponse>(SettingsResponse(), "/settings");
  }

  Future<NetworkResponse<GlobalResponse>> sendContactUs({
    required String name,
    required String email,
    required String message,
  }) async {
    body = {
      "name": name,
      "email": email,
      "message": message,
    };
    return networkHandler.post<GlobalResponse>(GlobalResponse(), "/contact", body: body);
  }
}
