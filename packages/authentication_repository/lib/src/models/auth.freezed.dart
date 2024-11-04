// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return _RegisterResponse.fromJson(json);
}

/// @nodoc
mixin _$RegisterResponse {
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  int get tokenExpireIn => throw _privateConstructorUsedError;
  int get refreshTokenExpireIn => throw _privateConstructorUsedError;

  /// Serializes this RegisterResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterResponseCopyWith<RegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseCopyWith<$Res> {
  factory $RegisterResponseCopyWith(
          RegisterResponse value, $Res Function(RegisterResponse) then) =
      _$RegisterResponseCopyWithImpl<$Res, RegisterResponse>;
  @useResult
  $Res call(
      {String token,
      String refreshToken,
      int tokenExpireIn,
      int refreshTokenExpireIn});
}

/// @nodoc
class _$RegisterResponseCopyWithImpl<$Res, $Val extends RegisterResponse>
    implements $RegisterResponseCopyWith<$Res> {
  _$RegisterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? tokenExpireIn = null,
    Object? refreshTokenExpireIn = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenExpireIn: null == tokenExpireIn
          ? _value.tokenExpireIn
          : tokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
      refreshTokenExpireIn: null == refreshTokenExpireIn
          ? _value.refreshTokenExpireIn
          : refreshTokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterResponseImplCopyWith<$Res>
    implements $RegisterResponseCopyWith<$Res> {
  factory _$$RegisterResponseImplCopyWith(_$RegisterResponseImpl value,
          $Res Function(_$RegisterResponseImpl) then) =
      __$$RegisterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      String refreshToken,
      int tokenExpireIn,
      int refreshTokenExpireIn});
}

