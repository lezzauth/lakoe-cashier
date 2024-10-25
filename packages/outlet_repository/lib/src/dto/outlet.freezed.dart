// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailCustomerOutletDto _$DetailCustomerOutletDtoFromJson(
    Map<String, dynamic> json) {
  return _DetailCustomerOutletDto.fromJson(json);
}

/// @nodoc
mixin _$DetailCustomerOutletDto {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get template => throw _privateConstructorUsedError;

  /// Serializes this DetailCustomerOutletDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailCustomerOutletDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailCustomerOutletDtoCopyWith<DetailCustomerOutletDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCustomerOutletDtoCopyWith<$Res> {
  factory $DetailCustomerOutletDtoCopyWith(DetailCustomerOutletDto value,
          $Res Function(DetailCustomerOutletDto) then) =
      _$DetailCustomerOutletDtoCopyWithImpl<$Res, DetailCustomerOutletDto>;
  @useResult
  $Res call({String? from, String? to, String? template});
}

/// @nodoc
class _$DetailCustomerOutletDtoCopyWithImpl<$Res,
        $Val extends DetailCustomerOutletDto>
    implements $DetailCustomerOutletDtoCopyWith<$Res> {
  _$DetailCustomerOutletDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailCustomerOutletDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? template = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailCustomerOutletDtoImplCopyWith<$Res>
    implements $DetailCustomerOutletDtoCopyWith<$Res> {
  factory _$$DetailCustomerOutletDtoImplCopyWith(
          _$DetailCustomerOutletDtoImpl value,
          $Res Function(_$DetailCustomerOutletDtoImpl) then) =
      __$$DetailCustomerOutletDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? from, String? to, String? template});
}

