// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BankAccountModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankAccountModelCopyWith<BankAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountModelCopyWith<$Res> {
  factory $BankAccountModelCopyWith(
          BankAccountModel value, $Res Function(BankAccountModel) then) =
      _$BankAccountModelCopyWithImpl<$Res, BankAccountModel>;
  @useResult
  $Res call({String id, String name, String number, String bankName});
}

/// @nodoc
class _$BankAccountModelCopyWithImpl<$Res, $Val extends BankAccountModel>
    implements $BankAccountModelCopyWith<$Res> {
  _$BankAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? number = null,
    Object? bankName = null,
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
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankAccountModelImplCopyWith<$Res>
    implements $BankAccountModelCopyWith<$Res> {
  factory _$$BankAccountModelImplCopyWith(_$BankAccountModelImpl value,
          $Res Function(_$BankAccountModelImpl) then) =
      __$$BankAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String number, String bankName});
}

/// @nodoc
class __$$BankAccountModelImplCopyWithImpl<$Res>
    extends _$BankAccountModelCopyWithImpl<$Res, _$BankAccountModelImpl>
    implements _$$BankAccountModelImplCopyWith<$Res> {
  __$$BankAccountModelImplCopyWithImpl(_$BankAccountModelImpl _value,
      $Res Function(_$BankAccountModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? number = null,
    Object? bankName = null,
  }) {
    return _then(_$BankAccountModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BankAccountModelImpl implements _BankAccountModel {
  const _$BankAccountModelImpl(
      {required this.id,
      required this.name,
      required this.number,
      required this.bankName});

  @override
  final String id;
  @override
  final String name;
  @override
  final String number;
  @override
  final String bankName;

  @override
  String toString() {
    return 'BankAccountModel(id: $id, name: $name, number: $number, bankName: $bankName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, number, bankName);

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountModelImplCopyWith<_$BankAccountModelImpl> get copyWith =>
      __$$BankAccountModelImplCopyWithImpl<_$BankAccountModelImpl>(
          this, _$identity);
}

abstract class _BankAccountModel implements BankAccountModel {
  const factory _BankAccountModel(
      {required final String id,
      required final String name,
      required final String number,
      required final String bankName}) = _$BankAccountModelImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get number;
  @override
  String get bankName;

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankAccountModelImplCopyWith<_$BankAccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
