// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenExpiredException _$TokenExpiredExceptionFromJson(
    Map<String, dynamic> json) {
  return _TokenExpiredException.fromJson(json);
}

/// @nodoc
mixin _$TokenExpiredException {
  int? get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this TokenExpiredException to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenExpiredException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenExpiredExceptionCopyWith<TokenExpiredException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenExpiredExceptionCopyWith<$Res> {
  factory $TokenExpiredExceptionCopyWith(TokenExpiredException value,
          $Res Function(TokenExpiredException) then) =
      _$TokenExpiredExceptionCopyWithImpl<$Res, TokenExpiredException>;
  @useResult
  $Res call({int? code, String message});
}

/// @nodoc
class _$TokenExpiredExceptionCopyWithImpl<$Res,
        $Val extends TokenExpiredException>
    implements $TokenExpiredExceptionCopyWith<$Res> {
  _$TokenExpiredExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenExpiredException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenExpiredExceptionImplCopyWith<$Res>
    implements $TokenExpiredExceptionCopyWith<$Res> {
  factory _$$TokenExpiredExceptionImplCopyWith(
          _$TokenExpiredExceptionImpl value,
          $Res Function(_$TokenExpiredExceptionImpl) then) =
      __$$TokenExpiredExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, String message});
}

/// @nodoc
class __$$TokenExpiredExceptionImplCopyWithImpl<$Res>
    extends _$TokenExpiredExceptionCopyWithImpl<$Res,
        _$TokenExpiredExceptionImpl>
    implements _$$TokenExpiredExceptionImplCopyWith<$Res> {
  __$$TokenExpiredExceptionImplCopyWithImpl(_$TokenExpiredExceptionImpl _value,
      $Res Function(_$TokenExpiredExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenExpiredException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = null,
  }) {
    return _then(_$TokenExpiredExceptionImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenExpiredExceptionImpl implements _TokenExpiredException {
  const _$TokenExpiredExceptionImpl(
      {required this.code, required this.message});

  factory _$TokenExpiredExceptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenExpiredExceptionImplFromJson(json);

  @override
  final int? code;
  @override
  final String message;

  @override
  String toString() {
    return 'TokenExpiredException(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenExpiredExceptionImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  /// Create a copy of TokenExpiredException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenExpiredExceptionImplCopyWith<_$TokenExpiredExceptionImpl>
      get copyWith => __$$TokenExpiredExceptionImplCopyWithImpl<
          _$TokenExpiredExceptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenExpiredExceptionImplToJson(
      this,
    );
  }
}

abstract class _TokenExpiredException implements TokenExpiredException {
  const factory _TokenExpiredException(
      {required final int? code,
      required final String message}) = _$TokenExpiredExceptionImpl;

  factory _TokenExpiredException.fromJson(Map<String, dynamic> json) =
      _$TokenExpiredExceptionImpl.fromJson;

  @override
  int? get code;
  @override
  String get message;

  /// Create a copy of TokenExpiredException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenExpiredExceptionImplCopyWith<_$TokenExpiredExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