/// @nodoc
class __$$RegisterResponseImplCopyWithImpl<$Res>
    extends _$RegisterResponseCopyWithImpl<$Res, _$RegisterResponseImpl>
    implements _$$RegisterResponseImplCopyWith<$Res> {
  __$$RegisterResponseImplCopyWithImpl(_$RegisterResponseImpl _value,
      $Res Function(_$RegisterResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? tokenExpireIn = null,
    Object? refreshTokenExpireIn = null,
  }) {
    return _then(_$RegisterResponseImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenExpireIn: null == tokenExpireIn
          ? _value.tokenExpireIn
          : tokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
      refreshTokenExpireIn: null == refreshTokenExpireIn
          ? _value.refreshTokenExpireIn
          : refreshTokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterResponseImpl implements _RegisterResponse {
  const _$RegisterResponseImpl(
      {required this.token,
      required this.refreshToken,
      required this.tokenExpireIn,
      required this.refreshTokenExpireIn});

  factory _$RegisterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterResponseImplFromJson(json);

  @override
  final String token;
  @override
  final String refreshToken;
  @override
  final int tokenExpireIn;
  @override
  final int refreshTokenExpireIn;

  @override
  String toString() {
    return 'RegisterResponse(token: $token, refreshToken: $refreshToken, tokenExpireIn: $tokenExpireIn, refreshTokenExpireIn: $refreshTokenExpireIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenExpireIn, tokenExpireIn) ||
                other.tokenExpireIn == tokenExpireIn) &&
            (identical(other.refreshTokenExpireIn, refreshTokenExpireIn) ||
                other.refreshTokenExpireIn == refreshTokenExpireIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, token, refreshToken, tokenExpireIn, refreshTokenExpireIn);

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterResponseImplCopyWith<_$RegisterResponseImpl> get copyWith =>
      __$$RegisterResponseImplCopyWithImpl<_$RegisterResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterResponseImplToJson(
      this,
    );
  }
}

abstract class _RegisterResponse implements RegisterResponse {
  const factory _RegisterResponse(
      {required final String token,
      required final String refreshToken,
      required final int tokenExpireIn,
      required final int refreshTokenExpireIn}) = _$RegisterResponseImpl;

  factory _RegisterResponse.fromJson(Map<String, dynamic> json) =
      _$RegisterResponseImpl.fromJson;

  @override
  String get token;
  @override
  String get refreshToken;
  @override
  int get tokenExpireIn;
  @override
  int get refreshTokenExpireIn;

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterResponseImplCopyWith<_$RegisterResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestOTPResponse _$RequestOTPResponseFromJson(Map<String, dynamic> json) {
  return _RequestOTPResponse.fromJson(json);
}

/// @nodoc
mixin _$RequestOTPResponse {
  String get id => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RequestOTPResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestOTPResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestOTPResponseCopyWith<RequestOTPResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOTPResponseCopyWith<$Res> {
  factory $RequestOTPResponseCopyWith(
          RequestOTPResponse value, $Res Function(RequestOTPResponse) then) =
      _$RequestOTPResponseCopyWithImpl<$Res, RequestOTPResponse>;
  @useResult
  $Res call(
      {String id,
      String target,
      String type,
      String action,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$RequestOTPResponseCopyWithImpl<$Res, $Val extends RequestOTPResponse>
    implements $RequestOTPResponseCopyWith<$Res> {
  _$RequestOTPResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestOTPResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? target = null,
    Object? type = null,
    Object? action = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOTPResponseImplCopyWith<$Res>
    implements $RequestOTPResponseCopyWith<$Res> {
  factory _$$RequestOTPResponseImplCopyWith(_$RequestOTPResponseImpl value,
          $Res Function(_$RequestOTPResponseImpl) then) =
      __$$RequestOTPResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String target,
      String type,
      String action,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$RequestOTPResponseImplCopyWithImpl<$Res>
    extends _$RequestOTPResponseCopyWithImpl<$Res, _$RequestOTPResponseImpl>
    implements _$$RequestOTPResponseImplCopyWith<$Res> {
  __$$RequestOTPResponseImplCopyWithImpl(_$RequestOTPResponseImpl _value,
      $Res Function(_$RequestOTPResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestOTPResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? target = null,
    Object? type = null,
    Object? action = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RequestOTPResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOTPResponseImpl implements _RequestOTPResponse {
  const _$RequestOTPResponseImpl(
      {required this.id,
      required this.target,
      required this.type,
      required this.action,
      required this.createdAt,
      required this.updatedAt});

  factory _$RequestOTPResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOTPResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String target;
  @override
  final String type;
  @override
  final String action;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'RequestOTPResponse(id: $id, target: $target, type: $type, action: $action, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOTPResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, target, type, action, createdAt, updatedAt);

  /// Create a copy of RequestOTPResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOTPResponseImplCopyWith<_$RequestOTPResponseImpl> get copyWith =>
      __$$RequestOTPResponseImplCopyWithImpl<_$RequestOTPResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOTPResponseImplToJson(
      this,
    );
  }
}

abstract class _RequestOTPResponse implements RequestOTPResponse {
  const factory _RequestOTPResponse(
      {required final String id,
      required final String target,
      required final String type,
      required final String action,
      required final String createdAt,
      required final String updatedAt}) = _$RequestOTPResponseImpl;

  factory _RequestOTPResponse.fromJson(Map<String, dynamic> json) =
      _$RequestOTPResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get target;
  @override
  String get type;
  @override
  String get action;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of RequestOTPResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestOTPResponseImplCopyWith<_$RequestOTPResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifyOTPResponse _$VerifyOTPResponseFromJson(Map<String, dynamic> json) {
  return _VerifyOTPResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyOTPResponse {
  String get action => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  int get tokenExpireIn => throw _privateConstructorUsedError;
  int get refreshTokenExpireIn => throw _privateConstructorUsedError;

  /// Serializes this VerifyOTPResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOTPResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOTPResponseCopyWith<VerifyOTPResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOTPResponseCopyWith<$Res> {
  factory $VerifyOTPResponseCopyWith(
          VerifyOTPResponse value, $Res Function(VerifyOTPResponse) then) =
      _$VerifyOTPResponseCopyWithImpl<$Res, VerifyOTPResponse>;
  @useResult
  $Res call(
      {String action,
      String token,
      String refreshToken,
      int tokenExpireIn,
      int refreshTokenExpireIn});
}

/// @nodoc
class _$VerifyOTPResponseCopyWithImpl<$Res, $Val extends VerifyOTPResponse>
    implements $VerifyOTPResponseCopyWith<$Res> {
  _$VerifyOTPResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOTPResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? token = null,
    Object? refreshToken = null,
    Object? tokenExpireIn = null,
    Object? refreshTokenExpireIn = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenExpireIn: null == tokenExpireIn
          ? _value.tokenExpireIn
          : tokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
      refreshTokenExpireIn: null == refreshTokenExpireIn
          ? _value.refreshTokenExpireIn
          : refreshTokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOTPResponseImplCopyWith<$Res>
    implements $VerifyOTPResponseCopyWith<$Res> {
  factory _$$VerifyOTPResponseImplCopyWith(_$VerifyOTPResponseImpl value,
          $Res Function(_$VerifyOTPResponseImpl) then) =
      __$$VerifyOTPResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String action,
      String token,
      String refreshToken,
      int tokenExpireIn,
      int refreshTokenExpireIn});
}

/// @nodoc
class __$$VerifyOTPResponseImplCopyWithImpl<$Res>
    extends _$VerifyOTPResponseCopyWithImpl<$Res, _$VerifyOTPResponseImpl>
    implements _$$VerifyOTPResponseImplCopyWith<$Res> {
  __$$VerifyOTPResponseImplCopyWithImpl(_$VerifyOTPResponseImpl _value,
      $Res Function(_$VerifyOTPResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOTPResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? token = null,
    Object? refreshToken = null,
    Object? tokenExpireIn = null,
    Object? refreshTokenExpireIn = null,
  }) {
    return _then(_$VerifyOTPResponseImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenExpireIn: null == tokenExpireIn
          ? _value.tokenExpireIn
          : tokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
      refreshTokenExpireIn: null == refreshTokenExpireIn
          ? _value.refreshTokenExpireIn
          : refreshTokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOTPResponseImpl implements _VerifyOTPResponse {
  const _$VerifyOTPResponseImpl(
      {required this.action,
      required this.token,
      required this.refreshToken,
      required this.tokenExpireIn,
      required this.refreshTokenExpireIn});

  factory _$VerifyOTPResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOTPResponseImplFromJson(json);

  @override
  final String action;
  @override
  final String token;
  @override
  final String refreshToken;
  @override
  final int tokenExpireIn;
  @override
  final int refreshTokenExpireIn;

  @override
  String toString() {
    return 'VerifyOTPResponse(action: $action, token: $token, refreshToken: $refreshToken, tokenExpireIn: $tokenExpireIn, refreshTokenExpireIn: $refreshTokenExpireIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOTPResponseImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenExpireIn, tokenExpireIn) ||
                other.tokenExpireIn == tokenExpireIn) &&
            (identical(other.refreshTokenExpireIn, refreshTokenExpireIn) ||
                other.refreshTokenExpireIn == refreshTokenExpireIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action, token, refreshToken,
      tokenExpireIn, refreshTokenExpireIn);

  /// Create a copy of VerifyOTPResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOTPResponseImplCopyWith<_$VerifyOTPResponseImpl> get copyWith =>
      __$$VerifyOTPResponseImplCopyWithImpl<_$VerifyOTPResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOTPResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifyOTPResponse implements VerifyOTPResponse {
  const factory _VerifyOTPResponse(
      {required final String action,
      required final String token,
      required final String refreshToken,
      required final int tokenExpireIn,
      required final int refreshTokenExpireIn}) = _$VerifyOTPResponseImpl;

  factory _VerifyOTPResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyOTPResponseImpl.fromJson;

  @override
  String get action;
  @override
  String get token;
  @override
  String get refreshToken;
  @override
  int get tokenExpireIn;
  @override
  int get refreshTokenExpireIn;

  /// Create a copy of VerifyOTPResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOTPResponseImplCopyWith<_$VerifyOTPResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenRes _$RefreshTokenResFromJson(Map<String, dynamic> json) {
  return _RefreshTokenRes.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenRes {
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  int get tokenExpireIn => throw _privateConstructorUsedError;
  int get refreshTokenExpireIn => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenResCopyWith<RefreshTokenRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenResCopyWith<$Res> {
  factory $RefreshTokenResCopyWith(
          RefreshTokenRes value, $Res Function(RefreshTokenRes) then) =
      _$RefreshTokenResCopyWithImpl<$Res, RefreshTokenRes>;
  @useResult
  $Res call(
      {String token,
      String refreshToken,
      int tokenExpireIn,
      int refreshTokenExpireIn});
}

/// @nodoc
class _$RefreshTokenResCopyWithImpl<$Res, $Val extends RefreshTokenRes>
    implements $RefreshTokenResCopyWith<$Res> {
  _$RefreshTokenResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? tokenExpireIn = null,
    Object? refreshTokenExpireIn = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenExpireIn: null == tokenExpireIn
          ? _value.tokenExpireIn
          : tokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
      refreshTokenExpireIn: null == refreshTokenExpireIn
          ? _value.refreshTokenExpireIn
          : refreshTokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenResImplCopyWith<$Res>
    implements $RefreshTokenResCopyWith<$Res> {
  factory _$$RefreshTokenResImplCopyWith(_$RefreshTokenResImpl value,
          $Res Function(_$RefreshTokenResImpl) then) =
      __$$RefreshTokenResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token,
      String refreshToken,
      int tokenExpireIn,
      int refreshTokenExpireIn});
}

/// @nodoc
class __$$RefreshTokenResImplCopyWithImpl<$Res>
    extends _$RefreshTokenResCopyWithImpl<$Res, _$RefreshTokenResImpl>
    implements _$$RefreshTokenResImplCopyWith<$Res> {
  __$$RefreshTokenResImplCopyWithImpl(
      _$RefreshTokenResImpl _value, $Res Function(_$RefreshTokenResImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? refreshToken = null,
    Object? tokenExpireIn = null,
    Object? refreshTokenExpireIn = null,
  }) {
    return _then(_$RefreshTokenResImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenExpireIn: null == tokenExpireIn
          ? _value.tokenExpireIn
          : tokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
      refreshTokenExpireIn: null == refreshTokenExpireIn
          ? _value.refreshTokenExpireIn
          : refreshTokenExpireIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenResImpl implements _RefreshTokenRes {
  const _$RefreshTokenResImpl(
      {required this.token,
      required this.refreshToken,
      required this.tokenExpireIn,
      required this.refreshTokenExpireIn});

  factory _$RefreshTokenResImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenResImplFromJson(json);

  @override
  final String token;
  @override
  final String refreshToken;
  @override
  final int tokenExpireIn;
  @override
  final int refreshTokenExpireIn;

  @override
  String toString() {
    return 'RefreshTokenRes(token: $token, refreshToken: $refreshToken, tokenExpireIn: $tokenExpireIn, refreshTokenExpireIn: $refreshTokenExpireIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenResImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenExpireIn, tokenExpireIn) ||
                other.tokenExpireIn == tokenExpireIn) &&
            (identical(other.refreshTokenExpireIn, refreshTokenExpireIn) ||
                other.refreshTokenExpireIn == refreshTokenExpireIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, token, refreshToken, tokenExpireIn, refreshTokenExpireIn);

  /// Create a copy of RefreshTokenRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenResImplCopyWith<_$RefreshTokenResImpl> get copyWith =>
      __$$RefreshTokenResImplCopyWithImpl<_$RefreshTokenResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenResImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenRes implements RefreshTokenRes {
  const factory _RefreshTokenRes(
      {required final String token,
      required final String refreshToken,
      required final int tokenExpireIn,
      required final int refreshTokenExpireIn}) = _$RefreshTokenResImpl;

  factory _RefreshTokenRes.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenResImpl.fromJson;

  @override
  String get token;
  @override
  String get refreshToken;
  @override
  int get tokenExpireIn;
  @override
  int get refreshTokenExpireIn;

  /// Create a copy of RefreshTokenRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenResImplCopyWith<_$RefreshTokenResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
