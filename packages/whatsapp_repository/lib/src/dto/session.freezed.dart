// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateWASessionDto _$CreateWASessionDtoFromJson(Map<String, dynamic> json) {
  return _CreateWASessionDto.fromJson(json);
}

/// @nodoc
mixin _$CreateWASessionDto {
  String? get name => throw _privateConstructorUsedError;
  bool? get start => throw _privateConstructorUsedError;
  WASessionConfig get config => throw _privateConstructorUsedError;

  /// Serializes this CreateWASessionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateWASessionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateWASessionDtoCopyWith<CreateWASessionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWASessionDtoCopyWith<$Res> {
  factory $CreateWASessionDtoCopyWith(
          CreateWASessionDto value, $Res Function(CreateWASessionDto) then) =
      _$CreateWASessionDtoCopyWithImpl<$Res, CreateWASessionDto>;
  @useResult
  $Res call({String? name, bool? start, WASessionConfig config});

  $WASessionConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$CreateWASessionDtoCopyWithImpl<$Res, $Val extends CreateWASessionDto>
    implements $CreateWASessionDtoCopyWith<$Res> {
  _$CreateWASessionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateWASessionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? start = freezed,
    Object? config = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as bool?,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as WASessionConfig,
    ) as $Val);
  }

  /// Create a copy of CreateWASessionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WASessionConfigCopyWith<$Res> get config {
    return $WASessionConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateWASessionDtoImplCopyWith<$Res>
    implements $CreateWASessionDtoCopyWith<$Res> {
  factory _$$CreateWASessionDtoImplCopyWith(_$CreateWASessionDtoImpl value,
          $Res Function(_$CreateWASessionDtoImpl) then) =
      __$$CreateWASessionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, bool? start, WASessionConfig config});

  @override
  $WASessionConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$CreateWASessionDtoImplCopyWithImpl<$Res>
    extends _$CreateWASessionDtoCopyWithImpl<$Res, _$CreateWASessionDtoImpl>
    implements _$$CreateWASessionDtoImplCopyWith<$Res> {
  __$$CreateWASessionDtoImplCopyWithImpl(_$CreateWASessionDtoImpl _value,
      $Res Function(_$CreateWASessionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateWASessionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? start = freezed,
    Object? config = null,
  }) {
    return _then(_$CreateWASessionDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as bool?,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as WASessionConfig,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateWASessionDtoImpl implements _CreateWASessionDto {
  const _$CreateWASessionDtoImpl({this.name, this.start, required this.config});

  factory _$CreateWASessionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateWASessionDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final bool? start;
  @override
  final WASessionConfig config;

  @override
  String toString() {
    return 'CreateWASessionDto(name: $name, start: $start, config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWASessionDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.config, config) || other.config == config));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, start, config);

  /// Create a copy of CreateWASessionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWASessionDtoImplCopyWith<_$CreateWASessionDtoImpl> get copyWith =>
      __$$CreateWASessionDtoImplCopyWithImpl<_$CreateWASessionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateWASessionDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateWASessionDto implements CreateWASessionDto {
  const factory _CreateWASessionDto(
      {final String? name,
      final bool? start,
      required final WASessionConfig config}) = _$CreateWASessionDtoImpl;

  factory _CreateWASessionDto.fromJson(Map<String, dynamic> json) =
      _$CreateWASessionDtoImpl.fromJson;

  @override
  String? get name;
  @override
  bool? get start;
  @override
  WASessionConfig get config;

  /// Create a copy of CreateWASessionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateWASessionDtoImplCopyWith<_$CreateWASessionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
