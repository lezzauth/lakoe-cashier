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
