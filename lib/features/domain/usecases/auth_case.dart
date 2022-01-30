import 'package:tz_auth/features/domain/repositories/repo_auth.dart';
import 'package:tz_auth/features/domain/results/repo_auth_result.dart';

class AuthCase {
  final RepoAuth repoAuth;

  AuthCase({
    required this.repoAuth,
  });

  Future<RepoAuthResult> getSms(String email) async {
    final result = await repoAuth.getSms(email);
    return result;
  }
}
