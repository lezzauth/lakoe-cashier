// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateChargeDto _$CreateChargeDtoFromJson(Map<String, dynamic> json) {
  return _CreateChargeDto.fromJson(json);
}

/// @nodoc
mixin _$CreateChargeDto {
  String get name => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  bool get isPrecentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateChargeDtoCopyWith<CreateChargeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateChargeDtoCopyWith<$Res> {
  factory $CreateChargeDtoCopyWith(
          CreateChargeDto value, $Res Function(CreateChargeDto) then) =
      _$CreateChargeDtoCopyWithImpl<$Res, CreateChargeDto>;
  @useResult
  $Res call({String name, int value, bool isPrecentage});
}

/// @nodoc
class _$CreateChargeDtoCopyWithImpl<$Res, $Val extends CreateChargeDto>
    implements $CreateChargeDtoCopyWith<$Res> {
  _$CreateChargeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
    Object? isPrecentage = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      isPrecentage: null == isPrecentage
          ? _value.isPrecentage
          : isPrecentage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateChargeDtoImplCopyWith<$Res>
    implements $CreateChargeDtoCopyWith<$Res> {
  factory _$$CreateChargeDtoImplCopyWith(_$CreateChargeDtoImpl value,
          $Res Function(_$CreateChargeDtoImpl) then) =
      __$$CreateChargeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int value, bool isPrecentage});
}

/// @nodoc
class __$$CreateChargeDtoImplCopyWithImpl<$Res>
    extends _$CreateChargeDtoCopyWithImpl<$Res, _$CreateChargeDtoImpl>
    implements _$$CreateChargeDtoImplCopyWith<$Res> {
  __$$CreateChargeDtoImplCopyWithImpl(
      _$CreateChargeDtoImpl _value, $Res Function(_$CreateChargeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
    Object? isPrecentage = null,
  }) {
    return _then(_$CreateChargeDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      isPrecentage: null == isPrecentage
          ? _value.isPrecentage
          : isPrecentage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateChargeDtoImpl implements _CreateChargeDto {
  const _$CreateChargeDtoImpl(
      {required this.name, required this.value, required this.isPrecentage});

  factory _$CreateChargeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateChargeDtoImplFromJson(json);

  @override
  final String name;
  @override
  final int value;
  @override
  final bool isPrecentage;

  @override
  String toString() {
    return 'CreateChargeDto(name: $name, value: $value, isPrecentage: $isPrecentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateChargeDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isPrecentage, isPrecentage) ||
                other.isPrecentage == isPrecentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value, isPrecentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateChargeDtoImplCopyWith<_$CreateChargeDtoImpl> get copyWith =>
      __$$CreateChargeDtoImplCopyWithImpl<_$CreateChargeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateChargeDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateChargeDto implements CreateChargeDto {
  const factory _CreateChargeDto(
      {required final String name,
      required final int value,
      required final bool isPrecentage}) = _$CreateChargeDtoImpl;

  factory _CreateChargeDto.fromJson(Map<String, dynamic> json) =
      _$CreateChargeDtoImpl.fromJson;

  @override
  String get name;
  @override
  int get value;
  @override
  bool get isPrecentage;
  @override
  @JsonKey(ignore: true)
  _$$CreateChargeDtoImplCopyWith<_$CreateChargeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateChargeDto _$UpdateChargeDtoFromJson(Map<String, dynamic> json) {
  return _UpdateChargeDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateChargeDto {
  String? get name => throw _privateConstructorUsedError;
  int? get value => throw _privateConstructorUsedError;
  bool? get isPrecentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateChargeDtoCopyWith<UpdateChargeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateChargeDtoCopyWith<$Res> {
  factory $UpdateChargeDtoCopyWith(
          UpdateChargeDto value, $Res Function(UpdateChargeDto) then) =
      _$UpdateChargeDtoCopyWithImpl<$Res, UpdateChargeDto>;
  @useResult
  $Res call({String? name, int? value, bool? isPrecentage});
}

/// @nodoc
class _$UpdateChargeDtoCopyWithImpl<$Res, $Val extends UpdateChargeDto>
    implements $UpdateChargeDtoCopyWith<$Res> {
  _$UpdateChargeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? isPrecentage = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrecentage: freezed == isPrecentage
          ? _value.isPrecentage
          : isPrecentage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateChargeDtoImplCopyWith<$Res>
    implements $UpdateChargeDtoCopyWith<$Res> {
  factory _$$UpdateChargeDtoImplCopyWith(_$UpdateChargeDtoImpl value,
          $Res Function(_$UpdateChargeDtoImpl) then) =
      __$$UpdateChargeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int? value, bool? isPrecentage});
}

/// @nodoc
class __$$UpdateChargeDtoImplCopyWithImpl<$Res>
    extends _$UpdateChargeDtoCopyWithImpl<$Res, _$UpdateChargeDtoImpl>
    implements _$$UpdateChargeDtoImplCopyWith<$Res> {
  __$$UpdateChargeDtoImplCopyWithImpl(
      _$UpdateChargeDtoImpl _value, $Res Function(_$UpdateChargeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? isPrecentage = freezed,
  }) {
    return _then(_$UpdateChargeDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrecentage: freezed == isPrecentage
          ? _value.isPrecentage
          : isPrecentage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateChargeDtoImpl implements _UpdateChargeDto {
  const _$UpdateChargeDtoImpl({this.name, this.value, this.isPrecentage});

  factory _$UpdateChargeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateChargeDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final int? value;
  @override
  final bool? isPrecentage;

  @override
  String toString() {
    return 'UpdateChargeDto(name: $name, value: $value, isPrecentage: $isPrecentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateChargeDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isPrecentage, isPrecentage) ||
                other.isPrecentage == isPrecentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value, isPrecentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateChargeDtoImplCopyWith<_$UpdateChargeDtoImpl> get copyWith =>
      __$$UpdateChargeDtoImplCopyWithImpl<_$UpdateChargeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateChargeDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateChargeDto implements UpdateChargeDto {
  const factory _UpdateChargeDto(
      {final String? name,
      final int? value,
      final bool? isPrecentage}) = _$UpdateChargeDtoImpl;

  factory _UpdateChargeDto.fromJson(Map<String, dynamic> json) =
      _$UpdateChargeDtoImpl.fromJson;

  @override
  String? get name;
  @override
  int? get value;
  @override
  bool? get isPrecentage;
  @override
  @JsonKey(ignore: true)
  _$$UpdateChargeDtoImplCopyWith<_$UpdateChargeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
