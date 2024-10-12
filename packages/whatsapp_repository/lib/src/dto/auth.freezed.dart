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

WAAuthRequestCodeDto _$WAAuthRequestCodeDtoFromJson(Map<String, dynamic> json) {
  return _WAAuthRequestCodeDto.fromJson(json);
}

/// @nodoc
mixin _$WAAuthRequestCodeDto {
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this WAAuthRequestCodeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WAAuthRequestCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WAAuthRequestCodeDtoCopyWith<WAAuthRequestCodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WAAuthRequestCodeDtoCopyWith<$Res> {
  factory $WAAuthRequestCodeDtoCopyWith(WAAuthRequestCodeDto value,
          $Res Function(WAAuthRequestCodeDto) then) =
      _$WAAuthRequestCodeDtoCopyWithImpl<$Res, WAAuthRequestCodeDto>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class _$WAAuthRequestCodeDtoCopyWithImpl<$Res,
        $Val extends WAAuthRequestCodeDto>
    implements $WAAuthRequestCodeDtoCopyWith<$Res> {
  _$WAAuthRequestCodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WAAuthRequestCodeDto
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
abstract class _$$WAAuthRequestCodeDtoImplCopyWith<$Res>
    implements $WAAuthRequestCodeDtoCopyWith<$Res> {
  factory _$$WAAuthRequestCodeDtoImplCopyWith(_$WAAuthRequestCodeDtoImpl value,
          $Res Function(_$WAAuthRequestCodeDtoImpl) then) =
      __$$WAAuthRequestCodeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$WAAuthRequestCodeDtoImplCopyWithImpl<$Res>
    extends _$WAAuthRequestCodeDtoCopyWithImpl<$Res, _$WAAuthRequestCodeDtoImpl>
    implements _$$WAAuthRequestCodeDtoImplCopyWith<$Res> {
  __$$WAAuthRequestCodeDtoImplCopyWithImpl(_$WAAuthRequestCodeDtoImpl _value,
      $Res Function(_$WAAuthRequestCodeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WAAuthRequestCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$WAAuthRequestCodeDtoImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WAAuthRequestCodeDtoImpl implements _WAAuthRequestCodeDto {
  const _$WAAuthRequestCodeDtoImpl({required this.phoneNumber});

  factory _$WAAuthRequestCodeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WAAuthRequestCodeDtoImplFromJson(json);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'WAAuthRequestCodeDto(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WAAuthRequestCodeDtoImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of WAAuthRequestCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WAAuthRequestCodeDtoImplCopyWith<_$WAAuthRequestCodeDtoImpl>
      get copyWith =>
          __$$WAAuthRequestCodeDtoImplCopyWithImpl<_$WAAuthRequestCodeDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WAAuthRequestCodeDtoImplToJson(
      this,
    );
  }
}

abstract class _WAAuthRequestCodeDto implements WAAuthRequestCodeDto {
  const factory _WAAuthRequestCodeDto({required final String phoneNumber}) =
      _$WAAuthRequestCodeDtoImpl;

  factory _WAAuthRequestCodeDto.fromJson(Map<String, dynamic> json) =
      _$WAAuthRequestCodeDtoImpl.fromJson;

  @override
  String get phoneNumber;

  /// Create a copy of WAAuthRequestCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WAAuthRequestCodeDtoImplCopyWith<_$WAAuthRequestCodeDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WAAuthAuthorizeCodeDto _$WAAuthAuthorizeCodeDtoFromJson(
    Map<String, dynamic> json) {
  return _WAAuthAuthorizeCodeDto.fromJson(json);
}

/// @nodoc
mixin _$WAAuthAuthorizeCodeDto {
  String get code => throw _privateConstructorUsedError;

  /// Serializes this WAAuthAuthorizeCodeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WAAuthAuthorizeCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WAAuthAuthorizeCodeDtoCopyWith<WAAuthAuthorizeCodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WAAuthAuthorizeCodeDtoCopyWith<$Res> {
  factory $WAAuthAuthorizeCodeDtoCopyWith(WAAuthAuthorizeCodeDto value,
          $Res Function(WAAuthAuthorizeCodeDto) then) =
      _$WAAuthAuthorizeCodeDtoCopyWithImpl<$Res, WAAuthAuthorizeCodeDto>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class _$WAAuthAuthorizeCodeDtoCopyWithImpl<$Res,
        $Val extends WAAuthAuthorizeCodeDto>
    implements $WAAuthAuthorizeCodeDtoCopyWith<$Res> {
  _$WAAuthAuthorizeCodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WAAuthAuthorizeCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WAAuthAuthorizeCodeDtoImplCopyWith<$Res>
    implements $WAAuthAuthorizeCodeDtoCopyWith<$Res> {
  factory _$$WAAuthAuthorizeCodeDtoImplCopyWith(
          _$WAAuthAuthorizeCodeDtoImpl value,
          $Res Function(_$WAAuthAuthorizeCodeDtoImpl) then) =
      __$$WAAuthAuthorizeCodeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$WAAuthAuthorizeCodeDtoImplCopyWithImpl<$Res>
    extends _$WAAuthAuthorizeCodeDtoCopyWithImpl<$Res,
        _$WAAuthAuthorizeCodeDtoImpl>
    implements _$$WAAuthAuthorizeCodeDtoImplCopyWith<$Res> {
  __$$WAAuthAuthorizeCodeDtoImplCopyWithImpl(
      _$WAAuthAuthorizeCodeDtoImpl _value,
      $Res Function(_$WAAuthAuthorizeCodeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WAAuthAuthorizeCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$WAAuthAuthorizeCodeDtoImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WAAuthAuthorizeCodeDtoImpl implements _WAAuthAuthorizeCodeDto {
  const _$WAAuthAuthorizeCodeDtoImpl({required this.code});

  factory _$WAAuthAuthorizeCodeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WAAuthAuthorizeCodeDtoImplFromJson(json);

  @override
  final String code;

  @override
  String toString() {
    return 'WAAuthAuthorizeCodeDto(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WAAuthAuthorizeCodeDtoImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of WAAuthAuthorizeCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WAAuthAuthorizeCodeDtoImplCopyWith<_$WAAuthAuthorizeCodeDtoImpl>
      get copyWith => __$$WAAuthAuthorizeCodeDtoImplCopyWithImpl<
          _$WAAuthAuthorizeCodeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WAAuthAuthorizeCodeDtoImplToJson(
      this,
    );
  }
}

abstract class _WAAuthAuthorizeCodeDto implements WAAuthAuthorizeCodeDto {
  const factory _WAAuthAuthorizeCodeDto({required final String code}) =
      _$WAAuthAuthorizeCodeDtoImpl;

  factory _WAAuthAuthorizeCodeDto.fromJson(Map<String, dynamic> json) =
      _$WAAuthAuthorizeCodeDtoImpl.fromJson;

  @override
  String get code;

  /// Create a copy of WAAuthAuthorizeCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WAAuthAuthorizeCodeDtoImplCopyWith<_$WAAuthAuthorizeCodeDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
