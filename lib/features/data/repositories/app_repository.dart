import 'package:dio/dio.dart';
import 'package:tz_auth/features/data/data_source/api_data_source/auth_api.dart';
import 'package:tz_auth/features/data/data_source/api_data_source/auth_code_api.dart';
import 'package:tz_auth/features/data/data_source/api_data_source/update_api.dart';
import 'package:tz_auth/features/data/dio_settings.dart';

class AppRepository {
  AppRepository() {
    _dio = _getDio();

    /// ИНИЦИАЛИЗИЯ РЕПОЗИТОРИЕВ
    authApi = AuthApi(
      dio: _dio,
    );
    authCodeApi = AuthCodeApi(
      dio: _dio,
    );
    updateApi = UpdateApi(
      dio: _dio,
    );
  }

  late Dio _dio;
  late AuthApi authApi;
  late AuthCodeApi authCodeApi;
  late UpdateApi updateApi;

  Dio _getDio() {
    final apiSettings = DioSettings();
    return apiSettings.dio;
  }
}
