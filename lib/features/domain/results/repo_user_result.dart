import 'package:tz_auth/core/app_error.dart';
import 'package:tz_auth/features/domain/entities/user_entity/user_entity.dart';

class RepoUserResult {
  RepoUserResult({
    this.error,
    this.result,
  });

  final AppError? error;
  final UserEntity? result;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $result)';
}
