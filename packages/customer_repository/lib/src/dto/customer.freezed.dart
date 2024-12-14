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

CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) {
  return _CustomerDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerDto {
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get outletId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this CustomerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerDtoCopyWith<CustomerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDtoCopyWith<$Res> {
  factory $CustomerDtoCopyWith(
          CustomerDto value, $Res Function(CustomerDto) then) =
      _$CustomerDtoCopyWithImpl<$Res, CustomerDto>;
  @useResult
  $Res call(
      {String name,
      String phoneNumber,
      String? outletId,
      String? email,
      String? address});
}

/// @nodoc
class _$CustomerDtoCopyWithImpl<$Res, $Val extends CustomerDto>
    implements $CustomerDtoCopyWith<$Res> {
  _$CustomerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerDto
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
abstract class _$$CustomerDtoImplCopyWith<$Res>
    implements $CustomerDtoCopyWith<$Res> {
  factory _$$CustomerDtoImplCopyWith(
          _$CustomerDtoImpl value, $Res Function(_$CustomerDtoImpl) then) =
      __$$CustomerDtoImplCopyWithImpl<$Res>;
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
class __$$CustomerDtoImplCopyWithImpl<$Res>
    extends _$CustomerDtoCopyWithImpl<$Res, _$CustomerDtoImpl>
    implements _$$CustomerDtoImplCopyWith<$Res> {
  __$$CustomerDtoImplCopyWithImpl(
      _$CustomerDtoImpl _value, $Res Function(_$CustomerDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerDto
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
    return _then(_$CustomerDtoImpl(
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
class _$CustomerDtoImpl implements _CustomerDto {
  const _$CustomerDtoImpl(
      {required this.name,
      required this.phoneNumber,
      this.outletId,
      this.email,
      this.address});

  factory _$CustomerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerDtoImplFromJson(json);

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
    return 'CustomerDto(name: $name, phoneNumber: $phoneNumber, outletId: $outletId, email: $email, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerDtoImpl &&
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

  /// Create a copy of CustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerDtoImplCopyWith<_$CustomerDtoImpl> get copyWith =>
      __$$CustomerDtoImplCopyWithImpl<_$CustomerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerDtoImplToJson(
      this,
    );
  }
}

abstract class _CustomerDto implements CustomerDto {
  const factory _CustomerDto(
      {required final String name,
      required final String phoneNumber,
      final String? outletId,
      final String? email,
      final String? address}) = _$CustomerDtoImpl;

  factory _CustomerDto.fromJson(Map<String, dynamic> json) =
      _$CustomerDtoImpl.fromJson;

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

  /// Create a copy of CustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerDtoImplCopyWith<_$CustomerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
