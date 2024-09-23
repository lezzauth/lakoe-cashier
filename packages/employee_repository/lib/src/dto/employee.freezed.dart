// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateEmployeeDto _$CreateEmployeeDtoFromJson(Map<String, dynamic> json) {
  return _CreateEmployeeDto.fromJson(json);
}

/// @nodoc
mixin _$CreateEmployeeDto {
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateEmployeeDtoCopyWith<CreateEmployeeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEmployeeDtoCopyWith<$Res> {
  factory $CreateEmployeeDtoCopyWith(
          CreateEmployeeDto value, $Res Function(CreateEmployeeDto) then) =
      _$CreateEmployeeDtoCopyWithImpl<$Res, CreateEmployeeDto>;
  @useResult
  $Res call(
      {String name,
      String? email,
      String pin,
      String phoneNumber,
      String role,
      String outletId});
}

/// @nodoc
class _$CreateEmployeeDtoCopyWithImpl<$Res, $Val extends CreateEmployeeDto>
    implements $CreateEmployeeDtoCopyWith<$Res> {
  _$CreateEmployeeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = freezed,
    Object? pin = null,
    Object? phoneNumber = null,
    Object? role = null,
    Object? outletId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateEmployeeDtoImplCopyWith<$Res>
    implements $CreateEmployeeDtoCopyWith<$Res> {
  factory _$$CreateEmployeeDtoImplCopyWith(_$CreateEmployeeDtoImpl value,
          $Res Function(_$CreateEmployeeDtoImpl) then) =
      __$$CreateEmployeeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? email,
      String pin,
      String phoneNumber,
      String role,
      String outletId});
}

