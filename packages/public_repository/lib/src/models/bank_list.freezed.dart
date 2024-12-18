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

BankListModel _$BankListModelFromJson(Map<String, dynamic> json) {
  return _BankListModel.fromJson(json);
}

/// @nodoc
mixin _$BankListModel {
  @JsonKey(name: "bank_code")
  String get bankCode => throw _privateConstructorUsedError;
  @JsonKey(name: "bank_name")
  String get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: "swift_code")
  String get swiftCode => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  String get code => throw _privateConstructorUsedError;

  /// Serializes this BankListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankListModelCopyWith<BankListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankListModelCopyWith<$Res> {
  factory $BankListModelCopyWith(
          BankListModel value, $Res Function(BankListModel) then) =
      _$BankListModelCopyWithImpl<$Res, BankListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "bank_code") String bankCode,
      @JsonKey(name: "bank_name") String bankName,
      @JsonKey(name: "swift_code") String swiftCode,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "code") String code});
}

/// @nodoc
class _$BankListModelCopyWithImpl<$Res, $Val extends BankListModel>
    implements $BankListModelCopyWith<$Res> {
  _$BankListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankCode = null,
    Object? bankName = null,
    Object? swiftCode = null,
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      swiftCode: null == swiftCode
          ? _value.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankListModelImplCopyWith<$Res>
    implements $BankListModelCopyWith<$Res> {
  factory _$$BankListModelImplCopyWith(
          _$BankListModelImpl value, $Res Function(_$BankListModelImpl) then) =
      __$$BankListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "bank_code") String bankCode,
      @JsonKey(name: "bank_name") String bankName,
      @JsonKey(name: "swift_code") String swiftCode,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "code") String code});
}

/// @nodoc
class __$$BankListModelImplCopyWithImpl<$Res>
    extends _$BankListModelCopyWithImpl<$Res, _$BankListModelImpl>
    implements _$$BankListModelImplCopyWith<$Res> {
  __$$BankListModelImplCopyWithImpl(
      _$BankListModelImpl _value, $Res Function(_$BankListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BankListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankCode = null,
    Object? bankName = null,
    Object? swiftCode = null,
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$BankListModelImpl(
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      swiftCode: null == swiftCode
          ? _value.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankListModelImpl implements _BankListModel {
  const _$BankListModelImpl(
      {@JsonKey(name: "bank_code") required this.bankCode,
      @JsonKey(name: "bank_name") required this.bankName,
      @JsonKey(name: "swift_code") required this.swiftCode,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "code") required this.code});

  factory _$BankListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankListModelImplFromJson(json);

  @override
  @JsonKey(name: "bank_code")
  final String bankCode;
  @override
  @JsonKey(name: "bank_name")
  final String bankName;
  @override
  @JsonKey(name: "swift_code")
  final String swiftCode;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "code")
  final String code;

  @override
  String toString() {
    return 'BankListModel(bankCode: $bankCode, bankName: $bankName, swiftCode: $swiftCode, name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankListModelImpl &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.swiftCode, swiftCode) ||
                other.swiftCode == swiftCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bankCode, bankName, swiftCode, name, code);

  /// Create a copy of BankListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankListModelImplCopyWith<_$BankListModelImpl> get copyWith =>
      __$$BankListModelImplCopyWithImpl<_$BankListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankListModelImplToJson(
      this,
    );
  }
}

abstract class _BankListModel implements BankListModel {
  const factory _BankListModel(
      {@JsonKey(name: "bank_code") required final String bankCode,
      @JsonKey(name: "bank_name") required final String bankName,
      @JsonKey(name: "swift_code") required final String swiftCode,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "code") required final String code}) = _$BankListModelImpl;

  factory _BankListModel.fromJson(Map<String, dynamic> json) =
      _$BankListModelImpl.fromJson;

  @override
  @JsonKey(name: "bank_code")
  String get bankCode;
  @override
  @JsonKey(name: "bank_name")
  String get bankName;
  @override
  @JsonKey(name: "swift_code")
  String get swiftCode;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "code")
  String get code;

  /// Create a copy of BankListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankListModelImplCopyWith<_$BankListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetBankAccountResponse _$GetBankAccountResponseFromJson(
    Map<String, dynamic> json) {
  return _GetBankAccountResponse.fromJson(json);
}

/// @nodoc
mixin _$GetBankAccountResponse {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  BankAccountModel get data => throw _privateConstructorUsedError;

  /// Serializes this GetBankAccountResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetBankAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetBankAccountResponseCopyWith<GetBankAccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBankAccountResponseCopyWith<$Res> {
  factory $GetBankAccountResponseCopyWith(GetBankAccountResponse value,
          $Res Function(GetBankAccountResponse) then) =
      _$GetBankAccountResponseCopyWithImpl<$Res, GetBankAccountResponse>;
  @useResult
  $Res call({String status, String message, BankAccountModel data});

  $BankAccountModelCopyWith<$Res> get data;
}

