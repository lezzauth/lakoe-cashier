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
  String get noRekening => throw _privateConstructorUsedError;
  String get kodeBank => throw _privateConstructorUsedError;

  /// Serializes this GetBankAccountDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetBankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetBankAccountDtoCopyWith<GetBankAccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBankAccountDtoCopyWith<$Res> {
  factory $GetBankAccountDtoCopyWith(
          GetBankAccountDto value, $Res Function(GetBankAccountDto) then) =
      _$GetBankAccountDtoCopyWithImpl<$Res, GetBankAccountDto>;
  @useResult
  $Res call({String noRekening, String kodeBank});
}

/// @nodoc
class _$GetBankAccountDtoCopyWithImpl<$Res, $Val extends GetBankAccountDto>
    implements $GetBankAccountDtoCopyWith<$Res> {
  _$GetBankAccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetBankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noRekening = null,
    Object? kodeBank = null,
  }) {
    return _then(_value.copyWith(
      noRekening: null == noRekening
          ? _value.noRekening
          : noRekening // ignore: cast_nullable_to_non_nullable
              as String,
      kodeBank: null == kodeBank
          ? _value.kodeBank
          : kodeBank // ignore: cast_nullable_to_non_nullable
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
  $Res call({String noRekening, String kodeBank});
}

/// @nodoc
class __$$GetBankAccountDtoImplCopyWithImpl<$Res>
    extends _$GetBankAccountDtoCopyWithImpl<$Res, _$GetBankAccountDtoImpl>
    implements _$$GetBankAccountDtoImplCopyWith<$Res> {
  __$$GetBankAccountDtoImplCopyWithImpl(_$GetBankAccountDtoImpl _value,
      $Res Function(_$GetBankAccountDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetBankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noRekening = null,
    Object? kodeBank = null,
  }) {
    return _then(_$GetBankAccountDtoImpl(
      noRekening: null == noRekening
          ? _value.noRekening
          : noRekening // ignore: cast_nullable_to_non_nullable
              as String,
      kodeBank: null == kodeBank
          ? _value.kodeBank
          : kodeBank // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetBankAccountDtoImpl implements _GetBankAccountDto {
  const _$GetBankAccountDtoImpl(
      {required this.noRekening, required this.kodeBank});

  factory _$GetBankAccountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetBankAccountDtoImplFromJson(json);

  @override
  final String noRekening;
  @override
  final String kodeBank;

  @override
  String toString() {
    return 'GetBankAccountDto(noRekening: $noRekening, kodeBank: $kodeBank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBankAccountDtoImpl &&
            (identical(other.noRekening, noRekening) ||
                other.noRekening == noRekening) &&
            (identical(other.kodeBank, kodeBank) ||
                other.kodeBank == kodeBank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, noRekening, kodeBank);

  /// Create a copy of GetBankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final String noRekening,
      required final String kodeBank}) = _$GetBankAccountDtoImpl;

  factory _GetBankAccountDto.fromJson(Map<String, dynamic> json) =
      _$GetBankAccountDtoImpl.fromJson;

  @override
  String get noRekening;
  @override
  String get kodeBank;

  /// Create a copy of GetBankAccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBankAccountDtoImplCopyWith<_$GetBankAccountDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
