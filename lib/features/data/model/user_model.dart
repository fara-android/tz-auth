import 'package:tz_auth/features/domain/entities/user_entity/user_entity.dart';

extension UserJsonModel on UserEntity {
  UserEntity fromJson(dynamic data) {
    return UserEntity(
        name: data['name'],
        phone: data['phone'],
        email: data['email'],
        token: data['token']);
  }
}