/// @nodoc
class _$GetBankAccountResponseCopyWithImpl<$Res,
        $Val extends GetBankAccountResponse>
    implements $GetBankAccountResponseCopyWith<$Res> {
  _$GetBankAccountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetBankAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BankAccountModel,
    ) as $Val);
  }

  /// Create a copy of GetBankAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankAccountModelCopyWith<$Res> get data {
    return $BankAccountModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetBankAccountResponseImplCopyWith<$Res>
    implements $GetBankAccountResponseCopyWith<$Res> {
  factory _$$GetBankAccountResponseImplCopyWith(
          _$GetBankAccountResponseImpl value,
          $Res Function(_$GetBankAccountResponseImpl) then) =
      __$$GetBankAccountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, BankAccountModel data});

  @override
  $BankAccountModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetBankAccountResponseImplCopyWithImpl<$Res>
    extends _$GetBankAccountResponseCopyWithImpl<$Res,
        _$GetBankAccountResponseImpl>
    implements _$$GetBankAccountResponseImplCopyWith<$Res> {
  __$$GetBankAccountResponseImplCopyWithImpl(
      _$GetBankAccountResponseImpl _value,
      $Res Function(_$GetBankAccountResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetBankAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$GetBankAccountResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BankAccountModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetBankAccountResponseImpl implements _GetBankAccountResponse {
  const _$GetBankAccountResponseImpl(
      {required this.status, required this.message, required this.data});

  factory _$GetBankAccountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetBankAccountResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final BankAccountModel data;

  @override
  String toString() {
    return 'GetBankAccountResponse(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBankAccountResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, data);

  /// Create a copy of GetBankAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBankAccountResponseImplCopyWith<_$GetBankAccountResponseImpl>
      get copyWith => __$$GetBankAccountResponseImplCopyWithImpl<
          _$GetBankAccountResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetBankAccountResponseImplToJson(
      this,
    );
  }
}

abstract class _GetBankAccountResponse implements GetBankAccountResponse {
  const factory _GetBankAccountResponse(
      {required final String status,
      required final String message,
      required final BankAccountModel data}) = _$GetBankAccountResponseImpl;

  factory _GetBankAccountResponse.fromJson(Map<String, dynamic> json) =
      _$GetBankAccountResponseImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  BankAccountModel get data;

  /// Create a copy of GetBankAccountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBankAccountResponseImplCopyWith<_$GetBankAccountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BankAccountModel _$BankAccountModelFromJson(Map<String, dynamic> json) {
  return _BankAccountModel.fromJson(json);
}

/// @nodoc
mixin _$BankAccountModel {
  @JsonKey(name: "kodeBank")
  String get bankCode => throw _privateConstructorUsedError;
  @JsonKey(name: "namaBank")
  String get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: "noRekening")
  String get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "nama")
  String get accountName => throw _privateConstructorUsedError;

  /// Serializes this BankAccountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: "kodeBank") String bankCode,
      @JsonKey(name: "namaBank") String bankName,
      @JsonKey(name: "noRekening") String accountNumber,
      @JsonKey(name: "nama") String accountName});
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
    Object? bankCode = null,
    Object? bankName = null,
    Object? accountNumber = null,
    Object? accountName = null,
  }) {
    return _then(_value.copyWith(
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$BankAccountModelImplCopyWith<$Res>
    implements $BankAccountModelCopyWith<$Res> {
  factory _$$BankAccountModelImplCopyWith(_$BankAccountModelImpl value,
          $Res Function(_$BankAccountModelImpl) then) =
      __$$BankAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "kodeBank") String bankCode,
      @JsonKey(name: "namaBank") String bankName,
      @JsonKey(name: "noRekening") String accountNumber,
      @JsonKey(name: "nama") String accountName});
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
    Object? bankCode = null,
    Object? bankName = null,
    Object? accountNumber = null,
    Object? accountName = null,
  }) {
    return _then(_$BankAccountModelImpl(
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
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
class _$BankAccountModelImpl implements _BankAccountModel {
  const _$BankAccountModelImpl(
      {@JsonKey(name: "kodeBank") required this.bankCode,
      @JsonKey(name: "namaBank") required this.bankName,
      @JsonKey(name: "noRekening") required this.accountNumber,
      @JsonKey(name: "nama") required this.accountName});

  factory _$BankAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountModelImplFromJson(json);

  @override
  @JsonKey(name: "kodeBank")
  final String bankCode;
  @override
  @JsonKey(name: "namaBank")
  final String bankName;
  @override
  @JsonKey(name: "noRekening")
  final String accountNumber;
  @override
  @JsonKey(name: "nama")
  final String accountName;

  @override
  String toString() {
    return 'BankAccountModel(bankCode: $bankCode, bankName: $bankName, accountNumber: $accountNumber, accountName: $accountName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountModelImpl &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bankCode, bankName, accountNumber, accountName);

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountModelImplCopyWith<_$BankAccountModelImpl> get copyWith =>
      __$$BankAccountModelImplCopyWithImpl<_$BankAccountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountModelImplToJson(
      this,
    );
  }
}

abstract class _BankAccountModel implements BankAccountModel {
  const factory _BankAccountModel(
          {@JsonKey(name: "kodeBank") required final String bankCode,
          @JsonKey(name: "namaBank") required final String bankName,
          @JsonKey(name: "noRekening") required final String accountNumber,
          @JsonKey(name: "nama") required final String accountName}) =
      _$BankAccountModelImpl;

  factory _BankAccountModel.fromJson(Map<String, dynamic> json) =
      _$BankAccountModelImpl.fromJson;

  @override
  @JsonKey(name: "kodeBank")
  String get bankCode;
  @override
  @JsonKey(name: "namaBank")
  String get bankName;
  @override
  @JsonKey(name: "noRekening")
  String get accountNumber;
  @override
  @JsonKey(name: "nama")
  String get accountName;

  /// Create a copy of BankAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankAccountModelImplCopyWith<_$BankAccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
