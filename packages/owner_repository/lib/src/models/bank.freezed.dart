// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OwnerBankModel _$OwnerBankModelFromJson(Map<String, dynamic> json) {
  return _OwnerBankModel.fromJson(json);
}

/// @nodoc
mixin _$OwnerBankModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isPrimary => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnerBankModelCopyWith<OwnerBankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerBankModelCopyWith<$Res> {
  factory $OwnerBankModelCopyWith(
          OwnerBankModel value, $Res Function(OwnerBankModel) then) =
      _$OwnerBankModelCopyWithImpl<$Res, OwnerBankModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      bool isPrimary,
      String accountNumber,
      String accountName,
      String ownerId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$OwnerBankModelCopyWithImpl<$Res, $Val extends OwnerBankModel>
    implements $OwnerBankModelCopyWith<$Res> {
  _$OwnerBankModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isPrimary = null,
    Object? accountNumber = null,
    Object? accountName = null,
    Object? ownerId = null,
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
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$OwnerBankModelImplCopyWith<$Res>
    implements $OwnerBankModelCopyWith<$Res> {
  factory _$$OwnerBankModelImplCopyWith(_$OwnerBankModelImpl value,
          $Res Function(_$OwnerBankModelImpl) then) =
      __$$OwnerBankModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      bool isPrimary,
      String accountNumber,
      String accountName,
      String ownerId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$OwnerBankModelImplCopyWithImpl<$Res>
    extends _$OwnerBankModelCopyWithImpl<$Res, _$OwnerBankModelImpl>
    implements _$$OwnerBankModelImplCopyWith<$Res> {
  __$$OwnerBankModelImplCopyWithImpl(
      _$OwnerBankModelImpl _value, $Res Function(_$OwnerBankModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isPrimary = null,
    Object? accountNumber = null,
    Object? accountName = null,
    Object? ownerId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OwnerBankModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
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
class _$OwnerBankModelImpl implements _OwnerBankModel {
  const _$OwnerBankModelImpl(
      {required this.id,
      required this.name,
      required this.isPrimary,
      required this.accountNumber,
      required this.accountName,
      required this.ownerId,
      required this.createdAt,
      required this.updatedAt});

  factory _$OwnerBankModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerBankModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool isPrimary;
  @override
  final String accountNumber;
  @override
  final String accountName;
  @override
  final String ownerId;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'OwnerBankModel(id: $id, name: $name, isPrimary: $isPrimary, accountNumber: $accountNumber, accountName: $accountName, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerBankModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isPrimary,
      accountNumber, accountName, ownerId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerBankModelImplCopyWith<_$OwnerBankModelImpl> get copyWith =>
      __$$OwnerBankModelImplCopyWithImpl<_$OwnerBankModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerBankModelImplToJson(
      this,
    );
  }
}

abstract class _OwnerBankModel implements OwnerBankModel {
  const factory _OwnerBankModel(
      {required final String id,
      required final String name,
      required final bool isPrimary,
      required final String accountNumber,
      required final String accountName,
      required final String ownerId,
      required final String createdAt,
      required final String updatedAt}) = _$OwnerBankModelImpl;

  factory _OwnerBankModel.fromJson(Map<String, dynamic> json) =
      _$OwnerBankModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get isPrimary;
  @override
  String get accountNumber;
  @override
  String get accountName;
  @override
  String get ownerId;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OwnerBankModelImplCopyWith<_$OwnerBankModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
