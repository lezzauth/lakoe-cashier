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

TaxModel _$TaxModelFromJson(Map<String, dynamic> json) {
  return _TaxModel.fromJson(json);
}

/// @nodoc
mixin _$TaxModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;

  /// Serializes this TaxModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaxModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxModelCopyWith<TaxModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxModelCopyWith<$Res> {
  factory $TaxModelCopyWith(TaxModel value, $Res Function(TaxModel) then) =
      _$TaxModelCopyWithImpl<$Res, TaxModel>;
  @useResult
  $Res call({String id, String name, String value, String ownerId});
}

/// @nodoc
class _$TaxModelCopyWithImpl<$Res, $Val extends TaxModel>
    implements $TaxModelCopyWith<$Res> {
  _$TaxModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaxModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
    Object? ownerId = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxModelImplCopyWith<$Res>
    implements $TaxModelCopyWith<$Res> {
  factory _$$TaxModelImplCopyWith(
          _$TaxModelImpl value, $Res Function(_$TaxModelImpl) then) =
      __$$TaxModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String value, String ownerId});
}

/// @nodoc
class __$$TaxModelImplCopyWithImpl<$Res>
    extends _$TaxModelCopyWithImpl<$Res, _$TaxModelImpl>
    implements _$$TaxModelImplCopyWith<$Res> {
  __$$TaxModelImplCopyWithImpl(
      _$TaxModelImpl _value, $Res Function(_$TaxModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaxModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? value = null,
    Object? ownerId = null,
  }) {
    return _then(_$TaxModelImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxModelImpl implements _TaxModel {
  const _$TaxModelImpl(
      {required this.id,
      required this.name,
      required this.value,
      required this.ownerId});

  factory _$TaxModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String value;
  @override
  final String ownerId;

  @override
  String toString() {
    return 'TaxModel(id: $id, name: $name, value: $value, ownerId: $ownerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, value, ownerId);

  /// Create a copy of TaxModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxModelImplCopyWith<_$TaxModelImpl> get copyWith =>
      __$$TaxModelImplCopyWithImpl<_$TaxModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxModelImplToJson(
      this,
    );
  }
}

abstract class _TaxModel implements TaxModel {
  const factory _TaxModel(
      {required final String id,
      required final String name,
      required final String value,
      required final String ownerId}) = _$TaxModelImpl;

  factory _TaxModel.fromJson(Map<String, dynamic> json) =
      _$TaxModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get value;
  @override
  String get ownerId;

  /// Create a copy of TaxModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxModelImplCopyWith<_$TaxModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