/// @nodoc
class __$$DetailCustomerOutletDtoImplCopyWithImpl<$Res>
    extends _$DetailCustomerOutletDtoCopyWithImpl<$Res,
        _$DetailCustomerOutletDtoImpl>
    implements _$$DetailCustomerOutletDtoImplCopyWith<$Res> {
  __$$DetailCustomerOutletDtoImplCopyWithImpl(
      _$DetailCustomerOutletDtoImpl _value,
      $Res Function(_$DetailCustomerOutletDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailCustomerOutletDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? template = freezed,
  }) {
    return _then(_$DetailCustomerOutletDtoImpl(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCustomerOutletDtoImpl implements _DetailCustomerOutletDto {
  const _$DetailCustomerOutletDtoImpl({this.from, this.to, this.template});

  factory _$DetailCustomerOutletDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCustomerOutletDtoImplFromJson(json);

  @override
  final String? from;
  @override
  final String? to;
  @override
  final String? template;

  @override
  String toString() {
    return 'DetailCustomerOutletDto(from: $from, to: $to, template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCustomerOutletDtoImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, template);

  /// Create a copy of DetailCustomerOutletDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCustomerOutletDtoImplCopyWith<_$DetailCustomerOutletDtoImpl>
      get copyWith => __$$DetailCustomerOutletDtoImplCopyWithImpl<
          _$DetailCustomerOutletDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCustomerOutletDtoImplToJson(
      this,
    );
  }
}

abstract class _DetailCustomerOutletDto implements DetailCustomerOutletDto {
  const factory _DetailCustomerOutletDto(
      {final String? from,
      final String? to,
      final String? template}) = _$DetailCustomerOutletDtoImpl;

  factory _DetailCustomerOutletDto.fromJson(Map<String, dynamic> json) =
      _$DetailCustomerOutletDtoImpl.fromJson;

  @override
  String? get from;
  @override
  String? get to;
  @override
  String? get template;

  /// Create a copy of DetailCustomerOutletDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailCustomerOutletDtoImplCopyWith<_$DetailCustomerOutletDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetOutletReportDto _$GetOutletReportDtoFromJson(Map<String, dynamic> json) {
  return _GetOutletReportDto.fromJson(json);
}

/// @nodoc
mixin _$GetOutletReportDto {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get template => throw _privateConstructorUsedError;

  /// Serializes this GetOutletReportDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetOutletReportDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetOutletReportDtoCopyWith<GetOutletReportDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOutletReportDtoCopyWith<$Res> {
  factory $GetOutletReportDtoCopyWith(
          GetOutletReportDto value, $Res Function(GetOutletReportDto) then) =
      _$GetOutletReportDtoCopyWithImpl<$Res, GetOutletReportDto>;
  @useResult
  $Res call({String? from, String? to, String? template});
}

/// @nodoc
class _$GetOutletReportDtoCopyWithImpl<$Res, $Val extends GetOutletReportDto>
    implements $GetOutletReportDtoCopyWith<$Res> {
  _$GetOutletReportDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetOutletReportDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? template = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetOutletReportDtoImplCopyWith<$Res>
    implements $GetOutletReportDtoCopyWith<$Res> {
  factory _$$GetOutletReportDtoImplCopyWith(_$GetOutletReportDtoImpl value,
          $Res Function(_$GetOutletReportDtoImpl) then) =
      __$$GetOutletReportDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? from, String? to, String? template});
}

/// @nodoc
class __$$GetOutletReportDtoImplCopyWithImpl<$Res>
    extends _$GetOutletReportDtoCopyWithImpl<$Res, _$GetOutletReportDtoImpl>
    implements _$$GetOutletReportDtoImplCopyWith<$Res> {
  __$$GetOutletReportDtoImplCopyWithImpl(_$GetOutletReportDtoImpl _value,
      $Res Function(_$GetOutletReportDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetOutletReportDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? template = freezed,
  }) {
    return _then(_$GetOutletReportDtoImpl(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetOutletReportDtoImpl implements _GetOutletReportDto {
  const _$GetOutletReportDtoImpl({this.from, this.to, this.template = "TODAY"});

  factory _$GetOutletReportDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetOutletReportDtoImplFromJson(json);

  @override
  final String? from;
  @override
  final String? to;
  @override
  @JsonKey()
  final String? template;

  @override
  String toString() {
    return 'GetOutletReportDto(from: $from, to: $to, template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOutletReportDtoImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, template);

  /// Create a copy of GetOutletReportDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOutletReportDtoImplCopyWith<_$GetOutletReportDtoImpl> get copyWith =>
      __$$GetOutletReportDtoImplCopyWithImpl<_$GetOutletReportDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetOutletReportDtoImplToJson(
      this,
    );
  }
}

abstract class _GetOutletReportDto implements GetOutletReportDto {
  const factory _GetOutletReportDto(
      {final String? from,
      final String? to,
      final String? template}) = _$GetOutletReportDtoImpl;

  factory _GetOutletReportDto.fromJson(Map<String, dynamic> json) =
      _$GetOutletReportDtoImpl.fromJson;

  @override
  String? get from;
  @override
  String? get to;
  @override
  String? get template;

  /// Create a copy of GetOutletReportDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetOutletReportDtoImplCopyWith<_$GetOutletReportDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetOutletSalesDto _$GetOutletSalesDtoFromJson(Map<String, dynamic> json) {
  return _GetOutletSalesDto.fromJson(json);
}

/// @nodoc
mixin _$GetOutletSalesDto {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get template => throw _privateConstructorUsedError;

  /// Serializes this GetOutletSalesDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetOutletSalesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetOutletSalesDtoCopyWith<GetOutletSalesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOutletSalesDtoCopyWith<$Res> {
  factory $GetOutletSalesDtoCopyWith(
          GetOutletSalesDto value, $Res Function(GetOutletSalesDto) then) =
      _$GetOutletSalesDtoCopyWithImpl<$Res, GetOutletSalesDto>;
  @useResult
  $Res call({String? from, String? to, String? template});
}

/// @nodoc
class _$GetOutletSalesDtoCopyWithImpl<$Res, $Val extends GetOutletSalesDto>
    implements $GetOutletSalesDtoCopyWith<$Res> {
  _$GetOutletSalesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetOutletSalesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? template = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetOutletSalesDtoImplCopyWith<$Res>
    implements $GetOutletSalesDtoCopyWith<$Res> {
  factory _$$GetOutletSalesDtoImplCopyWith(_$GetOutletSalesDtoImpl value,
          $Res Function(_$GetOutletSalesDtoImpl) then) =
      __$$GetOutletSalesDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? from, String? to, String? template});
}

/// @nodoc
class __$$GetOutletSalesDtoImplCopyWithImpl<$Res>
    extends _$GetOutletSalesDtoCopyWithImpl<$Res, _$GetOutletSalesDtoImpl>
    implements _$$GetOutletSalesDtoImplCopyWith<$Res> {
  __$$GetOutletSalesDtoImplCopyWithImpl(_$GetOutletSalesDtoImpl _value,
      $Res Function(_$GetOutletSalesDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetOutletSalesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? template = freezed,
  }) {
    return _then(_$GetOutletSalesDtoImpl(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetOutletSalesDtoImpl implements _GetOutletSalesDto {
  const _$GetOutletSalesDtoImpl({this.from, this.to, this.template = "TODAY"});

  factory _$GetOutletSalesDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetOutletSalesDtoImplFromJson(json);

  @override
  final String? from;
  @override
  final String? to;
  @override
  @JsonKey()
  final String? template;

  @override
  String toString() {
    return 'GetOutletSalesDto(from: $from, to: $to, template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOutletSalesDtoImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, template);

  /// Create a copy of GetOutletSalesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOutletSalesDtoImplCopyWith<_$GetOutletSalesDtoImpl> get copyWith =>
      __$$GetOutletSalesDtoImplCopyWithImpl<_$GetOutletSalesDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetOutletSalesDtoImplToJson(
      this,
    );
  }
}

abstract class _GetOutletSalesDto implements GetOutletSalesDto {
  const factory _GetOutletSalesDto(
      {final String? from,
      final String? to,
      final String? template}) = _$GetOutletSalesDtoImpl;

  factory _GetOutletSalesDto.fromJson(Map<String, dynamic> json) =
      _$GetOutletSalesDtoImpl.fromJson;

  @override
  String? get from;
  @override
  String? get to;
  @override
  String? get template;

  /// Create a copy of GetOutletSalesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetOutletSalesDtoImplCopyWith<_$GetOutletSalesDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateOutletDto _$UpdateOutletDtoFromJson(Map<String, dynamic> json) {
  return _UpdateOutletDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateOutletDto {
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this UpdateOutletDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateOutletDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateOutletDtoCopyWith<UpdateOutletDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateOutletDtoCopyWith<$Res> {
  factory $UpdateOutletDtoCopyWith(
          UpdateOutletDto value, $Res Function(UpdateOutletDto) then) =
      _$UpdateOutletDtoCopyWithImpl<$Res, UpdateOutletDto>;
  @useResult
  $Res call({String? color});
}

/// @nodoc
class _$UpdateOutletDtoCopyWithImpl<$Res, $Val extends UpdateOutletDto>
    implements $UpdateOutletDtoCopyWith<$Res> {
  _$UpdateOutletDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateOutletDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateOutletDtoImplCopyWith<$Res>
    implements $UpdateOutletDtoCopyWith<$Res> {
  factory _$$UpdateOutletDtoImplCopyWith(_$UpdateOutletDtoImpl value,
          $Res Function(_$UpdateOutletDtoImpl) then) =
      __$$UpdateOutletDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? color});
}

/// @nodoc
class __$$UpdateOutletDtoImplCopyWithImpl<$Res>
    extends _$UpdateOutletDtoCopyWithImpl<$Res, _$UpdateOutletDtoImpl>
    implements _$$UpdateOutletDtoImplCopyWith<$Res> {
  __$$UpdateOutletDtoImplCopyWithImpl(
      _$UpdateOutletDtoImpl _value, $Res Function(_$UpdateOutletDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateOutletDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
  }) {
    return _then(_$UpdateOutletDtoImpl(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateOutletDtoImpl implements _UpdateOutletDto {
  const _$UpdateOutletDtoImpl({this.color});

  factory _$UpdateOutletDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateOutletDtoImplFromJson(json);

  @override
  final String? color;

  @override
  String toString() {
    return 'UpdateOutletDto(color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateOutletDtoImpl &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, color);

  /// Create a copy of UpdateOutletDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateOutletDtoImplCopyWith<_$UpdateOutletDtoImpl> get copyWith =>
      __$$UpdateOutletDtoImplCopyWithImpl<_$UpdateOutletDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateOutletDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateOutletDto implements UpdateOutletDto {
  const factory _UpdateOutletDto({final String? color}) = _$UpdateOutletDtoImpl;

  factory _UpdateOutletDto.fromJson(Map<String, dynamic> json) =
      _$UpdateOutletDtoImpl.fromJson;

  @override
  String? get color;

  /// Create a copy of UpdateOutletDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateOutletDtoImplCopyWith<_$UpdateOutletDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
