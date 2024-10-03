// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindAllCategoryDto _$FindAllCategoryDtoFromJson(Map<String, dynamic> json) {
  return _FindAllCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$FindAllCategoryDto {
  String? get outletId => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;

  /// Serializes this FindAllCategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindAllCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindAllCategoryDtoCopyWith<FindAllCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllCategoryDtoCopyWith<$Res> {
  factory $FindAllCategoryDtoCopyWith(
          FindAllCategoryDto value, $Res Function(FindAllCategoryDto) then) =
      _$FindAllCategoryDtoCopyWithImpl<$Res, FindAllCategoryDto>;
  @useResult
  $Res call({String? outletId, String? search});
}

/// @nodoc
class _$FindAllCategoryDtoCopyWithImpl<$Res, $Val extends FindAllCategoryDto>
    implements $FindAllCategoryDtoCopyWith<$Res> {
  _$FindAllCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindAllCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = freezed,
    Object? search = freezed,
  }) {
    return _then(_value.copyWith(
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindAllCategoryDtoImplCopyWith<$Res>
    implements $FindAllCategoryDtoCopyWith<$Res> {
  factory _$$FindAllCategoryDtoImplCopyWith(_$FindAllCategoryDtoImpl value,
          $Res Function(_$FindAllCategoryDtoImpl) then) =
      __$$FindAllCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? outletId, String? search});
}

/// @nodoc
class __$$FindAllCategoryDtoImplCopyWithImpl<$Res>
    extends _$FindAllCategoryDtoCopyWithImpl<$Res, _$FindAllCategoryDtoImpl>
    implements _$$FindAllCategoryDtoImplCopyWith<$Res> {
  __$$FindAllCategoryDtoImplCopyWithImpl(_$FindAllCategoryDtoImpl _value,
      $Res Function(_$FindAllCategoryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindAllCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = freezed,
    Object? search = freezed,
  }) {
    return _then(_$FindAllCategoryDtoImpl(
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
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
class _$FindAllCategoryDtoImpl implements _FindAllCategoryDto {
  const _$FindAllCategoryDtoImpl({this.outletId, this.search});

  factory _$FindAllCategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindAllCategoryDtoImplFromJson(json);

  @override
  final String? outletId;
  @override
  final String? search;

  @override
  String toString() {
    return 'FindAllCategoryDto(outletId: $outletId, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllCategoryDtoImpl &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.search, search) || other.search == search));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outletId, search);

  /// Create a copy of FindAllCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllCategoryDtoImplCopyWith<_$FindAllCategoryDtoImpl> get copyWith =>
      __$$FindAllCategoryDtoImplCopyWithImpl<_$FindAllCategoryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindAllCategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _FindAllCategoryDto implements FindAllCategoryDto {
  const factory _FindAllCategoryDto(
      {final String? outletId,
      final String? search}) = _$FindAllCategoryDtoImpl;

  factory _FindAllCategoryDto.fromJson(Map<String, dynamic> json) =
      _$FindAllCategoryDtoImpl.fromJson;

  @override
  String? get outletId;
  @override
  String? get search;

  /// Create a copy of FindAllCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindAllCategoryDtoImplCopyWith<_$FindAllCategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateCategoryDto _$CreateCategoryDtoFromJson(Map<String, dynamic> json) {
  return _CreateCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$CreateCategoryDto {
  String? get outletId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  /// Serializes this CreateCategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateCategoryDtoCopyWith<CreateCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCategoryDtoCopyWith<$Res> {
  factory $CreateCategoryDtoCopyWith(
          CreateCategoryDto value, $Res Function(CreateCategoryDto) then) =
      _$CreateCategoryDtoCopyWithImpl<$Res, CreateCategoryDto>;
  @useResult
  $Res call({String? outletId, String name, String? icon});
}

/// @nodoc
class _$CreateCategoryDtoCopyWithImpl<$Res, $Val extends CreateCategoryDto>
    implements $CreateCategoryDtoCopyWith<$Res> {
  _$CreateCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = freezed,
    Object? name = null,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateCategoryDtoImplCopyWith<$Res>
    implements $CreateCategoryDtoCopyWith<$Res> {
  factory _$$CreateCategoryDtoImplCopyWith(_$CreateCategoryDtoImpl value,
          $Res Function(_$CreateCategoryDtoImpl) then) =
      __$$CreateCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? outletId, String name, String? icon});
}

/// @nodoc
class __$$CreateCategoryDtoImplCopyWithImpl<$Res>
    extends _$CreateCategoryDtoCopyWithImpl<$Res, _$CreateCategoryDtoImpl>
    implements _$$CreateCategoryDtoImplCopyWith<$Res> {
  __$$CreateCategoryDtoImplCopyWithImpl(_$CreateCategoryDtoImpl _value,
      $Res Function(_$CreateCategoryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = freezed,
    Object? name = null,
    Object? icon = freezed,
  }) {
    return _then(_$CreateCategoryDtoImpl(
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCategoryDtoImpl implements _CreateCategoryDto {
  const _$CreateCategoryDtoImpl({this.outletId, required this.name, this.icon});

  factory _$CreateCategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateCategoryDtoImplFromJson(json);

  @override
  final String? outletId;
  @override
  final String name;
  @override
  final String? icon;

  @override
  String toString() {
    return 'CreateCategoryDto(outletId: $outletId, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCategoryDtoImpl &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, outletId, name, icon);

  /// Create a copy of CreateCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCategoryDtoImplCopyWith<_$CreateCategoryDtoImpl> get copyWith =>
      __$$CreateCategoryDtoImplCopyWithImpl<_$CreateCategoryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateCategoryDto implements CreateCategoryDto {
  const factory _CreateCategoryDto(
      {final String? outletId,
      required final String name,
      final String? icon}) = _$CreateCategoryDtoImpl;

  factory _CreateCategoryDto.fromJson(Map<String, dynamic> json) =
      _$CreateCategoryDtoImpl.fromJson;

  @override
  String? get outletId;
  @override
  String get name;
  @override
  String? get icon;

  /// Create a copy of CreateCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCategoryDtoImplCopyWith<_$CreateCategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateCategoryDto _$UpdateCategoryDtoFromJson(Map<String, dynamic> json) {
  return _UpdateCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateCategoryDto {
  String? get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  /// Serializes this UpdateCategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateCategoryDtoCopyWith<UpdateCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCategoryDtoCopyWith<$Res> {
  factory $UpdateCategoryDtoCopyWith(
          UpdateCategoryDto value, $Res Function(UpdateCategoryDto) then) =
      _$UpdateCategoryDtoCopyWithImpl<$Res, UpdateCategoryDto>;
  @useResult
  $Res call({String? name, String? icon});
}

/// @nodoc
class _$UpdateCategoryDtoCopyWithImpl<$Res, $Val extends UpdateCategoryDto>
    implements $UpdateCategoryDtoCopyWith<$Res> {
  _$UpdateCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateCategoryDtoImplCopyWith<$Res>
    implements $UpdateCategoryDtoCopyWith<$Res> {
  factory _$$UpdateCategoryDtoImplCopyWith(_$UpdateCategoryDtoImpl value,
          $Res Function(_$UpdateCategoryDtoImpl) then) =
      __$$UpdateCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? icon});
}

/// @nodoc
class __$$UpdateCategoryDtoImplCopyWithImpl<$Res>
    extends _$UpdateCategoryDtoCopyWithImpl<$Res, _$UpdateCategoryDtoImpl>
    implements _$$UpdateCategoryDtoImplCopyWith<$Res> {
  __$$UpdateCategoryDtoImplCopyWithImpl(_$UpdateCategoryDtoImpl _value,
      $Res Function(_$UpdateCategoryDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$UpdateCategoryDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateCategoryDtoImpl implements _UpdateCategoryDto {
  const _$UpdateCategoryDtoImpl({this.name, this.icon});

  factory _$UpdateCategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateCategoryDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final String? icon;

  @override
  String toString() {
    return 'UpdateCategoryDto(name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCategoryDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, icon);

  /// Create a copy of UpdateCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCategoryDtoImplCopyWith<_$UpdateCategoryDtoImpl> get copyWith =>
      __$$UpdateCategoryDtoImplCopyWithImpl<_$UpdateCategoryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateCategoryDto implements UpdateCategoryDto {
  const factory _UpdateCategoryDto({final String? name, final String? icon}) =
      _$UpdateCategoryDtoImpl;

  factory _UpdateCategoryDto.fromJson(Map<String, dynamic> json) =
      _$UpdateCategoryDtoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get icon;

  /// Create a copy of UpdateCategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateCategoryDtoImplCopyWith<_$UpdateCategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
