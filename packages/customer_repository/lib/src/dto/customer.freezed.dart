// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindAllCustomerDto _$FindAllCustomerDtoFromJson(Map<String, dynamic> json) {
  return _FindAllCustomerDto.fromJson(json);
}

/// @nodoc
mixin _$FindAllCustomerDto {
  String? get ownerId => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;

  /// Serializes this FindAllCustomerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindAllCustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindAllCustomerDtoCopyWith<FindAllCustomerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllCustomerDtoCopyWith<$Res> {
  factory $FindAllCustomerDtoCopyWith(
          FindAllCustomerDto value, $Res Function(FindAllCustomerDto) then) =
      _$FindAllCustomerDtoCopyWithImpl<$Res, FindAllCustomerDto>;
  @useResult
  $Res call({String? ownerId, String? search});
}

/// @nodoc
class _$FindAllCustomerDtoCopyWithImpl<$Res, $Val extends FindAllCustomerDto>
    implements $FindAllCustomerDtoCopyWith<$Res> {
  _$FindAllCustomerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindAllCustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = freezed,
    Object? search = freezed,
  }) {
    return _then(_value.copyWith(
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindAllCustomerDtoImplCopyWith<$Res>
    implements $FindAllCustomerDtoCopyWith<$Res> {
  factory _$$FindAllCustomerDtoImplCopyWith(_$FindAllCustomerDtoImpl value,
          $Res Function(_$FindAllCustomerDtoImpl) then) =
      __$$FindAllCustomerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? ownerId, String? search});
}

/// @nodoc
class __$$FindAllCustomerDtoImplCopyWithImpl<$Res>
    extends _$FindAllCustomerDtoCopyWithImpl<$Res, _$FindAllCustomerDtoImpl>
    implements _$$FindAllCustomerDtoImplCopyWith<$Res> {
  __$$FindAllCustomerDtoImplCopyWithImpl(_$FindAllCustomerDtoImpl _value,
      $Res Function(_$FindAllCustomerDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindAllCustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = freezed,
    Object? search = freezed,
  }) {
    return _then(_$FindAllCustomerDtoImpl(
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindAllCustomerDtoImpl implements _FindAllCustomerDto {
  const _$FindAllCustomerDtoImpl({this.ownerId, this.search});

  factory _$FindAllCustomerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindAllCustomerDtoImplFromJson(json);

  @override
  final String? ownerId;
  @override
  final String? search;

  @override
  String toString() {
    return 'FindAllCustomerDto(ownerId: $ownerId, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllCustomerDtoImpl &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.search, search) || other.search == search));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ownerId, search);

  /// Create a copy of FindAllCustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllCustomerDtoImplCopyWith<_$FindAllCustomerDtoImpl> get copyWith =>
      __$$FindAllCustomerDtoImplCopyWithImpl<_$FindAllCustomerDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindAllCustomerDtoImplToJson(
      this,
    );
  }
}

abstract class _FindAllCustomerDto implements FindAllCustomerDto {
  const factory _FindAllCustomerDto(
      {final String? ownerId, final String? search}) = _$FindAllCustomerDtoImpl;

  factory _FindAllCustomerDto.fromJson(Map<String, dynamic> json) =
      _$FindAllCustomerDtoImpl.fromJson;

  @override
  String? get ownerId;
  @override
  String? get search;

  /// Create a copy of FindAllCustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindAllCustomerDtoImplCopyWith<_$FindAllCustomerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateCustomerDto _$CreateCustomerDtoFromJson(Map<String, dynamic> json) {
  return _CreateCustomerDto.fromJson(json);
}

/// @nodoc
mixin _$CreateCustomerDto {
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get outletId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this CreateCustomerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateCustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateCustomerDtoCopyWith<CreateCustomerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCustomerDtoCopyWith<$Res> {
  factory $CreateCustomerDtoCopyWith(
          CreateCustomerDto value, $Res Function(CreateCustomerDto) then) =
      _$CreateCustomerDtoCopyWithImpl<$Res, CreateCustomerDto>;
  @useResult
  $Res call(
      {String name,
      String phoneNumber,
      String? outletId,
      String? email,
      String? address});
}

/// @nodoc
class _$CreateCustomerDtoCopyWithImpl<$Res, $Val extends CreateCustomerDto>
    implements $CreateCustomerDtoCopyWith<$Res> {
  _$CreateCustomerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateCustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? outletId = freezed,
    Object? email = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateCustomerDtoImplCopyWith<$Res>
    implements $CreateCustomerDtoCopyWith<$Res> {
  factory _$$CreateCustomerDtoImplCopyWith(_$CreateCustomerDtoImpl value,
          $Res Function(_$CreateCustomerDtoImpl) then) =
      __$$CreateCustomerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String phoneNumber,
      String? outletId,
      String? email,
      String? address});
}

/// @nodoc
class __$$CreateCustomerDtoImplCopyWithImpl<$Res>
    extends _$CreateCustomerDtoCopyWithImpl<$Res, _$CreateCustomerDtoImpl>
    implements _$$CreateCustomerDtoImplCopyWith<$Res> {
  __$$CreateCustomerDtoImplCopyWithImpl(_$CreateCustomerDtoImpl _value,
      $Res Function(_$CreateCustomerDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateCustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
    Object? outletId = freezed,
    Object? email = freezed,
    Object? address = freezed,
  }) {
    return _then(_$CreateCustomerDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCustomerDtoImpl implements _CreateCustomerDto {
  const _$CreateCustomerDtoImpl(
      {required this.name,
      required this.phoneNumber,
      this.outletId,
      this.email,
      this.address});

  factory _$CreateCustomerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateCustomerDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String? outletId;
  @override
  final String? email;
  @override
  final String? address;

  @override
  String toString() {
    return 'CreateCustomerDto(name: $name, phoneNumber: $phoneNumber, outletId: $outletId, email: $email, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCustomerDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, phoneNumber, outletId, email, address);

  /// Create a copy of CreateCustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCustomerDtoImplCopyWith<_$CreateCustomerDtoImpl> get copyWith =>
      __$$CreateCustomerDtoImplCopyWithImpl<_$CreateCustomerDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCustomerDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateCustomerDto implements CreateCustomerDto {
  const factory _CreateCustomerDto(
      {required final String name,
      required final String phoneNumber,
      final String? outletId,
      final String? email,
      final String? address}) = _$CreateCustomerDtoImpl;

  factory _CreateCustomerDto.fromJson(Map<String, dynamic> json) =
      _$CreateCustomerDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String? get outletId;
  @override
  String? get email;
  @override
  String? get address;

  /// Create a copy of CreateCustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCustomerDtoImplCopyWith<_$CreateCustomerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
