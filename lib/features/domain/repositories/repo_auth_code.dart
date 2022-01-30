import 'package:tz_auth/features/domain/results/repo_user_result.dart';

abstract class RepoAuthCode {
  Future<RepoUserResult> checkSms(String email, String pinCode);
}
