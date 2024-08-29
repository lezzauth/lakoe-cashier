// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OwnerProfileModel _$OwnerProfileModelFromJson(Map<String, dynamic> json) {
  return _OwnerProfileModel.fromJson(json);
}

/// @nodoc
mixin _$OwnerProfileModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnerProfileModelCopyWith<OwnerProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerProfileModelCopyWith<$Res> {
  factory $OwnerProfileModelCopyWith(
          OwnerProfileModel value, $Res Function(OwnerProfileModel) then) =
      _$OwnerProfileModelCopyWithImpl<$Res, OwnerProfileModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$OwnerProfileModelCopyWithImpl<$Res, $Val extends OwnerProfileModel>
    implements $OwnerProfileModelCopyWith<$Res> {
  _$OwnerProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnerProfileModelImplCopyWith<$Res>
    implements $OwnerProfileModelCopyWith<$Res> {
  factory _$$OwnerProfileModelImplCopyWith(_$OwnerProfileModelImpl value,
          $Res Function(_$OwnerProfileModelImpl) then) =
      __$$OwnerProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$OwnerProfileModelImplCopyWithImpl<$Res>
    extends _$OwnerProfileModelCopyWithImpl<$Res, _$OwnerProfileModelImpl>
    implements _$$OwnerProfileModelImplCopyWith<$Res> {
  __$$OwnerProfileModelImplCopyWithImpl(_$OwnerProfileModelImpl _value,
      $Res Function(_$OwnerProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$OwnerProfileModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerProfileModelImpl implements _OwnerProfileModel {
  const _$OwnerProfileModelImpl({required this.id, required this.name});

  factory _$OwnerProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerProfileModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'OwnerProfileModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerProfileModelImplCopyWith<_$OwnerProfileModelImpl> get copyWith =>
      __$$OwnerProfileModelImplCopyWithImpl<_$OwnerProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerProfileModelImplToJson(
      this,
    );
  }
}

abstract class _OwnerProfileModel implements OwnerProfileModel {
  const factory _OwnerProfileModel(
      {required final String id,
      required final String name}) = _$OwnerProfileModelImpl;

  factory _OwnerProfileModel.fromJson(Map<String, dynamic> json) =
      _$OwnerProfileModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$OwnerProfileModelImplCopyWith<_$OwnerProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
