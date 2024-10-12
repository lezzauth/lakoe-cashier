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

WAAuthGetQRModel _$WAAuthGetQRModelFromJson(Map<String, dynamic> json) {
  return _WAAuthGetQRModel.fromJson(json);
}

/// @nodoc
mixin _$WAAuthGetQRModel {
  String get value => throw _privateConstructorUsedError;

  /// Serializes this WAAuthGetQRModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WAAuthGetQRModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WAAuthGetQRModelCopyWith<WAAuthGetQRModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WAAuthGetQRModelCopyWith<$Res> {
  factory $WAAuthGetQRModelCopyWith(
          WAAuthGetQRModel value, $Res Function(WAAuthGetQRModel) then) =
      _$WAAuthGetQRModelCopyWithImpl<$Res, WAAuthGetQRModel>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$WAAuthGetQRModelCopyWithImpl<$Res, $Val extends WAAuthGetQRModel>
    implements $WAAuthGetQRModelCopyWith<$Res> {
  _$WAAuthGetQRModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WAAuthGetQRModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WAAuthGetQRModelImplCopyWith<$Res>
    implements $WAAuthGetQRModelCopyWith<$Res> {
  factory _$$WAAuthGetQRModelImplCopyWith(_$WAAuthGetQRModelImpl value,
          $Res Function(_$WAAuthGetQRModelImpl) then) =
      __$$WAAuthGetQRModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$WAAuthGetQRModelImplCopyWithImpl<$Res>
    extends _$WAAuthGetQRModelCopyWithImpl<$Res, _$WAAuthGetQRModelImpl>
    implements _$$WAAuthGetQRModelImplCopyWith<$Res> {
  __$$WAAuthGetQRModelImplCopyWithImpl(_$WAAuthGetQRModelImpl _value,
      $Res Function(_$WAAuthGetQRModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WAAuthGetQRModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$WAAuthGetQRModelImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WAAuthGetQRModelImpl implements _WAAuthGetQRModel {
  const _$WAAuthGetQRModelImpl({required this.value});

  factory _$WAAuthGetQRModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WAAuthGetQRModelImplFromJson(json);

  @override
  final String value;

  @override
  String toString() {
    return 'WAAuthGetQRModel(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WAAuthGetQRModelImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of WAAuthGetQRModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WAAuthGetQRModelImplCopyWith<_$WAAuthGetQRModelImpl> get copyWith =>
      __$$WAAuthGetQRModelImplCopyWithImpl<_$WAAuthGetQRModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WAAuthGetQRModelImplToJson(
      this,
    );
  }
}

abstract class _WAAuthGetQRModel implements WAAuthGetQRModel {
  const factory _WAAuthGetQRModel({required final String value}) =
      _$WAAuthGetQRModelImpl;

  factory _WAAuthGetQRModel.fromJson(Map<String, dynamic> json) =
      _$WAAuthGetQRModelImpl.fromJson;

  @override
  String get value;

  /// Create a copy of WAAuthGetQRModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WAAuthGetQRModelImplCopyWith<_$WAAuthGetQRModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WAAuthRequestCodeModel _$WAAuthRequestCodeModelFromJson(
    Map<String, dynamic> json) {
  return _WAAuthRequestCodeModel.fromJson(json);
}

/// @nodoc
mixin _$WAAuthRequestCodeModel {
  String get code => throw _privateConstructorUsedError;

  /// Serializes this WAAuthRequestCodeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WAAuthRequestCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WAAuthRequestCodeModelCopyWith<WAAuthRequestCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WAAuthRequestCodeModelCopyWith<$Res> {
  factory $WAAuthRequestCodeModelCopyWith(WAAuthRequestCodeModel value,
          $Res Function(WAAuthRequestCodeModel) then) =
      _$WAAuthRequestCodeModelCopyWithImpl<$Res, WAAuthRequestCodeModel>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class _$WAAuthRequestCodeModelCopyWithImpl<$Res,
        $Val extends WAAuthRequestCodeModel>
    implements $WAAuthRequestCodeModelCopyWith<$Res> {
  _$WAAuthRequestCodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WAAuthRequestCodeModel
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
abstract class _$$WAAuthRequestCodeModelImplCopyWith<$Res>
    implements $WAAuthRequestCodeModelCopyWith<$Res> {
  factory _$$WAAuthRequestCodeModelImplCopyWith(
          _$WAAuthRequestCodeModelImpl value,
          $Res Function(_$WAAuthRequestCodeModelImpl) then) =
      __$$WAAuthRequestCodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$WAAuthRequestCodeModelImplCopyWithImpl<$Res>
    extends _$WAAuthRequestCodeModelCopyWithImpl<$Res,
        _$WAAuthRequestCodeModelImpl>
    implements _$$WAAuthRequestCodeModelImplCopyWith<$Res> {
  __$$WAAuthRequestCodeModelImplCopyWithImpl(
      _$WAAuthRequestCodeModelImpl _value,
      $Res Function(_$WAAuthRequestCodeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WAAuthRequestCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$WAAuthRequestCodeModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WAAuthRequestCodeModelImpl implements _WAAuthRequestCodeModel {
  const _$WAAuthRequestCodeModelImpl({required this.code});

  factory _$WAAuthRequestCodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WAAuthRequestCodeModelImplFromJson(json);

  @override
  final String code;

  @override
  String toString() {
    return 'WAAuthRequestCodeModel(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WAAuthRequestCodeModelImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of WAAuthRequestCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WAAuthRequestCodeModelImplCopyWith<_$WAAuthRequestCodeModelImpl>
      get copyWith => __$$WAAuthRequestCodeModelImplCopyWithImpl<
          _$WAAuthRequestCodeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WAAuthRequestCodeModelImplToJson(
      this,
    );
  }
}

abstract class _WAAuthRequestCodeModel implements WAAuthRequestCodeModel {
  const factory _WAAuthRequestCodeModel({required final String code}) =
      _$WAAuthRequestCodeModelImpl;

  factory _WAAuthRequestCodeModel.fromJson(Map<String, dynamic> json) =
      _$WAAuthRequestCodeModelImpl.fromJson;

  @override
  String get code;

  /// Create a copy of WAAuthRequestCodeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WAAuthRequestCodeModelImplCopyWith<_$WAAuthRequestCodeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
