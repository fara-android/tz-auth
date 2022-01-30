import 'package:dio/dio.dart';
import 'package:tz_auth/core/app_error.dart';
import 'package:tz_auth/core/extensions.dart';
import 'package:tz_auth/features/data/model/auth_model.dart';
import 'package:tz_auth/features/domain/entities/auth_email_entity/auth_entity.dart';
import 'package:tz_auth/features/domain/results/repo_auth_result.dart';

class AuthApi {
  final Dio dio;
  AuthApi({required this.dio});

  Future<RepoAuthResult> getSms({required String email}) async {
    try {
      final result = await dio.post(
        'app/code',
        data: {"login": email},
      );
      return RepoAuthResult(result: AuthEntity().fromJson(result.data));
    } catch (error) {
      return RepoAuthResult(
        error: AppError(
          message: error.dioErrorMessage,
          code: error.dioErrorStatusCode,
        ),
      );
    }
  }
}
