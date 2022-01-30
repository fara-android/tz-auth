// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthEntityTearOff {
  const _$AuthEntityTearOff();

  _AuthEntity call({bool? success}) {
    return _AuthEntity(
      success: success,
    );
  }
}

/// @nodoc
const $AuthEntity = _$AuthEntityTearOff();

/// @nodoc
mixin _$AuthEntity {
  bool? get success => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthEntityCopyWith<AuthEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEntityCopyWith<$Res> {
  factory $AuthEntityCopyWith(
          AuthEntity value, $Res Function(AuthEntity) then) =
      _$AuthEntityCopyWithImpl<$Res>;
  $Res call({bool? success});
}

/// @nodoc
class _$AuthEntityCopyWithImpl<$Res> implements $AuthEntityCopyWith<$Res> {
  _$AuthEntityCopyWithImpl(this._value, this._then);

  final AuthEntity _value;
  // ignore: unused_field
  final $Res Function(AuthEntity) _then;

  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$AuthEntityCopyWith<$Res> implements $AuthEntityCopyWith<$Res> {
  factory _$AuthEntityCopyWith(
          _AuthEntity value, $Res Function(_AuthEntity) then) =
      __$AuthEntityCopyWithImpl<$Res>;
  @override
  $Res call({bool? success});
}

/// @nodoc
class __$AuthEntityCopyWithImpl<$Res> extends _$AuthEntityCopyWithImpl<$Res>
    implements _$AuthEntityCopyWith<$Res> {
  __$AuthEntityCopyWithImpl(
      _AuthEntity _value, $Res Function(_AuthEntity) _then)
      : super(_value, (v) => _then(v as _AuthEntity));

  @override
  _AuthEntity get _value => super._value as _AuthEntity;

  @override
  $Res call({
    Object? success = freezed,
  }) {
    return _then(_AuthEntity(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_AuthEntity implements _AuthEntity {
  _$_AuthEntity({this.success});

  @override
  final bool? success;

  @override
  String toString() {
    return 'AuthEntity(success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthEntity &&
            (identical(other.success, success) ||
                const DeepCollectionEquality().equals(other.success, success)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(success);

  @JsonKey(ignore: true)
  @override
  _$AuthEntityCopyWith<_AuthEntity> get copyWith =>
      __$AuthEntityCopyWithImpl<_AuthEntity>(this, _$identity);
}

abstract class _AuthEntity implements AuthEntity {
  factory _AuthEntity({bool? success}) = _$_AuthEntity;

  @override
  bool? get success => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthEntityCopyWith<_AuthEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
