import 'package:tz_auth/features/domain/entities/auth_email_entity/auth_entity.dart';

extension AuthJsonModel on AuthEntity {
  AuthEntity fromJson(dynamic data) {
    return AuthEntity(success: data['success']);
  }
}
