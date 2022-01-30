import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    String? name,
    String? email,
    String? phone,
    String? token,
  }) = _UserEntity;
}
