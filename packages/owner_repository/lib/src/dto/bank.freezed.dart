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

CreateOwnerBankDto _$CreateOwnerBankDtoFromJson(Map<String, dynamic> json) {
  return _CreateOwnerBankDto.fromJson(json);
}

/// @nodoc
mixin _$CreateOwnerBankDto {
  String get name => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateOwnerBankDtoCopyWith<CreateOwnerBankDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOwnerBankDtoCopyWith<$Res> {
  factory $CreateOwnerBankDtoCopyWith(
          CreateOwnerBankDto value, $Res Function(CreateOwnerBankDto) then) =
      _$CreateOwnerBankDtoCopyWithImpl<$Res, CreateOwnerBankDto>;
  @useResult
  $Res call({String name, String accountNumber, String accountName});
}

/// @nodoc
class _$CreateOwnerBankDtoCopyWithImpl<$Res, $Val extends CreateOwnerBankDto>
    implements $CreateOwnerBankDtoCopyWith<$Res> {
  _$CreateOwnerBankDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? accountNumber = null,
    Object? accountName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOwnerBankDtoImplCopyWith<$Res>
    implements $CreateOwnerBankDtoCopyWith<$Res> {
  factory _$$CreateOwnerBankDtoImplCopyWith(_$CreateOwnerBankDtoImpl value,
          $Res Function(_$CreateOwnerBankDtoImpl) then) =
      __$$CreateOwnerBankDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String accountNumber, String accountName});
}

/// @nodoc
class __$$CreateOwnerBankDtoImplCopyWithImpl<$Res>
    extends _$CreateOwnerBankDtoCopyWithImpl<$Res, _$CreateOwnerBankDtoImpl>
    implements _$$CreateOwnerBankDtoImplCopyWith<$Res> {
  __$$CreateOwnerBankDtoImplCopyWithImpl(_$CreateOwnerBankDtoImpl _value,
      $Res Function(_$CreateOwnerBankDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? accountNumber = null,
    Object? accountName = null,
  }) {
    return _then(_$CreateOwnerBankDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOwnerBankDtoImpl implements _CreateOwnerBankDto {
  const _$CreateOwnerBankDtoImpl(
      {required this.name,
      required this.accountNumber,
      required this.accountName});

  factory _$CreateOwnerBankDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOwnerBankDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String accountNumber;
  @override
  final String accountName;

  @override
  String toString() {
    return 'CreateOwnerBankDto(name: $name, accountNumber: $accountNumber, accountName: $accountName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOwnerBankDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, accountNumber, accountName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOwnerBankDtoImplCopyWith<_$CreateOwnerBankDtoImpl> get copyWith =>
      __$$CreateOwnerBankDtoImplCopyWithImpl<_$CreateOwnerBankDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOwnerBankDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateOwnerBankDto implements CreateOwnerBankDto {
  const factory _CreateOwnerBankDto(
      {required final String name,
      required final String accountNumber,
      required final String accountName}) = _$CreateOwnerBankDtoImpl;

  factory _CreateOwnerBankDto.fromJson(Map<String, dynamic> json) =
      _$CreateOwnerBankDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get accountNumber;
  @override
  String get accountName;
  @override
  @JsonKey(ignore: true)
  _$$CreateOwnerBankDtoImplCopyWith<_$CreateOwnerBankDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateOwnerBankDto _$UpdateOwnerBankDtoFromJson(Map<String, dynamic> json) {
  return _UpdateOwnerBankDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateOwnerBankDto {
  String? get name => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;
  String? get accountName => throw _privateConstructorUsedError;
  bool? get isPrimary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateOwnerBankDtoCopyWith<UpdateOwnerBankDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateOwnerBankDtoCopyWith<$Res> {
  factory $UpdateOwnerBankDtoCopyWith(
          UpdateOwnerBankDto value, $Res Function(UpdateOwnerBankDto) then) =
      _$UpdateOwnerBankDtoCopyWithImpl<$Res, UpdateOwnerBankDto>;
  @useResult
  $Res call(
      {String? name,
      String? accountNumber,
      String? accountName,
      bool? isPrimary});
}

/// @nodoc
class _$UpdateOwnerBankDtoCopyWithImpl<$Res, $Val extends UpdateOwnerBankDto>
    implements $UpdateOwnerBankDtoCopyWith<$Res> {
  _$UpdateOwnerBankDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? accountNumber = freezed,
    Object? accountName = freezed,
    Object? isPrimary = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: freezed == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateOwnerBankDtoImplCopyWith<$Res>
    implements $UpdateOwnerBankDtoCopyWith<$Res> {
  factory _$$UpdateOwnerBankDtoImplCopyWith(_$UpdateOwnerBankDtoImpl value,
          $Res Function(_$UpdateOwnerBankDtoImpl) then) =
      __$$UpdateOwnerBankDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? accountNumber,
      String? accountName,
      bool? isPrimary});
}

/// @nodoc
class __$$UpdateOwnerBankDtoImplCopyWithImpl<$Res>
    extends _$UpdateOwnerBankDtoCopyWithImpl<$Res, _$UpdateOwnerBankDtoImpl>
    implements _$$UpdateOwnerBankDtoImplCopyWith<$Res> {
  __$$UpdateOwnerBankDtoImplCopyWithImpl(_$UpdateOwnerBankDtoImpl _value,
      $Res Function(_$UpdateOwnerBankDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? accountNumber = freezed,
    Object? accountName = freezed,
    Object? isPrimary = freezed,
  }) {
    return _then(_$UpdateOwnerBankDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: freezed == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateOwnerBankDtoImpl implements _UpdateOwnerBankDto {
  const _$UpdateOwnerBankDtoImpl(
      {this.name, this.accountNumber, this.accountName, this.isPrimary});

  factory _$UpdateOwnerBankDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateOwnerBankDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final String? accountNumber;
  @override
  final String? accountName;
  @override
  final bool? isPrimary;

  @override
  String toString() {
    return 'UpdateOwnerBankDto(name: $name, accountNumber: $accountNumber, accountName: $accountName, isPrimary: $isPrimary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateOwnerBankDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, accountNumber, accountName, isPrimary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateOwnerBankDtoImplCopyWith<_$UpdateOwnerBankDtoImpl> get copyWith =>
      __$$UpdateOwnerBankDtoImplCopyWithImpl<_$UpdateOwnerBankDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateOwnerBankDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateOwnerBankDto implements UpdateOwnerBankDto {
  const factory _UpdateOwnerBankDto(
      {final String? name,
      final String? accountNumber,
      final String? accountName,
      final bool? isPrimary}) = _$UpdateOwnerBankDtoImpl;

  factory _UpdateOwnerBankDto.fromJson(Map<String, dynamic> json) =
      _$UpdateOwnerBankDtoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get accountNumber;
  @override
  String? get accountName;
  @override
  bool? get isPrimary;
  @override
  @JsonKey(ignore: true)
  _$$UpdateOwnerBankDtoImplCopyWith<_$UpdateOwnerBankDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
