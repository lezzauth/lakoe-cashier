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

ChargeModel _$ChargeModelFromJson(Map<String, dynamic> json) {
  return _ChargeModel.fromJson(json);
}

/// @nodoc
mixin _$ChargeModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  bool get isPercentage => throw _privateConstructorUsedError;

  /// Serializes this ChargeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChargeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChargeModelCopyWith<ChargeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargeModelCopyWith<$Res> {
  factory $ChargeModelCopyWith(
          ChargeModel value, $Res Function(ChargeModel) then) =
      _$ChargeModelCopyWithImpl<$Res, ChargeModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String value,
      String ownerId,
      bool isPercentage});
}

/// @nodoc
class _$ChargeModelCopyWithImpl<$Res, $Val extends ChargeModel>
    implements $ChargeModelCopyWith<$Res> {
  _$ChargeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChargeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
    Object? ownerId = null,
    Object? isPercentage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      isPercentage: null == isPercentage
          ? _value.isPercentage
          : isPercentage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChargeModelImplCopyWith<$Res>
    implements $ChargeModelCopyWith<$Res> {
  factory _$$ChargeModelImplCopyWith(
          _$ChargeModelImpl value, $Res Function(_$ChargeModelImpl) then) =
      __$$ChargeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String value,
      String ownerId,
      bool isPercentage});
}

/// @nodoc
class __$$ChargeModelImplCopyWithImpl<$Res>
    extends _$ChargeModelCopyWithImpl<$Res, _$ChargeModelImpl>
    implements _$$ChargeModelImplCopyWith<$Res> {
  __$$ChargeModelImplCopyWithImpl(
      _$ChargeModelImpl _value, $Res Function(_$ChargeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChargeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
    Object? ownerId = null,
    Object? isPercentage = null,
  }) {
    return _then(_$ChargeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      isPercentage: null == isPercentage
          ? _value.isPercentage
          : isPercentage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChargeModelImpl implements _ChargeModel {
  const _$ChargeModelImpl(
      {required this.id,
      required this.name,
      required this.value,
      required this.ownerId,
      required this.isPercentage});

  factory _$ChargeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChargeModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String value;
  @override
  final String ownerId;
  @override
  final bool isPercentage;

  @override
  String toString() {
    return 'ChargeModel(id: $id, name: $name, value: $value, ownerId: $ownerId, isPercentage: $isPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChargeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.isPercentage, isPercentage) ||
                other.isPercentage == isPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, value, ownerId, isPercentage);

  /// Create a copy of ChargeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChargeModelImplCopyWith<_$ChargeModelImpl> get copyWith =>
      __$$ChargeModelImplCopyWithImpl<_$ChargeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChargeModelImplToJson(
      this,
    );
  }
}

abstract class _ChargeModel implements ChargeModel {
  const factory _ChargeModel(
      {required final String id,
      required final String name,
      required final String value,
      required final String ownerId,
      required final bool isPercentage}) = _$ChargeModelImpl;

  factory _ChargeModel.fromJson(Map<String, dynamic> json) =
      _$ChargeModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get value;
  @override
  String get ownerId;
  @override
  bool get isPercentage;

  /// Create a copy of ChargeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChargeModelImplCopyWith<_$ChargeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
