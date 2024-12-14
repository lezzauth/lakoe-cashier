// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetActivePaymentMethodDto _$SetActivePaymentMethodDtoFromJson(
    Map<String, dynamic> json) {
  return _SetActivePaymentMethodDto.fromJson(json);
}

/// @nodoc
mixin _$SetActivePaymentMethodDto {
  String get id => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this SetActivePaymentMethodDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetActivePaymentMethodDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetActivePaymentMethodDtoCopyWith<SetActivePaymentMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetActivePaymentMethodDtoCopyWith<$Res> {
  factory $SetActivePaymentMethodDtoCopyWith(SetActivePaymentMethodDto value,
          $Res Function(SetActivePaymentMethodDto) then) =
      _$SetActivePaymentMethodDtoCopyWithImpl<$Res, SetActivePaymentMethodDto>;
  @useResult
  $Res call({String id, bool isActive});
}

/// @nodoc
class _$SetActivePaymentMethodDtoCopyWithImpl<$Res,
        $Val extends SetActivePaymentMethodDto>
    implements $SetActivePaymentMethodDtoCopyWith<$Res> {
  _$SetActivePaymentMethodDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetActivePaymentMethodDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetActivePaymentMethodDtoImplCopyWith<$Res>
    implements $SetActivePaymentMethodDtoCopyWith<$Res> {
  factory _$$SetActivePaymentMethodDtoImplCopyWith(
          _$SetActivePaymentMethodDtoImpl value,
          $Res Function(_$SetActivePaymentMethodDtoImpl) then) =
      __$$SetActivePaymentMethodDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, bool isActive});
}

/// @nodoc
class __$$SetActivePaymentMethodDtoImplCopyWithImpl<$Res>
    extends _$SetActivePaymentMethodDtoCopyWithImpl<$Res,
        _$SetActivePaymentMethodDtoImpl>
    implements _$$SetActivePaymentMethodDtoImplCopyWith<$Res> {
  __$$SetActivePaymentMethodDtoImplCopyWithImpl(
      _$SetActivePaymentMethodDtoImpl _value,
      $Res Function(_$SetActivePaymentMethodDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetActivePaymentMethodDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isActive = null,
  }) {
    return _then(_$SetActivePaymentMethodDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetActivePaymentMethodDtoImpl implements _SetActivePaymentMethodDto {
  const _$SetActivePaymentMethodDtoImpl(
      {required this.id, required this.isActive});

  factory _$SetActivePaymentMethodDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetActivePaymentMethodDtoImplFromJson(json);

  @override
  final String id;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'SetActivePaymentMethodDto(id: $id, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetActivePaymentMethodDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, isActive);

  /// Create a copy of SetActivePaymentMethodDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetActivePaymentMethodDtoImplCopyWith<_$SetActivePaymentMethodDtoImpl>
      get copyWith => __$$SetActivePaymentMethodDtoImplCopyWithImpl<
          _$SetActivePaymentMethodDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetActivePaymentMethodDtoImplToJson(
      this,
    );
  }
}

abstract class _SetActivePaymentMethodDto implements SetActivePaymentMethodDto {
  const factory _SetActivePaymentMethodDto(
      {required final String id,
      required final bool isActive}) = _$SetActivePaymentMethodDtoImpl;

  factory _SetActivePaymentMethodDto.fromJson(Map<String, dynamic> json) =
      _$SetActivePaymentMethodDtoImpl.fromJson;

  @override
  String get id;
  @override
  bool get isActive;

  /// Create a copy of SetActivePaymentMethodDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetActivePaymentMethodDtoImplCopyWith<_$SetActivePaymentMethodDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
