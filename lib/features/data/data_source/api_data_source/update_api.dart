import 'package:dio/dio.dart';
import 'package:tz_auth/core/app_error.dart';
import 'package:tz_auth/core/extensions.dart';
import 'package:tz_auth/features/data/model/user_model.dart';
import 'package:tz_auth/features/domain/entities/user_entity/user_entity.dart';
import 'package:tz_auth/features/domain/results/repo_user_result.dart';

class UpdateApi {
  final Dio dio;

  UpdateApi({required this.dio});

  Future<RepoUserResult> updateUser(
      {required String token,
      String? phone,
      String? email,
      String? name}) async {
    try {
      final result = await dio.post('user/update', data: {
        'phone': phone,
        'name': name,
        'email': email,
        'token': token,
      });

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
