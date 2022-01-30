import 'package:shared_preferences/shared_preferences.dart';
import 'package:tz_auth/features/domain/repositories/repo_update_user.dart';
import 'package:tz_auth/features/domain/results/repo_user_result.dart';

class UserUpdateCase {
  final RepoUpdateUser repoUpdateUser;
  final SharedPreferences preferences;

  UserUpdateCase({required this.repoUpdateUser, required this.preferences});

  Future<RepoUserResult> updateUser(
      {required String token,
      String? name,
      String? phone,
      String? email}) async {
    final result = await repoUpdateUser.updateUser(
      token: token,
      name: name,
      phone: phone,
      email: email,
    );
    if (result.result != null) {
      preferences.setString('name', result.result!.name ?? '');
      preferences.setString('email', result.result!.email ?? '');
      preferences.setString('phone', result.result!.phone ?? '');
    }

    return result;
  }
}
