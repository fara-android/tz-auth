import 'package:tz_auth/core/app_error.dart';
import 'package:tz_auth/features/data/repositories/app_repository.dart';
import 'package:tz_auth/features/domain/repositories/repo_auth_code.dart';
import 'package:tz_auth/features/domain/results/repo_user_result.dart';

class AuthCodeRepoImpl implements RepoAuthCode {
  final AppRepository repository;

  AuthCodeRepoImpl({required this.repository});

  @override
  Future<RepoUserResult> checkSms(String email, String pinCode) async {
    final result =
        await repository.authCodeApi.checkSms(email: email, pinCode: pinCode);
    if (result.error == null) {
      return RepoUserResult(result: result.result);
    } else {
      return RepoUserResult(
          error: AppError(
        message: result.error!.message,
        code: result.error!.code,
      ));
    }
  }
}
