// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindAllTableLocationDto _$FindAllTableLocationDtoFromJson(
    Map<String, dynamic> json) {
  return _FindAllTableLocationDto.fromJson(json);
}

/// @nodoc
mixin _$FindAllTableLocationDto {
  /// Serializes this FindAllTableLocationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllTableLocationDtoCopyWith<$Res> {
  factory $FindAllTableLocationDtoCopyWith(FindAllTableLocationDto value,
          $Res Function(FindAllTableLocationDto) then) =
      _$FindAllTableLocationDtoCopyWithImpl<$Res, FindAllTableLocationDto>;
}

/// @nodoc
class _$FindAllTableLocationDtoCopyWithImpl<$Res,
        $Val extends FindAllTableLocationDto>
    implements $FindAllTableLocationDtoCopyWith<$Res> {
  _$FindAllTableLocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindAllTableLocationDto
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FindAllTableLocationDtoImplCopyWith<$Res> {
  factory _$$FindAllTableLocationDtoImplCopyWith(
          _$FindAllTableLocationDtoImpl value,
          $Res Function(_$FindAllTableLocationDtoImpl) then) =
      __$$FindAllTableLocationDtoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FindAllTableLocationDtoImplCopyWithImpl<$Res>
    extends _$FindAllTableLocationDtoCopyWithImpl<$Res,
        _$FindAllTableLocationDtoImpl>
    implements _$$FindAllTableLocationDtoImplCopyWith<$Res> {
  __$$FindAllTableLocationDtoImplCopyWithImpl(
      _$FindAllTableLocationDtoImpl _value,
      $Res Function(_$FindAllTableLocationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindAllTableLocationDto
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$FindAllTableLocationDtoImpl implements _FindAllTableLocationDto {
  const _$FindAllTableLocationDtoImpl();

  factory _$FindAllTableLocationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindAllTableLocationDtoImplFromJson(json);

  @override
  String toString() {
    return 'FindAllTableLocationDto()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllTableLocationDtoImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$FindAllTableLocationDtoImplToJson(
      this,
    );
  }
}

abstract class _FindAllTableLocationDto implements FindAllTableLocationDto {
  const factory _FindAllTableLocationDto() = _$FindAllTableLocationDtoImpl;

  factory _FindAllTableLocationDto.fromJson(Map<String, dynamic> json) =
      _$FindAllTableLocationDtoImpl.fromJson;
}

CreateTableLocationDto _$CreateTableLocationDtoFromJson(
    Map<String, dynamic> json) {
  return _CreateTableLocationDto.fromJson(json);
}

/// @nodoc
mixin _$CreateTableLocationDto {
  String get name => throw _privateConstructorUsedError;
  String? get outletId => throw _privateConstructorUsedError;

  /// Serializes this CreateTableLocationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTableLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTableLocationDtoCopyWith<CreateTableLocationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTableLocationDtoCopyWith<$Res> {
  factory $CreateTableLocationDtoCopyWith(CreateTableLocationDto value,
          $Res Function(CreateTableLocationDto) then) =
      _$CreateTableLocationDtoCopyWithImpl<$Res, CreateTableLocationDto>;
  @useResult
  $Res call({String name, String? outletId});
}

/// @nodoc
class _$CreateTableLocationDtoCopyWithImpl<$Res,
        $Val extends CreateTableLocationDto>
    implements $CreateTableLocationDtoCopyWith<$Res> {
  _$CreateTableLocationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTableLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? outletId = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTableLocationDtoImplCopyWith<$Res>
    implements $CreateTableLocationDtoCopyWith<$Res> {
  factory _$$CreateTableLocationDtoImplCopyWith(
          _$CreateTableLocationDtoImpl value,
          $Res Function(_$CreateTableLocationDtoImpl) then) =
      __$$CreateTableLocationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? outletId});
}

/// @nodoc
class __$$CreateTableLocationDtoImplCopyWithImpl<$Res>
    extends _$CreateTableLocationDtoCopyWithImpl<$Res,
        _$CreateTableLocationDtoImpl>
    implements _$$CreateTableLocationDtoImplCopyWith<$Res> {
  __$$CreateTableLocationDtoImplCopyWithImpl(
      _$CreateTableLocationDtoImpl _value,
      $Res Function(_$CreateTableLocationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTableLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? outletId = freezed,
  }) {
    return _then(_$CreateTableLocationDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTableLocationDtoImpl implements _CreateTableLocationDto {
  const _$CreateTableLocationDtoImpl({required this.name, this.outletId});

  factory _$CreateTableLocationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTableLocationDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String? outletId;

  @override
  String toString() {
    return 'CreateTableLocationDto(name: $name, outletId: $outletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTableLocationDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, outletId);

  /// Create a copy of CreateTableLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTableLocationDtoImplCopyWith<_$CreateTableLocationDtoImpl>
      get copyWith => __$$CreateTableLocationDtoImplCopyWithImpl<
          _$CreateTableLocationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTableLocationDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateTableLocationDto implements CreateTableLocationDto {
  const factory _CreateTableLocationDto(
      {required final String name,
      final String? outletId}) = _$CreateTableLocationDtoImpl;

  factory _CreateTableLocationDto.fromJson(Map<String, dynamic> json) =
      _$CreateTableLocationDtoImpl.fromJson;

  @override
  String get name;
  @override
  String? get outletId;

  /// Create a copy of CreateTableLocationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTableLocationDtoImplCopyWith<_$CreateTableLocationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
