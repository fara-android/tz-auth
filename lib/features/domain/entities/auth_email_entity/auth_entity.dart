import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

@freezed
class AuthEntity with _$AuthEntity {
  factory AuthEntity({
    bool? success,
  }) = _AuthEntity;
}
