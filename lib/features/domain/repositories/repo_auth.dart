import 'package:tz_auth/features/domain/results/repo_auth_result.dart';

abstract class RepoAuth {
  Future<RepoAuthResult> getSms(String email);
}
