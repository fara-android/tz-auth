// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserEntityTearOff {
  const _$UserEntityTearOff();

  _UserEntity call(
      {String? name, String? email, String? phone, String? token}) {
    return _UserEntity(
      name: name,
      email: email,
      phone: phone,
      token: token,
    );
  }
}

/// @nodoc
const $UserEntity = _$UserEntityTearOff();

/// @nodoc
mixin _$UserEntity {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res>;
  $Res call({String? name, String? email, String? phone, String? token});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res> implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  final UserEntity _value;
  // ignore: unused_field
  final $Res Function(UserEntity) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(
          _UserEntity value, $Res Function(_UserEntity) then) =
      __$UserEntityCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? email, String? phone, String? token});
}

/// @nodoc
class __$UserEntityCopyWithImpl<$Res> extends _$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(
      _UserEntity _value, $Res Function(_UserEntity) _then)
      : super(_value, (v) => _then(v as _UserEntity));

  @override
  _UserEntity get _value => super._value as _UserEntity;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? token = freezed,
  }) {
    return _then(_UserEntity(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserEntity implements _UserEntity {
  _$_UserEntity({this.name, this.email, this.phone, this.token});

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? token;

  @override
  String toString() {
    return 'UserEntity(name: $name, email: $email, phone: $phone, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserEntity &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$UserEntityCopyWith<_UserEntity> get copyWith =>
      __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  factory _UserEntity(
      {String? name,
      String? email,
      String? phone,
      String? token}) = _$_UserEntity;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserEntityCopyWith<_UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
