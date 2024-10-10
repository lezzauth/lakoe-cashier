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

OutletDto _$OutletDtoFromJson(Map<String, dynamic> json) {
  return _OutletDto.fromJson(json);
}

/// @nodoc
mixin _$OutletDto {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this OutletDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutletDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutletDtoCopyWith<OutletDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletDtoCopyWith<$Res> {
  factory $OutletDtoCopyWith(OutletDto value, $Res Function(OutletDto) then) =
      _$OutletDtoCopyWithImpl<$Res, OutletDto>;
  @useResult
  $Res call(
      {String name,
      String address,
      String type,
      double latitude,
      double longitude});
}

/// @nodoc
class _$OutletDtoCopyWithImpl<$Res, $Val extends OutletDto>
    implements $OutletDtoCopyWith<$Res> {
  _$OutletDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutletDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? type = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutletDtoImplCopyWith<$Res>
    implements $OutletDtoCopyWith<$Res> {
  factory _$$OutletDtoImplCopyWith(
          _$OutletDtoImpl value, $Res Function(_$OutletDtoImpl) then) =
      __$$OutletDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String address,
      String type,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$OutletDtoImplCopyWithImpl<$Res>
    extends _$OutletDtoCopyWithImpl<$Res, _$OutletDtoImpl>
    implements _$$OutletDtoImplCopyWith<$Res> {
  __$$OutletDtoImplCopyWithImpl(
      _$OutletDtoImpl _value, $Res Function(_$OutletDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutletDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? type = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$OutletDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutletDtoImpl implements _OutletDto {
  const _$OutletDtoImpl(
      {required this.name,
      required this.address,
      required this.type,
      required this.latitude,
      required this.longitude});

  factory _$OutletDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutletDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String address;
  @override
  final String type;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'OutletDto(name: $name, address: $address, type: $type, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, address, type, latitude, longitude);

  /// Create a copy of OutletDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletDtoImplCopyWith<_$OutletDtoImpl> get copyWith =>
      __$$OutletDtoImplCopyWithImpl<_$OutletDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletDtoImplToJson(
      this,
    );
  }
}

abstract class _OutletDto implements OutletDto {
  const factory _OutletDto(
      {required final String name,
      required final String address,
      required final String type,
      required final double latitude,
      required final double longitude}) = _$OutletDtoImpl;

  factory _OutletDto.fromJson(Map<String, dynamic> json) =
      _$OutletDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get address;
  @override
  String get type;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of OutletDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletDtoImplCopyWith<_$OutletDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterDto _$RegisterDtoFromJson(Map<String, dynamic> json) {
  return _RegisterDto.fromJson(json);
}

/// @nodoc
mixin _$RegisterDto {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;
  OutletDto get outlet => throw _privateConstructorUsedError;

  /// Serializes this RegisterDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterDtoCopyWith<RegisterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterDtoCopyWith<$Res> {
  factory $RegisterDtoCopyWith(
          RegisterDto value, $Res Function(RegisterDto) then) =
      _$RegisterDtoCopyWithImpl<$Res, RegisterDto>;
  @useResult
  $Res call(
      {String name,
      String email,
      String phoneNumber,
      String pin,
      OutletDto outlet});

  $OutletDtoCopyWith<$Res> get outlet;
}

/// @nodoc
class _$RegisterDtoCopyWithImpl<$Res, $Val extends RegisterDto>
    implements $RegisterDtoCopyWith<$Res> {
  _$RegisterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? pin = null,
    Object? outlet = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      outlet: null == outlet
          ? _value.outlet
          : outlet // ignore: cast_nullable_to_non_nullable
              as OutletDto,
    ) as $Val);
  }

  /// Create a copy of RegisterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutletDtoCopyWith<$Res> get outlet {
    return $OutletDtoCopyWith<$Res>(_value.outlet, (value) {
      return _then(_value.copyWith(outlet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterDtoImplCopyWith<$Res>
    implements $RegisterDtoCopyWith<$Res> {
  factory _$$RegisterDtoImplCopyWith(
          _$RegisterDtoImpl value, $Res Function(_$RegisterDtoImpl) then) =
      __$$RegisterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String phoneNumber,
      String pin,
      OutletDto outlet});

  @override
  $OutletDtoCopyWith<$Res> get outlet;
}

/// @nodoc
class __$$RegisterDtoImplCopyWithImpl<$Res>
    extends _$RegisterDtoCopyWithImpl<$Res, _$RegisterDtoImpl>
    implements _$$RegisterDtoImplCopyWith<$Res> {
  __$$RegisterDtoImplCopyWithImpl(
      _$RegisterDtoImpl _value, $Res Function(_$RegisterDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? pin = null,
    Object? outlet = null,
  }) {
    return _then(_$RegisterDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      outlet: null == outlet
          ? _value.outlet
          : outlet // ignore: cast_nullable_to_non_nullable
              as OutletDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterDtoImpl implements _RegisterDto {
  const _$RegisterDtoImpl(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.pin,
      required this.outlet});

  factory _$RegisterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String pin;
  @override
  final OutletDto outlet;

  @override
  String toString() {
    return 'RegisterDto(name: $name, email: $email, phoneNumber: $phoneNumber, pin: $pin, outlet: $outlet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.outlet, outlet) || other.outlet == outlet));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, phoneNumber, pin, outlet);

  /// Create a copy of RegisterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterDtoImplCopyWith<_$RegisterDtoImpl> get copyWith =>
      __$$RegisterDtoImplCopyWithImpl<_$RegisterDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterDtoImplToJson(
      this,
    );
  }
}

abstract class _RegisterDto implements RegisterDto {
  const factory _RegisterDto(
      {required final String name,
      required final String email,
      required final String phoneNumber,
      required final String pin,
      required final OutletDto outlet}) = _$RegisterDtoImpl;

  factory _RegisterDto.fromJson(Map<String, dynamic> json) =
      _$RegisterDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get pin;
  @override
  OutletDto get outlet;

  /// Create a copy of RegisterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterDtoImplCopyWith<_$RegisterDtoImpl> get copyWith =>
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

VerifyOTPDto _$VerifyOTPDtoFromJson(Map<String, dynamic> json) {
  return _VerifyOTPDto.fromJson(json);
}

/// @nodoc
mixin _$VerifyOTPDto {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Serializes this VerifyOTPDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOTPDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOTPDtoCopyWith<VerifyOTPDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOTPDtoCopyWith<$Res> {
  factory $VerifyOTPDtoCopyWith(
          VerifyOTPDto value, $Res Function(VerifyOTPDto) then) =
      _$VerifyOTPDtoCopyWithImpl<$Res, VerifyOTPDto>;
  @useResult
  $Res call({String phoneNumber, String code});
}

/// @nodoc
class _$VerifyOTPDtoCopyWithImpl<$Res, $Val extends VerifyOTPDto>
    implements $VerifyOTPDtoCopyWith<$Res> {
  _$VerifyOTPDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOTPDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOTPDtoImplCopyWith<$Res>
    implements $VerifyOTPDtoCopyWith<$Res> {
  factory _$$VerifyOTPDtoImplCopyWith(
          _$VerifyOTPDtoImpl value, $Res Function(_$VerifyOTPDtoImpl) then) =
      __$$VerifyOTPDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, String code});
}

/// @nodoc
class __$$VerifyOTPDtoImplCopyWithImpl<$Res>
    extends _$VerifyOTPDtoCopyWithImpl<$Res, _$VerifyOTPDtoImpl>
    implements _$$VerifyOTPDtoImplCopyWith<$Res> {
  __$$VerifyOTPDtoImplCopyWithImpl(
      _$VerifyOTPDtoImpl _value, $Res Function(_$VerifyOTPDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOTPDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? code = null,
  }) {
    return _then(_$VerifyOTPDtoImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOTPDtoImpl implements _VerifyOTPDto {
  const _$VerifyOTPDtoImpl({required this.phoneNumber, required this.code});

  factory _$VerifyOTPDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOTPDtoImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String code;

  @override
  String toString() {
    return 'VerifyOTPDto(phoneNumber: $phoneNumber, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOTPDtoImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, code);

  /// Create a copy of VerifyOTPDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOTPDtoImplCopyWith<_$VerifyOTPDtoImpl> get copyWith =>
      __$$VerifyOTPDtoImplCopyWithImpl<_$VerifyOTPDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOTPDtoImplToJson(
      this,
    );
  }
}

abstract class _VerifyOTPDto implements VerifyOTPDto {
  const factory _VerifyOTPDto(
      {required final String phoneNumber,
      required final String code}) = _$VerifyOTPDtoImpl;

  factory _VerifyOTPDto.fromJson(Map<String, dynamic> json) =
      _$VerifyOTPDtoImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String get code;

  /// Create a copy of VerifyOTPDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOTPDtoImplCopyWith<_$VerifyOTPDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
