// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DioExceptionModel _$DioExceptionModelFromJson(Map<String, dynamic> json) {
  return _DioExceptionModel.fromJson(json);
}

/// @nodoc
mixin _$DioExceptionModel {
  int? get statusCode => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this DioExceptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DioExceptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DioExceptionModelCopyWith<DioExceptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DioExceptionModelCopyWith<$Res> {
  factory $DioExceptionModelCopyWith(
          DioExceptionModel value, $Res Function(DioExceptionModel) then) =
      _$DioExceptionModelCopyWithImpl<$Res, DioExceptionModel>;
  @useResult
  $Res call({int? statusCode, String? error, String? message});
}

/// @nodoc
class _$DioExceptionModelCopyWithImpl<$Res, $Val extends DioExceptionModel>
    implements $DioExceptionModelCopyWith<$Res> {
  _$DioExceptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DioExceptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DioExceptionModelImplCopyWith<$Res>
    implements $DioExceptionModelCopyWith<$Res> {
  factory _$$DioExceptionModelImplCopyWith(_$DioExceptionModelImpl value,
          $Res Function(_$DioExceptionModelImpl) then) =
      __$$DioExceptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? statusCode, String? error, String? message});
}

/// @nodoc
class __$$DioExceptionModelImplCopyWithImpl<$Res>
    extends _$DioExceptionModelCopyWithImpl<$Res, _$DioExceptionModelImpl>
    implements _$$DioExceptionModelImplCopyWith<$Res> {
  __$$DioExceptionModelImplCopyWithImpl(_$DioExceptionModelImpl _value,
      $Res Function(_$DioExceptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DioExceptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_$DioExceptionModelImpl(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DioExceptionModelImpl implements _DioExceptionModel {
  const _$DioExceptionModelImpl({this.statusCode, this.error, this.message});

  factory _$DioExceptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DioExceptionModelImplFromJson(json);

  @override
  final int? statusCode;
  @override
  final String? error;
  @override
  final String? message;

  @override
  String toString() {
    return 'DioExceptionModel(statusCode: $statusCode, error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DioExceptionModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, error, message);

  /// Create a copy of DioExceptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DioExceptionModelImplCopyWith<_$DioExceptionModelImpl> get copyWith =>
      __$$DioExceptionModelImplCopyWithImpl<_$DioExceptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DioExceptionModelImplToJson(
      this,
    );
  }
}

abstract class _DioExceptionModel implements DioExceptionModel {
  const factory _DioExceptionModel(
      {final int? statusCode,
      final String? error,
      final String? message}) = _$DioExceptionModelImpl;

  factory _DioExceptionModel.fromJson(Map<String, dynamic> json) =
      _$DioExceptionModelImpl.fromJson;

  @override
  int? get statusCode;
  @override
  String? get error;
  @override
  String? get message;

  /// Create a copy of DioExceptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DioExceptionModelImplCopyWith<_$DioExceptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
