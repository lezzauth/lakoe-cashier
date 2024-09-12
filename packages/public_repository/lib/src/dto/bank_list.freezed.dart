// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetBankAccountDto _$GetBankAccountDtoFromJson(Map<String, dynamic> json) {
  return _GetBankAccountDto.fromJson(json);
}

/// @nodoc
mixin _$GetBankAccountDto {
  String get bankCode => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetBankAccountDtoCopyWith<GetBankAccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBankAccountDtoCopyWith<$Res> {
  factory $GetBankAccountDtoCopyWith(
          GetBankAccountDto value, $Res Function(GetBankAccountDto) then) =
      _$GetBankAccountDtoCopyWithImpl<$Res, GetBankAccountDto>;
  @useResult
  $Res call({String bankCode, String accountNumber});
}

/// @nodoc
class _$GetBankAccountDtoCopyWithImpl<$Res, $Val extends GetBankAccountDto>
    implements $GetBankAccountDtoCopyWith<$Res> {
  _$GetBankAccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankCode = null,
    Object? accountNumber = null,
  }) {
    return _then(_value.copyWith(
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetBankAccountDtoImplCopyWith<$Res>
    implements $GetBankAccountDtoCopyWith<$Res> {
  factory _$$GetBankAccountDtoImplCopyWith(_$GetBankAccountDtoImpl value,
          $Res Function(_$GetBankAccountDtoImpl) then) =
      __$$GetBankAccountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bankCode, String accountNumber});
}

/// @nodoc
class __$$GetBankAccountDtoImplCopyWithImpl<$Res>
    extends _$GetBankAccountDtoCopyWithImpl<$Res, _$GetBankAccountDtoImpl>
    implements _$$GetBankAccountDtoImplCopyWith<$Res> {
  __$$GetBankAccountDtoImplCopyWithImpl(_$GetBankAccountDtoImpl _value,
      $Res Function(_$GetBankAccountDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankCode = null,
    Object? accountNumber = null,
  }) {
    return _then(_$GetBankAccountDtoImpl(
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetBankAccountDtoImpl implements _GetBankAccountDto {
  const _$GetBankAccountDtoImpl(
      {required this.bankCode, required this.accountNumber});

  factory _$GetBankAccountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetBankAccountDtoImplFromJson(json);

  @override
  final String bankCode;
  @override
  final String accountNumber;

  @override
  String toString() {
    return 'GetBankAccountDto(bankCode: $bankCode, accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBankAccountDtoImpl &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bankCode, accountNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBankAccountDtoImplCopyWith<_$GetBankAccountDtoImpl> get copyWith =>
      __$$GetBankAccountDtoImplCopyWithImpl<_$GetBankAccountDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetBankAccountDtoImplToJson(
      this,
    );
  }
}

abstract class _GetBankAccountDto implements GetBankAccountDto {
  const factory _GetBankAccountDto(
      {required final String bankCode,
      required final String accountNumber}) = _$GetBankAccountDtoImpl;

  factory _GetBankAccountDto.fromJson(Map<String, dynamic> json) =
      _$GetBankAccountDtoImpl.fromJson;

  @override
  String get bankCode;
  @override
  String get accountNumber;
  @override
  @JsonKey(ignore: true)
  _$$GetBankAccountDtoImplCopyWith<_$GetBankAccountDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
