import 'package:tz_auth/core/app_error.dart';
import 'package:tz_auth/features/data/repositories/app_repository.dart';
import 'package:tz_auth/features/domain/repositories/repo_auth.dart';
import 'package:tz_auth/features/domain/results/repo_auth_result.dart';

class AuthRepoImpl implements RepoAuth {
  final AppRepository repository;

  AuthRepoImpl({required this.repository});
  @override
  Future<RepoAuthResult> getSms(String email) async {
    final result = await repository.authApi.getSms(email: email);
    if (result.error == null) {
      return RepoAuthResult(result: result.result);
    } else {
      return RepoAuthResult(
        error: AppError(
          message: result.error!.message,
          code: result.error!.code,
        ),
      );
    }
  }
}
