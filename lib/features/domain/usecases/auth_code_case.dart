import 'package:shared_preferences/shared_preferences.dart';
import 'package:tz_auth/features/domain/repositories/repo_auth_code.dart';
import 'package:tz_auth/features/domain/results/repo_user_result.dart';

class AuthCodeUseCase {
  final RepoAuthCode repoUser;
  final SharedPreferences preferences;

  AuthCodeUseCase({
    required this.repoUser,
    required this.preferences,
  });

  Future<RepoUserResult> checkSms(String email, String pinCode) async {
    final result = await repoUser.checkSms(email, pinCode);
    if (result.result != null) {
      if (result.result!.token != null) {
        preferences.setString('token', result.result!.token!);
        preferences.setString('name', result.result!.name ?? '');
        preferences.setString('email', result.result!.email ?? '');
        preferences.setString('phone', result.result!.phone ?? '');
      }
    }
    return result;
  }
}
