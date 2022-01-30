import 'package:tz_auth/core/app_error.dart';
import 'package:tz_auth/features/domain/entities/auth_email_entity/auth_entity.dart';

class RepoAuthResult {
  RepoAuthResult({
    this.error,
    this.result,
  });

  final AppError? error;
  final AuthEntity? result;

  @override
  String toString() => 'RepoAuthResult(error: $error, result: $result)';
}
