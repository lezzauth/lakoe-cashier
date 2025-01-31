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

TableLocationModel _$TableLocationModelFromJson(Map<String, dynamic> json) {
  return _TableLocationModel.fromJson(json);
}

/// @nodoc
mixin _$TableLocationModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TableLocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableLocationModelCopyWith<TableLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableLocationModelCopyWith<$Res> {
  factory $TableLocationModelCopyWith(
          TableLocationModel value, $Res Function(TableLocationModel) then) =
      _$TableLocationModelCopyWithImpl<$Res, TableLocationModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String outletId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$TableLocationModelCopyWithImpl<$Res, $Val extends TableLocationModel>
    implements $TableLocationModelCopyWith<$Res> {
  _$TableLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? outletId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableLocationModelImplCopyWith<$Res>
    implements $TableLocationModelCopyWith<$Res> {
  factory _$$TableLocationModelImplCopyWith(_$TableLocationModelImpl value,
          $Res Function(_$TableLocationModelImpl) then) =
      __$$TableLocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String outletId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$TableLocationModelImplCopyWithImpl<$Res>
    extends _$TableLocationModelCopyWithImpl<$Res, _$TableLocationModelImpl>
    implements _$$TableLocationModelImplCopyWith<$Res> {
  __$$TableLocationModelImplCopyWithImpl(_$TableLocationModelImpl _value,
      $Res Function(_$TableLocationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? outletId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TableLocationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableLocationModelImpl implements _TableLocationModel {
  const _$TableLocationModelImpl(
      {required this.id,
      required this.name,
      required this.outletId,
      required this.createdAt,
      required this.updatedAt});

  factory _$TableLocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableLocationModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String outletId;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'TableLocationModel(id: $id, name: $name, outletId: $outletId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableLocationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, outletId, createdAt, updatedAt);

  /// Create a copy of TableLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableLocationModelImplCopyWith<_$TableLocationModelImpl> get copyWith =>
      __$$TableLocationModelImplCopyWithImpl<_$TableLocationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableLocationModelImplToJson(
      this,
    );
  }
}

abstract class _TableLocationModel implements TableLocationModel {
  const factory _TableLocationModel(
      {required final String id,
      required final String name,
      required final String outletId,
      required final String createdAt,
      required final String updatedAt}) = _$TableLocationModelImpl;

  factory _TableLocationModel.fromJson(Map<String, dynamic> json) =
      _$TableLocationModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get outletId;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of TableLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableLocationModelImplCopyWith<_$TableLocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
