// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateTaxDto _$CreateTaxDtoFromJson(Map<String, dynamic> json) {
  return _CreateTaxDto.fromJson(json);
}

/// @nodoc
mixin _$CreateTaxDto {
  String get name => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTaxDtoCopyWith<CreateTaxDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTaxDtoCopyWith<$Res> {
  factory $CreateTaxDtoCopyWith(
          CreateTaxDto value, $Res Function(CreateTaxDto) then) =
      _$CreateTaxDtoCopyWithImpl<$Res, CreateTaxDto>;
  @useResult
  $Res call({String name, double value});
}

/// @nodoc
class _$CreateTaxDtoCopyWithImpl<$Res, $Val extends CreateTaxDto>
    implements $CreateTaxDtoCopyWith<$Res> {
  _$CreateTaxDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTaxDtoImplCopyWith<$Res>
    implements $CreateTaxDtoCopyWith<$Res> {
  factory _$$CreateTaxDtoImplCopyWith(
          _$CreateTaxDtoImpl value, $Res Function(_$CreateTaxDtoImpl) then) =
      __$$CreateTaxDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double value});
}

/// @nodoc
class __$$CreateTaxDtoImplCopyWithImpl<$Res>
    extends _$CreateTaxDtoCopyWithImpl<$Res, _$CreateTaxDtoImpl>
    implements _$$CreateTaxDtoImplCopyWith<$Res> {
  __$$CreateTaxDtoImplCopyWithImpl(
      _$CreateTaxDtoImpl _value, $Res Function(_$CreateTaxDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_$CreateTaxDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTaxDtoImpl implements _CreateTaxDto {
  const _$CreateTaxDtoImpl({required this.name, required this.value});

  factory _$CreateTaxDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTaxDtoImplFromJson(json);

  @override
  final String name;
  @override
  final double value;

  @override
  String toString() {
    return 'CreateTaxDto(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTaxDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTaxDtoImplCopyWith<_$CreateTaxDtoImpl> get copyWith =>
      __$$CreateTaxDtoImplCopyWithImpl<_$CreateTaxDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTaxDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateTaxDto implements CreateTaxDto {
  const factory _CreateTaxDto(
      {required final String name,
      required final double value}) = _$CreateTaxDtoImpl;

  factory _CreateTaxDto.fromJson(Map<String, dynamic> json) =
      _$CreateTaxDtoImpl.fromJson;

  @override
  String get name;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$CreateTaxDtoImplCopyWith<_$CreateTaxDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateTaxDto _$UpdateTaxDtoFromJson(Map<String, dynamic> json) {
  return _UpdateTaxDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateTaxDto {
  String? get name => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTaxDtoCopyWith<UpdateTaxDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTaxDtoCopyWith<$Res> {
  factory $UpdateTaxDtoCopyWith(
          UpdateTaxDto value, $Res Function(UpdateTaxDto) then) =
      _$UpdateTaxDtoCopyWithImpl<$Res, UpdateTaxDto>;
  @useResult
  $Res call({String? name, double? value});
}

/// @nodoc
class _$UpdateTaxDtoCopyWithImpl<$Res, $Val extends UpdateTaxDto>
    implements $UpdateTaxDtoCopyWith<$Res> {
  _$UpdateTaxDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTaxDtoImplCopyWith<$Res>
    implements $UpdateTaxDtoCopyWith<$Res> {
  factory _$$UpdateTaxDtoImplCopyWith(
          _$UpdateTaxDtoImpl value, $Res Function(_$UpdateTaxDtoImpl) then) =
      __$$UpdateTaxDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, double? value});
}

/// @nodoc
class __$$UpdateTaxDtoImplCopyWithImpl<$Res>
    extends _$UpdateTaxDtoCopyWithImpl<$Res, _$UpdateTaxDtoImpl>
    implements _$$UpdateTaxDtoImplCopyWith<$Res> {
  __$$UpdateTaxDtoImplCopyWithImpl(
      _$UpdateTaxDtoImpl _value, $Res Function(_$UpdateTaxDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
  }) {
    return _then(_$UpdateTaxDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateTaxDtoImpl implements _UpdateTaxDto {
  const _$UpdateTaxDtoImpl({this.name, this.value});

  factory _$UpdateTaxDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateTaxDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final double? value;

  @override
  String toString() {
    return 'UpdateTaxDto(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTaxDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTaxDtoImplCopyWith<_$UpdateTaxDtoImpl> get copyWith =>
      __$$UpdateTaxDtoImplCopyWithImpl<_$UpdateTaxDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTaxDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateTaxDto implements UpdateTaxDto {
  const factory _UpdateTaxDto({final String? name, final double? value}) =
      _$UpdateTaxDtoImpl;

  factory _UpdateTaxDto.fromJson(Map<String, dynamic> json) =
      _$UpdateTaxDtoImpl.fromJson;

  @override
  String? get name;
  @override
  double? get value;
  @override
  @JsonKey(ignore: true)
  _$$UpdateTaxDtoImplCopyWith<_$UpdateTaxDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
