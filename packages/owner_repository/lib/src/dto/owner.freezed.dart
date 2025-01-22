// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateNameDto _$UpdateNameDtoFromJson(Map<String, dynamic> json) {
  return _UpdateNameDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateNameDto {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this UpdateNameDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateNameDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateNameDtoCopyWith<UpdateNameDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateNameDtoCopyWith<$Res> {
  factory $UpdateNameDtoCopyWith(
          UpdateNameDto value, $Res Function(UpdateNameDto) then) =
      _$UpdateNameDtoCopyWithImpl<$Res, UpdateNameDto>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$UpdateNameDtoCopyWithImpl<$Res, $Val extends UpdateNameDto>
    implements $UpdateNameDtoCopyWith<$Res> {
  _$UpdateNameDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateNameDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateNameDtoImplCopyWith<$Res>
    implements $UpdateNameDtoCopyWith<$Res> {
  factory _$$UpdateNameDtoImplCopyWith(
          _$UpdateNameDtoImpl value, $Res Function(_$UpdateNameDtoImpl) then) =
      __$$UpdateNameDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$UpdateNameDtoImplCopyWithImpl<$Res>
    extends _$UpdateNameDtoCopyWithImpl<$Res, _$UpdateNameDtoImpl>
    implements _$$UpdateNameDtoImplCopyWith<$Res> {
  __$$UpdateNameDtoImplCopyWithImpl(
      _$UpdateNameDtoImpl _value, $Res Function(_$UpdateNameDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateNameDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$UpdateNameDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateNameDtoImpl implements _UpdateNameDto {
  const _$UpdateNameDtoImpl({required this.name});

  factory _$UpdateNameDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateNameDtoImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'UpdateNameDto(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNameDtoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of UpdateNameDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNameDtoImplCopyWith<_$UpdateNameDtoImpl> get copyWith =>
      __$$UpdateNameDtoImplCopyWithImpl<_$UpdateNameDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateNameDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateNameDto implements UpdateNameDto {
  const factory _UpdateNameDto({required final String name}) =
      _$UpdateNameDtoImpl;

  factory _UpdateNameDto.fromJson(Map<String, dynamic> json) =
      _$UpdateNameDtoImpl.fromJson;

  @override
  String get name;

  /// Create a copy of UpdateNameDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateNameDtoImplCopyWith<_$UpdateNameDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateEmailDto _$UpdateEmailDtoFromJson(Map<String, dynamic> json) {
  return _UpdateEmailDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateEmailDto {
  String get token => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this UpdateEmailDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateEmailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateEmailDtoCopyWith<UpdateEmailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEmailDtoCopyWith<$Res> {
  factory $UpdateEmailDtoCopyWith(
          UpdateEmailDto value, $Res Function(UpdateEmailDto) then) =
      _$UpdateEmailDtoCopyWithImpl<$Res, UpdateEmailDto>;
  @useResult
  $Res call({String token, String email});
}

/// @nodoc
class _$UpdateEmailDtoCopyWithImpl<$Res, $Val extends UpdateEmailDto>
    implements $UpdateEmailDtoCopyWith<$Res> {
  _$UpdateEmailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateEmailDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateEmailDtoImplCopyWith<$Res>
    implements $UpdateEmailDtoCopyWith<$Res> {
  factory _$$UpdateEmailDtoImplCopyWith(_$UpdateEmailDtoImpl value,
          $Res Function(_$UpdateEmailDtoImpl) then) =
      __$$UpdateEmailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String email});
}

/// @nodoc
class __$$UpdateEmailDtoImplCopyWithImpl<$Res>
    extends _$UpdateEmailDtoCopyWithImpl<$Res, _$UpdateEmailDtoImpl>
    implements _$$UpdateEmailDtoImplCopyWith<$Res> {
  __$$UpdateEmailDtoImplCopyWithImpl(
      _$UpdateEmailDtoImpl _value, $Res Function(_$UpdateEmailDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateEmailDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? email = null,
  }) {
    return _then(_$UpdateEmailDtoImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateEmailDtoImpl implements _UpdateEmailDto {
  const _$UpdateEmailDtoImpl({required this.token, required this.email});

  factory _$UpdateEmailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateEmailDtoImplFromJson(json);

  @override
  final String token;
  @override
  final String email;

  @override
  String toString() {
    return 'UpdateEmailDto(token: $token, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEmailDtoImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, email);

  /// Create a copy of UpdateEmailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEmailDtoImplCopyWith<_$UpdateEmailDtoImpl> get copyWith =>
      __$$UpdateEmailDtoImplCopyWithImpl<_$UpdateEmailDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateEmailDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateEmailDto implements UpdateEmailDto {
  const factory _UpdateEmailDto(
      {required final String token,
      required final String email}) = _$UpdateEmailDtoImpl;

  factory _UpdateEmailDto.fromJson(Map<String, dynamic> json) =
      _$UpdateEmailDtoImpl.fromJson;

  @override
  String get token;
  @override
  String get email;

  /// Create a copy of UpdateEmailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateEmailDtoImplCopyWith<_$UpdateEmailDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdatePhoneNumberDto _$UpdatePhoneNumberDtoFromJson(Map<String, dynamic> json) {
  return _UpdatePhoneNumberDto.fromJson(json);
}

/// @nodoc
mixin _$UpdatePhoneNumberDto {
  String get token => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  /// Serializes this UpdatePhoneNumberDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePhoneNumberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePhoneNumberDtoCopyWith<UpdatePhoneNumberDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePhoneNumberDtoCopyWith<$Res> {
  factory $UpdatePhoneNumberDtoCopyWith(UpdatePhoneNumberDto value,
          $Res Function(UpdatePhoneNumberDto) then) =
      _$UpdatePhoneNumberDtoCopyWithImpl<$Res, UpdatePhoneNumberDto>;
  @useResult
  $Res call({String token, String phoneNumber, String otp});
}

/// @nodoc
class _$UpdatePhoneNumberDtoCopyWithImpl<$Res,
        $Val extends UpdatePhoneNumberDto>
    implements $UpdatePhoneNumberDtoCopyWith<$Res> {
  _$UpdatePhoneNumberDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePhoneNumberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? phoneNumber = null,
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePhoneNumberDtoImplCopyWith<$Res>
    implements $UpdatePhoneNumberDtoCopyWith<$Res> {
  factory _$$UpdatePhoneNumberDtoImplCopyWith(_$UpdatePhoneNumberDtoImpl value,
          $Res Function(_$UpdatePhoneNumberDtoImpl) then) =
      __$$UpdatePhoneNumberDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String phoneNumber, String otp});
}

/// @nodoc
class __$$UpdatePhoneNumberDtoImplCopyWithImpl<$Res>
    extends _$UpdatePhoneNumberDtoCopyWithImpl<$Res, _$UpdatePhoneNumberDtoImpl>
    implements _$$UpdatePhoneNumberDtoImplCopyWith<$Res> {
  __$$UpdatePhoneNumberDtoImplCopyWithImpl(_$UpdatePhoneNumberDtoImpl _value,
      $Res Function(_$UpdatePhoneNumberDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePhoneNumberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? phoneNumber = null,
    Object? otp = null,
  }) {
    return _then(_$UpdatePhoneNumberDtoImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePhoneNumberDtoImpl implements _UpdatePhoneNumberDto {
  const _$UpdatePhoneNumberDtoImpl(
      {required this.token, required this.phoneNumber, required this.otp});

  factory _$UpdatePhoneNumberDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePhoneNumberDtoImplFromJson(json);

  @override
  final String token;
  @override
  final String phoneNumber;
  @override
  final String otp;

  @override
  String toString() {
    return 'UpdatePhoneNumberDto(token: $token, phoneNumber: $phoneNumber, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePhoneNumberDtoImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, phoneNumber, otp);

  /// Create a copy of UpdatePhoneNumberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePhoneNumberDtoImplCopyWith<_$UpdatePhoneNumberDtoImpl>
      get copyWith =>
          __$$UpdatePhoneNumberDtoImplCopyWithImpl<_$UpdatePhoneNumberDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePhoneNumberDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdatePhoneNumberDto implements UpdatePhoneNumberDto {
  const factory _UpdatePhoneNumberDto(
      {required final String token,
      required final String phoneNumber,
      required final String otp}) = _$UpdatePhoneNumberDtoImpl;

  factory _UpdatePhoneNumberDto.fromJson(Map<String, dynamic> json) =
      _$UpdatePhoneNumberDtoImpl.fromJson;

  @override
  String get token;
  @override
  String get phoneNumber;
  @override
  String get otp;

  /// Create a copy of UpdatePhoneNumberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePhoneNumberDtoImplCopyWith<_$UpdatePhoneNumberDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdatePinDto _$UpdatePinDtoFromJson(Map<String, dynamic> json) {
  return _UpdatePinDto.fromJson(json);
}

/// @nodoc
mixin _$UpdatePinDto {
  String get token => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;

  /// Serializes this UpdatePinDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePinDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePinDtoCopyWith<UpdatePinDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePinDtoCopyWith<$Res> {
  factory $UpdatePinDtoCopyWith(
          UpdatePinDto value, $Res Function(UpdatePinDto) then) =
      _$UpdatePinDtoCopyWithImpl<$Res, UpdatePinDto>;
  @useResult
  $Res call({String token, String pin});
}

/// @nodoc
class _$UpdatePinDtoCopyWithImpl<$Res, $Val extends UpdatePinDto>
    implements $UpdatePinDtoCopyWith<$Res> {
  _$UpdatePinDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePinDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? pin = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePinDtoImplCopyWith<$Res>
    implements $UpdatePinDtoCopyWith<$Res> {
  factory _$$UpdatePinDtoImplCopyWith(
          _$UpdatePinDtoImpl value, $Res Function(_$UpdatePinDtoImpl) then) =
      __$$UpdatePinDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String pin});
}

/// @nodoc
class __$$UpdatePinDtoImplCopyWithImpl<$Res>
    extends _$UpdatePinDtoCopyWithImpl<$Res, _$UpdatePinDtoImpl>
    implements _$$UpdatePinDtoImplCopyWith<$Res> {
  __$$UpdatePinDtoImplCopyWithImpl(
      _$UpdatePinDtoImpl _value, $Res Function(_$UpdatePinDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePinDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? pin = null,
  }) {
    return _then(_$UpdatePinDtoImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePinDtoImpl implements _UpdatePinDto {
  const _$UpdatePinDtoImpl({required this.token, required this.pin});

  factory _$UpdatePinDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePinDtoImplFromJson(json);

  @override
  final String token;
  @override
  final String pin;

  @override
  String toString() {
    return 'UpdatePinDto(token: $token, pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePinDtoImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, pin);

  /// Create a copy of UpdatePinDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePinDtoImplCopyWith<_$UpdatePinDtoImpl> get copyWith =>
      __$$UpdatePinDtoImplCopyWithImpl<_$UpdatePinDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePinDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdatePinDto implements UpdatePinDto {
  const factory _UpdatePinDto(
      {required final String token,
      required final String pin}) = _$UpdatePinDtoImpl;

  factory _UpdatePinDto.fromJson(Map<String, dynamic> json) =
      _$UpdatePinDtoImpl.fromJson;

  @override
  String get token;
  @override
  String get pin;

  /// Create a copy of UpdatePinDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePinDtoImplCopyWith<_$UpdatePinDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestOTPDto _$RequestOTPDtoFromJson(Map<String, dynamic> json) {
  return _RequestOTPDto.fromJson(json);
}

/// @nodoc
mixin _$RequestOTPDto {
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this RequestOTPDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestOTPDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestOTPDtoCopyWith<RequestOTPDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOTPDtoCopyWith<$Res> {
  factory $RequestOTPDtoCopyWith(
          RequestOTPDto value, $Res Function(RequestOTPDto) then) =
      _$RequestOTPDtoCopyWithImpl<$Res, RequestOTPDto>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class _$RequestOTPDtoCopyWithImpl<$Res, $Val extends RequestOTPDto>
    implements $RequestOTPDtoCopyWith<$Res> {
  _$RequestOTPDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestOTPDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOTPDtoImplCopyWith<$Res>
    implements $RequestOTPDtoCopyWith<$Res> {
  factory _$$RequestOTPDtoImplCopyWith(
          _$RequestOTPDtoImpl value, $Res Function(_$RequestOTPDtoImpl) then) =
      __$$RequestOTPDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$RequestOTPDtoImplCopyWithImpl<$Res>
    extends _$RequestOTPDtoCopyWithImpl<$Res, _$RequestOTPDtoImpl>
    implements _$$RequestOTPDtoImplCopyWith<$Res> {
  __$$RequestOTPDtoImplCopyWithImpl(
      _$RequestOTPDtoImpl _value, $Res Function(_$RequestOTPDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestOTPDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$RequestOTPDtoImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOTPDtoImpl implements _RequestOTPDto {
  const _$RequestOTPDtoImpl({required this.phoneNumber});

  factory _$RequestOTPDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOTPDtoImplFromJson(json);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'RequestOTPDto(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOTPDtoImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of RequestOTPDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOTPDtoImplCopyWith<_$RequestOTPDtoImpl> get copyWith =>
      __$$RequestOTPDtoImplCopyWithImpl<_$RequestOTPDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOTPDtoImplToJson(
      this,
    );
  }
}

abstract class _RequestOTPDto implements RequestOTPDto {
  const factory _RequestOTPDto({required final String phoneNumber}) =
      _$RequestOTPDtoImpl;

  factory _RequestOTPDto.fromJson(Map<String, dynamic> json) =
      _$RequestOTPDtoImpl.fromJson;

  @override
  String get phoneNumber;

  /// Create a copy of RequestOTPDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestOTPDtoImplCopyWith<_$RequestOTPDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteAccountDto _$DeleteAccountDtoFromJson(Map<String, dynamic> json) {
  return _DeleteAccountDto.fromJson(json);
}

/// @nodoc
mixin _$DeleteAccountDto {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  List<String> get reasons => throw _privateConstructorUsedError;

  /// Serializes this DeleteAccountDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteAccountDtoCopyWith<DeleteAccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteAccountDtoCopyWith<$Res> {
  factory $DeleteAccountDtoCopyWith(
          DeleteAccountDto value, $Res Function(DeleteAccountDto) then) =
      _$DeleteAccountDtoCopyWithImpl<$Res, DeleteAccountDto>;
  @useResult
  $Res call({String phoneNumber, String otp, List<String> reasons});
}

/// @nodoc
class _$DeleteAccountDtoCopyWithImpl<$Res, $Val extends DeleteAccountDto>
    implements $DeleteAccountDtoCopyWith<$Res> {
  _$DeleteAccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
    Object? reasons = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      reasons: null == reasons
          ? _value.reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteAccountDtoImplCopyWith<$Res>
    implements $DeleteAccountDtoCopyWith<$Res> {
  factory _$$DeleteAccountDtoImplCopyWith(_$DeleteAccountDtoImpl value,
          $Res Function(_$DeleteAccountDtoImpl) then) =
      __$$DeleteAccountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, String otp, List<String> reasons});
}

/// @nodoc
class __$$DeleteAccountDtoImplCopyWithImpl<$Res>
    extends _$DeleteAccountDtoCopyWithImpl<$Res, _$DeleteAccountDtoImpl>
    implements _$$DeleteAccountDtoImplCopyWith<$Res> {
  __$$DeleteAccountDtoImplCopyWithImpl(_$DeleteAccountDtoImpl _value,
      $Res Function(_$DeleteAccountDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? otp = null,
    Object? reasons = null,
  }) {
    return _then(_$DeleteAccountDtoImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      reasons: null == reasons
          ? _value._reasons
          : reasons // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteAccountDtoImpl implements _DeleteAccountDto {
  const _$DeleteAccountDtoImpl(
      {required this.phoneNumber,
      required this.otp,
      required final List<String> reasons})
      : _reasons = reasons;

  factory _$DeleteAccountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteAccountDtoImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String otp;
  final List<String> _reasons;
  @override
  List<String> get reasons {
    if (_reasons is EqualUnmodifiableListView) return _reasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reasons);
  }

  @override
  String toString() {
    return 'DeleteAccountDto(phoneNumber: $phoneNumber, otp: $otp, reasons: $reasons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAccountDtoImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            const DeepCollectionEquality().equals(other._reasons, _reasons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, otp,
      const DeepCollectionEquality().hash(_reasons));

  /// Create a copy of DeleteAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAccountDtoImplCopyWith<_$DeleteAccountDtoImpl> get copyWith =>
      __$$DeleteAccountDtoImplCopyWithImpl<_$DeleteAccountDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteAccountDtoImplToJson(
      this,
    );
  }
}

abstract class _DeleteAccountDto implements DeleteAccountDto {
  const factory _DeleteAccountDto(
      {required final String phoneNumber,
      required final String otp,
      required final List<String> reasons}) = _$DeleteAccountDtoImpl;

  factory _DeleteAccountDto.fromJson(Map<String, dynamic> json) =
      _$DeleteAccountDtoImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String get otp;
  @override
  List<String> get reasons;

  /// Create a copy of DeleteAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteAccountDtoImplCopyWith<_$DeleteAccountDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
