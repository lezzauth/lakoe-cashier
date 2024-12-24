// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailPakcageDto _$DetailPakcageDtoFromJson(Map<String, dynamic> json) {
  return _DetailPakcageDto.fromJson(json);
}

/// @nodoc
mixin _$DetailPakcageDto {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this DetailPakcageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailPakcageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailPakcageDtoCopyWith<DetailPakcageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailPakcageDtoCopyWith<$Res> {
  factory $DetailPakcageDtoCopyWith(
          DetailPakcageDto value, $Res Function(DetailPakcageDto) then) =
      _$DetailPakcageDtoCopyWithImpl<$Res, DetailPakcageDto>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$DetailPakcageDtoCopyWithImpl<$Res, $Val extends DetailPakcageDto>
    implements $DetailPakcageDtoCopyWith<$Res> {
  _$DetailPakcageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailPakcageDto
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
abstract class _$$DetailPakcageDtoImplCopyWith<$Res>
    implements $DetailPakcageDtoCopyWith<$Res> {
  factory _$$DetailPakcageDtoImplCopyWith(_$DetailPakcageDtoImpl value,
          $Res Function(_$DetailPakcageDtoImpl) then) =
      __$$DetailPakcageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$DetailPakcageDtoImplCopyWithImpl<$Res>
    extends _$DetailPakcageDtoCopyWithImpl<$Res, _$DetailPakcageDtoImpl>
    implements _$$DetailPakcageDtoImplCopyWith<$Res> {
  __$$DetailPakcageDtoImplCopyWithImpl(_$DetailPakcageDtoImpl _value,
      $Res Function(_$DetailPakcageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailPakcageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$DetailPakcageDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailPakcageDtoImpl implements _DetailPakcageDto {
  const _$DetailPakcageDtoImpl({required this.name});

  factory _$DetailPakcageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailPakcageDtoImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'DetailPakcageDto(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailPakcageDtoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of DetailPakcageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailPakcageDtoImplCopyWith<_$DetailPakcageDtoImpl> get copyWith =>
      __$$DetailPakcageDtoImplCopyWithImpl<_$DetailPakcageDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailPakcageDtoImplToJson(
      this,
    );
  }
}

abstract class _DetailPakcageDto implements DetailPakcageDto {
  const factory _DetailPakcageDto({required final String name}) =
      _$DetailPakcageDtoImpl;

  factory _DetailPakcageDto.fromJson(Map<String, dynamic> json) =
      _$DetailPakcageDtoImpl.fromJson;

  @override
  String get name;

  /// Create a copy of DetailPakcageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailPakcageDtoImplCopyWith<_$DetailPakcageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurchaseDto _$PurchaseDtoFromJson(Map<String, dynamic> json) {
  return _PurchaseDto.fromJson(json);
}

/// @nodoc
mixin _$PurchaseDto {
  int get period => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String? get successReturnUrl => throw _privateConstructorUsedError;
  String? get failedReturnUrl => throw _privateConstructorUsedError;

  /// Serializes this PurchaseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseDtoCopyWith<PurchaseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseDtoCopyWith<$Res> {
  factory $PurchaseDtoCopyWith(
          PurchaseDto value, $Res Function(PurchaseDto) then) =
      _$PurchaseDtoCopyWithImpl<$Res, PurchaseDto>;
  @useResult
  $Res call(
      {int period,
      String paymentMethod,
      String? successReturnUrl,
      String? failedReturnUrl});
}

/// @nodoc
class _$PurchaseDtoCopyWithImpl<$Res, $Val extends PurchaseDto>
    implements $PurchaseDtoCopyWith<$Res> {
  _$PurchaseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? paymentMethod = null,
    Object? successReturnUrl = freezed,
    Object? failedReturnUrl = freezed,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      successReturnUrl: freezed == successReturnUrl
          ? _value.successReturnUrl
          : successReturnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      failedReturnUrl: freezed == failedReturnUrl
          ? _value.failedReturnUrl
          : failedReturnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseDtoImplCopyWith<$Res>
    implements $PurchaseDtoCopyWith<$Res> {
  factory _$$PurchaseDtoImplCopyWith(
          _$PurchaseDtoImpl value, $Res Function(_$PurchaseDtoImpl) then) =
      __$$PurchaseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int period,
      String paymentMethod,
      String? successReturnUrl,
      String? failedReturnUrl});
}

/// @nodoc
class __$$PurchaseDtoImplCopyWithImpl<$Res>
    extends _$PurchaseDtoCopyWithImpl<$Res, _$PurchaseDtoImpl>
    implements _$$PurchaseDtoImplCopyWith<$Res> {
  __$$PurchaseDtoImplCopyWithImpl(
      _$PurchaseDtoImpl _value, $Res Function(_$PurchaseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? paymentMethod = null,
    Object? successReturnUrl = freezed,
    Object? failedReturnUrl = freezed,
  }) {
    return _then(_$PurchaseDtoImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      successReturnUrl: freezed == successReturnUrl
          ? _value.successReturnUrl
          : successReturnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      failedReturnUrl: freezed == failedReturnUrl
          ? _value.failedReturnUrl
          : failedReturnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseDtoImpl implements _PurchaseDto {
  const _$PurchaseDtoImpl(
      {required this.period,
      required this.paymentMethod,
      this.successReturnUrl,
      this.failedReturnUrl});

  factory _$PurchaseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseDtoImplFromJson(json);

  @override
  final int period;
  @override
  final String paymentMethod;
  @override
  final String? successReturnUrl;
  @override
  final String? failedReturnUrl;

  @override
  String toString() {
    return 'PurchaseDto(period: $period, paymentMethod: $paymentMethod, successReturnUrl: $successReturnUrl, failedReturnUrl: $failedReturnUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseDtoImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.successReturnUrl, successReturnUrl) ||
                other.successReturnUrl == successReturnUrl) &&
            (identical(other.failedReturnUrl, failedReturnUrl) ||
                other.failedReturnUrl == failedReturnUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, period, paymentMethod, successReturnUrl, failedReturnUrl);

  /// Create a copy of PurchaseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseDtoImplCopyWith<_$PurchaseDtoImpl> get copyWith =>
      __$$PurchaseDtoImplCopyWithImpl<_$PurchaseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseDtoImplToJson(
      this,
    );
  }
}

abstract class _PurchaseDto implements PurchaseDto {
  const factory _PurchaseDto(
      {required final int period,
      required final String paymentMethod,
      final String? successReturnUrl,
      final String? failedReturnUrl}) = _$PurchaseDtoImpl;

  factory _PurchaseDto.fromJson(Map<String, dynamic> json) =
      _$PurchaseDtoImpl.fromJson;

  @override
  int get period;
  @override
  String get paymentMethod;
  @override
  String? get successReturnUrl;
  @override
  String? get failedReturnUrl;

  /// Create a copy of PurchaseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseDtoImplCopyWith<_$PurchaseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
