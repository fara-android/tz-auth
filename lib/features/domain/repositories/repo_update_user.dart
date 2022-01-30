import 'package:tz_auth/features/domain/results/repo_user_result.dart';

abstract class RepoUpdateUser {
  Future<RepoUserResult> updateUser({
    required String token,
    String? name,
    String? phone,
    String? email,
  });
}
