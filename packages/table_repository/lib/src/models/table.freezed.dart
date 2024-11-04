// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TableModel _$TableModelFromJson(Map<String, dynamic> json) {
  return _TableModel.fromJson(json);
}

/// @nodoc
mixin _$TableModel {
  String get id => throw _privateConstructorUsedError;
  String get no => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get outletRoomId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  OutletRoom get outletRoom => throw _privateConstructorUsedError;

  /// Serializes this TableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableModelCopyWith<TableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableModelCopyWith<$Res> {
  factory $TableModelCopyWith(
          TableModel value, $Res Function(TableModel) then) =
      _$TableModelCopyWithImpl<$Res, TableModel>;
  @useResult
  $Res call(
      {String id,
      String no,
      int capacity,
      String outletId,
      String outletRoomId,
      String createdAt,
      String updatedAt,
      OutletRoom outletRoom});

  $OutletRoomCopyWith<$Res> get outletRoom;
}

/// @nodoc
class _$TableModelCopyWithImpl<$Res, $Val extends TableModel>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? capacity = null,
    Object? outletId = null,
    Object? outletRoomId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? outletRoom = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      outletRoomId: null == outletRoomId
          ? _value.outletRoomId
          : outletRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      outletRoom: null == outletRoom
          ? _value.outletRoom
          : outletRoom // ignore: cast_nullable_to_non_nullable
              as OutletRoom,
    ) as $Val);
  }

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutletRoomCopyWith<$Res> get outletRoom {
    return $OutletRoomCopyWith<$Res>(_value.outletRoom, (value) {
      return _then(_value.copyWith(outletRoom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TableModelImplCopyWith<$Res>
    implements $TableModelCopyWith<$Res> {
  factory _$$TableModelImplCopyWith(
          _$TableModelImpl value, $Res Function(_$TableModelImpl) then) =
      __$$TableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String no,
      int capacity,
      String outletId,
      String outletRoomId,
      String createdAt,
      String updatedAt,
      OutletRoom outletRoom});

  @override
  $OutletRoomCopyWith<$Res> get outletRoom;
}

/// @nodoc
class __$$TableModelImplCopyWithImpl<$Res>
    extends _$TableModelCopyWithImpl<$Res, _$TableModelImpl>
    implements _$$TableModelImplCopyWith<$Res> {
  __$$TableModelImplCopyWithImpl(
      _$TableModelImpl _value, $Res Function(_$TableModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? capacity = null,
    Object? outletId = null,
    Object? outletRoomId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? outletRoom = null,
  }) {
    return _then(_$TableModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      outletRoomId: null == outletRoomId
          ? _value.outletRoomId
          : outletRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      outletRoom: null == outletRoom
          ? _value.outletRoom
          : outletRoom // ignore: cast_nullable_to_non_nullable
              as OutletRoom,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableModelImpl implements _TableModel {
  const _$TableModelImpl(
      {required this.id,
      required this.no,
      required this.capacity,
      required this.outletId,
      required this.outletRoomId,
      required this.createdAt,
      required this.updatedAt,
      required this.outletRoom});

  factory _$TableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableModelImplFromJson(json);

  @override
  final String id;
  @override
  final String no;
  @override
  final int capacity;
  @override
  final String outletId;
  @override
  final String outletRoomId;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final OutletRoom outletRoom;

  @override
  String toString() {
    return 'TableModel(id: $id, no: $no, capacity: $capacity, outletId: $outletId, outletRoomId: $outletRoomId, createdAt: $createdAt, updatedAt: $updatedAt, outletRoom: $outletRoom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.outletRoomId, outletRoomId) ||
                other.outletRoomId == outletRoomId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.outletRoom, outletRoom) ||
                other.outletRoom == outletRoom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, no, capacity, outletId,
      outletRoomId, createdAt, updatedAt, outletRoom);

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      __$$TableModelImplCopyWithImpl<_$TableModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableModelImplToJson(
      this,
    );
  }
}

abstract class _TableModel implements TableModel {
  const factory _TableModel(
      {required final String id,
      required final String no,
      required final int capacity,
      required final String outletId,
      required final String outletRoomId,
      required final String createdAt,
      required final String updatedAt,
      required final OutletRoom outletRoom}) = _$TableModelImpl;

  factory _TableModel.fromJson(Map<String, dynamic> json) =
      _$TableModelImpl.fromJson;

  @override
  String get id;
  @override
  String get no;
  @override
  int get capacity;
  @override
  String get outletId;
  @override
  String get outletRoomId;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  OutletRoom get outletRoom;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OutletRoom _$OutletRoomFromJson(Map<String, dynamic> json) {
  return _OutletRoom.fromJson(json);
}

/// @nodoc
mixin _$OutletRoom {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OutletRoom to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutletRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutletRoomCopyWith<OutletRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletRoomCopyWith<$Res> {
  factory $OutletRoomCopyWith(
          OutletRoom value, $Res Function(OutletRoom) then) =
      _$OutletRoomCopyWithImpl<$Res, OutletRoom>;
  @useResult
  $Res call(
      {String id,
      String name,
      String outletId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$OutletRoomCopyWithImpl<$Res, $Val extends OutletRoom>
    implements $OutletRoomCopyWith<$Res> {
  _$OutletRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutletRoom
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
abstract class _$$OutletRoomImplCopyWith<$Res>
    implements $OutletRoomCopyWith<$Res> {
  factory _$$OutletRoomImplCopyWith(
          _$OutletRoomImpl value, $Res Function(_$OutletRoomImpl) then) =
      __$$OutletRoomImplCopyWithImpl<$Res>;
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
class __$$OutletRoomImplCopyWithImpl<$Res>
    extends _$OutletRoomCopyWithImpl<$Res, _$OutletRoomImpl>
    implements _$$OutletRoomImplCopyWith<$Res> {
  __$$OutletRoomImplCopyWithImpl(
      _$OutletRoomImpl _value, $Res Function(_$OutletRoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutletRoom
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
    return _then(_$OutletRoomImpl(
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
class _$OutletRoomImpl implements _OutletRoom {
  const _$OutletRoomImpl(
      {required this.id,
      required this.name,
      required this.outletId,
      required this.createdAt,
      required this.updatedAt});

  factory _$OutletRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutletRoomImplFromJson(json);

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
    return 'OutletRoom(id: $id, name: $name, outletId: $outletId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletRoomImpl &&
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

  /// Create a copy of OutletRoom
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletRoomImplCopyWith<_$OutletRoomImpl> get copyWith =>
      __$$OutletRoomImplCopyWithImpl<_$OutletRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletRoomImplToJson(
      this,
    );
  }
}

abstract class _OutletRoom implements OutletRoom {
  const factory _OutletRoom(
      {required final String id,
      required final String name,
      required final String outletId,
      required final String createdAt,
      required final String updatedAt}) = _$OutletRoomImpl;

  factory _OutletRoom.fromJson(Map<String, dynamic> json) =
      _$OutletRoomImpl.fromJson;

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

  /// Create a copy of OutletRoom
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletRoomImplCopyWith<_$OutletRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