/// @nodoc
class __$$CreateEmployeeDtoImplCopyWithImpl<$Res>
    extends _$CreateEmployeeDtoCopyWithImpl<$Res, _$CreateEmployeeDtoImpl>
    implements _$$CreateEmployeeDtoImplCopyWith<$Res> {
  __$$CreateEmployeeDtoImplCopyWithImpl(_$CreateEmployeeDtoImpl _value,
      $Res Function(_$CreateEmployeeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = freezed,
    Object? pin = null,
    Object? phoneNumber = null,
    Object? role = null,
    Object? outletId = null,
  }) {
    return _then(_$CreateEmployeeDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateEmployeeDtoImpl implements _CreateEmployeeDto {
  const _$CreateEmployeeDtoImpl(
      {required this.name,
      this.email,
      required this.pin,
      required this.phoneNumber,
      required this.role,
      required this.outletId});

  factory _$CreateEmployeeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateEmployeeDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String? email;
  @override
  final String pin;
  @override
  final String phoneNumber;
  @override
  final String role;
  @override
  final String outletId;

  @override
  String toString() {
    return 'CreateEmployeeDto(name: $name, email: $email, pin: $pin, phoneNumber: $phoneNumber, role: $role, outletId: $outletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEmployeeDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, pin, phoneNumber, role, outletId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEmployeeDtoImplCopyWith<_$CreateEmployeeDtoImpl> get copyWith =>
      __$$CreateEmployeeDtoImplCopyWithImpl<_$CreateEmployeeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateEmployeeDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateEmployeeDto implements CreateEmployeeDto {
  const factory _CreateEmployeeDto(
      {required final String name,
      final String? email,
      required final String pin,
      required final String phoneNumber,
      required final String role,
      required final String outletId}) = _$CreateEmployeeDtoImpl;

  factory _CreateEmployeeDto.fromJson(Map<String, dynamic> json) =
      _$CreateEmployeeDtoImpl.fromJson;

  @override
  String get name;
  @override
  String? get email;
  @override
  String get pin;
  @override
  String get phoneNumber;
  @override
  String get role;
  @override
  String get outletId;
  @override
  @JsonKey(ignore: true)
  _$$CreateEmployeeDtoImplCopyWith<_$CreateEmployeeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateEmployeeDto _$UpdateEmployeeDtoFromJson(Map<String, dynamic> json) {
  return _UpdateEmployeeDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateEmployeeDto {
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get pin => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get outletId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateEmployeeDtoCopyWith<UpdateEmployeeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEmployeeDtoCopyWith<$Res> {
  factory $UpdateEmployeeDtoCopyWith(
          UpdateEmployeeDto value, $Res Function(UpdateEmployeeDto) then) =
      _$UpdateEmployeeDtoCopyWithImpl<$Res, UpdateEmployeeDto>;
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? pin,
      String? phoneNumber,
      String? role,
      String? outletId});
}

/// @nodoc
class _$UpdateEmployeeDtoCopyWithImpl<$Res, $Val extends UpdateEmployeeDto>
    implements $UpdateEmployeeDtoCopyWith<$Res> {
  _$UpdateEmployeeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? pin = freezed,
    Object? phoneNumber = freezed,
    Object? role = freezed,
    Object? outletId = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateEmployeeDtoImplCopyWith<$Res>
    implements $UpdateEmployeeDtoCopyWith<$Res> {
  factory _$$UpdateEmployeeDtoImplCopyWith(_$UpdateEmployeeDtoImpl value,
          $Res Function(_$UpdateEmployeeDtoImpl) then) =
      __$$UpdateEmployeeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? email,
      String? pin,
      String? phoneNumber,
      String? role,
      String? outletId});
}

/// @nodoc
class __$$UpdateEmployeeDtoImplCopyWithImpl<$Res>
    extends _$UpdateEmployeeDtoCopyWithImpl<$Res, _$UpdateEmployeeDtoImpl>
    implements _$$UpdateEmployeeDtoImplCopyWith<$Res> {
  __$$UpdateEmployeeDtoImplCopyWithImpl(_$UpdateEmployeeDtoImpl _value,
      $Res Function(_$UpdateEmployeeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? pin = freezed,
    Object? phoneNumber = freezed,
    Object? role = freezed,
    Object? outletId = freezed,
  }) {
    return _then(_$UpdateEmployeeDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateEmployeeDtoImpl implements _UpdateEmployeeDto {
  const _$UpdateEmployeeDtoImpl(
      {this.name,
      this.email,
      this.pin,
      this.phoneNumber,
      this.role,
      this.outletId});

  factory _$UpdateEmployeeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateEmployeeDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? pin;
  @override
  final String? phoneNumber;
  @override
  final String? role;
  @override
  final String? outletId;

  @override
  String toString() {
    return 'UpdateEmployeeDto(name: $name, email: $email, pin: $pin, phoneNumber: $phoneNumber, role: $role, outletId: $outletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEmployeeDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, pin, phoneNumber, role, outletId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEmployeeDtoImplCopyWith<_$UpdateEmployeeDtoImpl> get copyWith =>
      __$$UpdateEmployeeDtoImplCopyWithImpl<_$UpdateEmployeeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateEmployeeDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateEmployeeDto implements UpdateEmployeeDto {
  const factory _UpdateEmployeeDto(
      {final String? name,
      final String? email,
      final String? pin,
      final String? phoneNumber,
      final String? role,
      final String? outletId}) = _$UpdateEmployeeDtoImpl;

  factory _UpdateEmployeeDto.fromJson(Map<String, dynamic> json) =
      _$UpdateEmployeeDtoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get pin;
  @override
  String? get phoneNumber;
  @override
  String? get role;
  @override
  String? get outletId;
  @override
  @JsonKey(ignore: true)
  _$$UpdateEmployeeDtoImplCopyWith<_$UpdateEmployeeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FindAllEmployeeDto _$FindAllEmployeeDtoFromJson(Map<String, dynamic> json) {
  return _FindAllEmployeeDto.fromJson(json);
}

/// @nodoc
mixin _$FindAllEmployeeDto {
  String get outletId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FindAllEmployeeDtoCopyWith<FindAllEmployeeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllEmployeeDtoCopyWith<$Res> {
  factory $FindAllEmployeeDtoCopyWith(
          FindAllEmployeeDto value, $Res Function(FindAllEmployeeDto) then) =
      _$FindAllEmployeeDtoCopyWithImpl<$Res, FindAllEmployeeDto>;
  @useResult
  $Res call({String outletId});
}

/// @nodoc
class _$FindAllEmployeeDtoCopyWithImpl<$Res, $Val extends FindAllEmployeeDto>
    implements $FindAllEmployeeDtoCopyWith<$Res> {
  _$FindAllEmployeeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
  }) {
    return _then(_value.copyWith(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindAllEmployeeDtoImplCopyWith<$Res>
    implements $FindAllEmployeeDtoCopyWith<$Res> {
  factory _$$FindAllEmployeeDtoImplCopyWith(_$FindAllEmployeeDtoImpl value,
          $Res Function(_$FindAllEmployeeDtoImpl) then) =
      __$$FindAllEmployeeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String outletId});
}

/// @nodoc
class __$$FindAllEmployeeDtoImplCopyWithImpl<$Res>
    extends _$FindAllEmployeeDtoCopyWithImpl<$Res, _$FindAllEmployeeDtoImpl>
    implements _$$FindAllEmployeeDtoImplCopyWith<$Res> {
  __$$FindAllEmployeeDtoImplCopyWithImpl(_$FindAllEmployeeDtoImpl _value,
      $Res Function(_$FindAllEmployeeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
  }) {
    return _then(_$FindAllEmployeeDtoImpl(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindAllEmployeeDtoImpl implements _FindAllEmployeeDto {
  const _$FindAllEmployeeDtoImpl({required this.outletId});

  factory _$FindAllEmployeeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindAllEmployeeDtoImplFromJson(json);

  @override
  final String outletId;

  @override
  String toString() {
    return 'FindAllEmployeeDto(outletId: $outletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllEmployeeDtoImpl &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, outletId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllEmployeeDtoImplCopyWith<_$FindAllEmployeeDtoImpl> get copyWith =>
      __$$FindAllEmployeeDtoImplCopyWithImpl<_$FindAllEmployeeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindAllEmployeeDtoImplToJson(
      this,
    );
  }
}

abstract class _FindAllEmployeeDto implements FindAllEmployeeDto {
  const factory _FindAllEmployeeDto({required final String outletId}) =
      _$FindAllEmployeeDtoImpl;

  factory _FindAllEmployeeDto.fromJson(Map<String, dynamic> json) =
      _$FindAllEmployeeDtoImpl.fromJson;

  @override
  String get outletId;
  @override
  @JsonKey(ignore: true)
  _$$FindAllEmployeeDtoImplCopyWith<_$FindAllEmployeeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
