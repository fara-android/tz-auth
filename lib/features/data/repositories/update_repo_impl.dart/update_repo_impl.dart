import 'package:tz_auth/core/app_error.dart';
import 'package:tz_auth/features/data/repositories/app_repository.dart';
import 'package:tz_auth/features/domain/repositories/repo_update_user.dart';
import 'package:tz_auth/features/domain/results/repo_user_result.dart';

class UpdateRepoImpl implements RepoUpdateUser {
  final AppRepository repository;

  UpdateRepoImpl({required this.repository});
  @override
  Future<RepoUserResult> updateUser(
      {required String token,
      String? name,
      String? phone,
      String? email}) async {
    final result = await repository.updateApi.updateUser(
      token: token,
      name: name,
      email: email,
      phone: phone,
    );
    if (result.error == null) {
      return RepoUserResult(result: result.result);
    } else {
      return RepoUserResult(
        error: AppError(
          message: result.error!.message,
          code: result.error!.code,
        ),
      );
    }
  }
}
