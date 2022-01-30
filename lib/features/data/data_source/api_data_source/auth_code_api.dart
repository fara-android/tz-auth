import 'package:dio/dio.dart';
import 'package:tz_auth/core/app_error.dart';
import 'package:tz_auth/core/extensions.dart';
import 'package:tz_auth/features/data/model/user_model.dart';
import 'package:tz_auth/features/domain/entities/user_entity/user_entity.dart';
import 'package:tz_auth/features/domain/results/repo_user_result.dart';

class AuthCodeApi {
  final Dio dio;

  AuthCodeApi({required this.dio});

  Future<RepoUserResult> checkSms({
    required String email,
    required String pinCode,
  }) async {
    try {
      final result = await dio.post(
        'app/login',
        data: {'login': email, 'code': pinCode},
      );
      return RepoUserResult(
        result: UserEntity().fromJson(result.data),
      );
    } catch (error) {
      return RepoUserResult(
        error: AppError(
          message: error.dioErrorMessage,
          code: error.dioErrorStatusCode,
        ),
      );
    }
  }
}
