// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OpenCashierResponse _$OpenCashierResponseFromJson(Map<String, dynamic> json) {
  return _OpenCashierResponse.fromJson(json);
}

/// @nodoc
mixin _$OpenCashierResponse {
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenCashierResponseCopyWith<OpenCashierResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenCashierResponseCopyWith<$Res> {
  factory $OpenCashierResponseCopyWith(
          OpenCashierResponse value, $Res Function(OpenCashierResponse) then) =
      _$OpenCashierResponseCopyWithImpl<$Res, OpenCashierResponse>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$OpenCashierResponseCopyWithImpl<$Res, $Val extends OpenCashierResponse>
    implements $OpenCashierResponseCopyWith<$Res> {
  _$OpenCashierResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenCashierResponseImplCopyWith<$Res>
    implements $OpenCashierResponseCopyWith<$Res> {
  factory _$$OpenCashierResponseImplCopyWith(_$OpenCashierResponseImpl value,
          $Res Function(_$OpenCashierResponseImpl) then) =
      __$$OpenCashierResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$OpenCashierResponseImplCopyWithImpl<$Res>
    extends _$OpenCashierResponseCopyWithImpl<$Res, _$OpenCashierResponseImpl>
    implements _$$OpenCashierResponseImplCopyWith<$Res> {
  __$$OpenCashierResponseImplCopyWithImpl(_$OpenCashierResponseImpl _value,
      $Res Function(_$OpenCashierResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$OpenCashierResponseImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenCashierResponseImpl implements _OpenCashierResponse {
  const _$OpenCashierResponseImpl({required this.token});

  factory _$OpenCashierResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenCashierResponseImplFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'OpenCashierResponse(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenCashierResponseImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenCashierResponseImplCopyWith<_$OpenCashierResponseImpl> get copyWith =>
      __$$OpenCashierResponseImplCopyWithImpl<_$OpenCashierResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenCashierResponseImplToJson(
      this,
    );
  }
}

abstract class _OpenCashierResponse implements OpenCashierResponse {
  const factory _OpenCashierResponse({required final String token}) =
      _$OpenCashierResponseImpl;

  factory _OpenCashierResponse.fromJson(Map<String, dynamic> json) =
      _$OpenCashierResponseImpl.fromJson;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$OpenCashierResponseImplCopyWith<_$OpenCashierResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OperatorModel _$OperatorModelFromJson(Map<String, dynamic> json) {
  return _OperatorModel.fromJson(json);
}

/// @nodoc
mixin _$OperatorModel {
  String get id => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  bool get phoneVerified => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperatorModelCopyWith<OperatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperatorModelCopyWith<$Res> {
  factory $OperatorModelCopyWith(
          OperatorModel value, $Res Function(OperatorModel) then) =
      _$OperatorModelCopyWithImpl<$Res, OperatorModel>;
  @useResult
  $Res call(
      {String id,
      String role,
      String name,
      String phoneNumber,
      String email,
      bool emailVerified,
      bool phoneVerified,
      String outletId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$OperatorModelCopyWithImpl<$Res, $Val extends OperatorModel>
    implements $OperatorModelCopyWith<$Res> {
  _$OperatorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? phoneVerified = null,
    Object? outletId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneVerified: null == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$OperatorModelImplCopyWith<$Res>
    implements $OperatorModelCopyWith<$Res> {
  factory _$$OperatorModelImplCopyWith(
          _$OperatorModelImpl value, $Res Function(_$OperatorModelImpl) then) =
      __$$OperatorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String role,
      String name,
      String phoneNumber,
      String email,
      bool emailVerified,
      bool phoneVerified,
      String outletId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$OperatorModelImplCopyWithImpl<$Res>
    extends _$OperatorModelCopyWithImpl<$Res, _$OperatorModelImpl>
    implements _$$OperatorModelImplCopyWith<$Res> {
  __$$OperatorModelImplCopyWithImpl(
      _$OperatorModelImpl _value, $Res Function(_$OperatorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? phoneVerified = null,
    Object? outletId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OperatorModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneVerified: null == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$OperatorModelImpl implements _OperatorModel {
  const _$OperatorModelImpl(
      {required this.id,
      required this.role,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.emailVerified,
      required this.phoneVerified,
      required this.outletId,
      required this.createdAt,
      required this.updatedAt});

  factory _$OperatorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperatorModelImplFromJson(json);

  @override
  final String id;
  @override
  final String role;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final bool emailVerified;
  @override
  final bool phoneVerified;
  @override
  final String outletId;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'OperatorModel(id: $id, role: $role, name: $name, phoneNumber: $phoneNumber, email: $email, emailVerified: $emailVerified, phoneVerified: $phoneVerified, outletId: $outletId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperatorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.phoneVerified, phoneVerified) ||
                other.phoneVerified == phoneVerified) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, role, name, phoneNumber,
      email, emailVerified, phoneVerified, outletId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OperatorModelImplCopyWith<_$OperatorModelImpl> get copyWith =>
      __$$OperatorModelImplCopyWithImpl<_$OperatorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperatorModelImplToJson(
      this,
    );
  }
}

abstract class _OperatorModel implements OperatorModel {
  const factory _OperatorModel(
      {required final String id,
      required final String role,
      required final String name,
      required final String phoneNumber,
      required final String email,
      required final bool emailVerified,
      required final bool phoneVerified,
      required final String outletId,
      required final String createdAt,
      required final String updatedAt}) = _$OperatorModelImpl;

  factory _OperatorModel.fromJson(Map<String, dynamic> json) =
      _$OperatorModelImpl.fromJson;

  @override
  String get id;
  @override
  String get role;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  bool get emailVerified;
  @override
  bool get phoneVerified;
  @override
  String get outletId;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OperatorModelImplCopyWith<_$OperatorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CashierModel _$CashierModelFromJson(Map<String, dynamic> json) {
  return _CashierModel.fromJson(json);
}

/// @nodoc
mixin _$CashierModel {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get initialBalance => throw _privateConstructorUsedError;
  String get finalBalance => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get openedAt => throw _privateConstructorUsedError;
  String? get closedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CashierModelCopyWith<CashierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashierModelCopyWith<$Res> {
  factory $CashierModelCopyWith(
          CashierModel value, $Res Function(CashierModel) then) =
      _$CashierModelCopyWithImpl<$Res, CashierModel>;
  @useResult
  $Res call(
      {String id,
      String status,
      String initialBalance,
      String finalBalance,
      String outletId,
      String openedAt,
      String? closedAt});
}

/// @nodoc
class _$CashierModelCopyWithImpl<$Res, $Val extends CashierModel>
    implements $CashierModelCopyWith<$Res> {
  _$CashierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? initialBalance = null,
    Object? finalBalance = null,
    Object? outletId = null,
    Object? openedAt = null,
    Object? closedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      initialBalance: null == initialBalance
          ? _value.initialBalance
          : initialBalance // ignore: cast_nullable_to_non_nullable
              as String,
      finalBalance: null == finalBalance
          ? _value.finalBalance
          : finalBalance // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      openedAt: null == openedAt
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as String,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashierModelImplCopyWith<$Res>
    implements $CashierModelCopyWith<$Res> {
  factory _$$CashierModelImplCopyWith(
          _$CashierModelImpl value, $Res Function(_$CashierModelImpl) then) =
      __$$CashierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      String initialBalance,
      String finalBalance,
      String outletId,
      String openedAt,
      String? closedAt});
}

/// @nodoc
class __$$CashierModelImplCopyWithImpl<$Res>
    extends _$CashierModelCopyWithImpl<$Res, _$CashierModelImpl>
    implements _$$CashierModelImplCopyWith<$Res> {
  __$$CashierModelImplCopyWithImpl(
      _$CashierModelImpl _value, $Res Function(_$CashierModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? initialBalance = null,
    Object? finalBalance = null,
    Object? outletId = null,
    Object? openedAt = null,
    Object? closedAt = freezed,
  }) {
    return _then(_$CashierModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      initialBalance: null == initialBalance
          ? _value.initialBalance
          : initialBalance // ignore: cast_nullable_to_non_nullable
              as String,
      finalBalance: null == finalBalance
          ? _value.finalBalance
          : finalBalance // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      openedAt: null == openedAt
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as String,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CashierModelImpl implements _CashierModel {
  const _$CashierModelImpl(
      {required this.id,
      required this.status,
      required this.initialBalance,
      required this.finalBalance,
      required this.outletId,
      required this.openedAt,
      this.closedAt});

  factory _$CashierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashierModelImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String initialBalance;
  @override
  final String finalBalance;
  @override
  final String outletId;
  @override
  final String openedAt;
  @override
  final String? closedAt;

  @override
  String toString() {
    return 'CashierModel(id: $id, status: $status, initialBalance: $initialBalance, finalBalance: $finalBalance, outletId: $outletId, openedAt: $openedAt, closedAt: $closedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashierModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.initialBalance, initialBalance) ||
                other.initialBalance == initialBalance) &&
            (identical(other.finalBalance, finalBalance) ||
                other.finalBalance == finalBalance) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.openedAt, openedAt) ||
                other.openedAt == openedAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, initialBalance,
      finalBalance, outletId, openedAt, closedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CashierModelImplCopyWith<_$CashierModelImpl> get copyWith =>
      __$$CashierModelImplCopyWithImpl<_$CashierModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashierModelImplToJson(
      this,
    );
  }
}

abstract class _CashierModel implements CashierModel {
  const factory _CashierModel(
      {required final String id,
      required final String status,
      required final String initialBalance,
      required final String finalBalance,
      required final String outletId,
      required final String openedAt,
      final String? closedAt}) = _$CashierModelImpl;

  factory _CashierModel.fromJson(Map<String, dynamic> json) =
      _$CashierModelImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String get initialBalance;
  @override
  String get finalBalance;
  @override
  String get outletId;
  @override
  String get openedAt;
  @override
  String? get closedAt;
  @override
  @JsonKey(ignore: true)
  _$$CashierModelImplCopyWith<_$CashierModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetOpenCashierResponse _$GetOpenCashierResponseFromJson(
    Map<String, dynamic> json) {
  return _GetOpenCashierResponse.fromJson(json);
}

/// @nodoc
mixin _$GetOpenCashierResponse {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get initialBalance => throw _privateConstructorUsedError;
  String get finalBalance => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get openedAt => throw _privateConstructorUsedError;
  String? get closedAt => throw _privateConstructorUsedError;
  OperatorModel get operator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetOpenCashierResponseCopyWith<GetOpenCashierResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetOpenCashierResponseCopyWith<$Res> {
  factory $GetOpenCashierResponseCopyWith(GetOpenCashierResponse value,
          $Res Function(GetOpenCashierResponse) then) =
      _$GetOpenCashierResponseCopyWithImpl<$Res, GetOpenCashierResponse>;
  @useResult
  $Res call(
      {String id,
      String status,
      String initialBalance,
      String finalBalance,
      String outletId,
      String openedAt,
      String? closedAt,
      OperatorModel operator});

  $OperatorModelCopyWith<$Res> get operator;
}

/// @nodoc
class _$GetOpenCashierResponseCopyWithImpl<$Res,
        $Val extends GetOpenCashierResponse>
    implements $GetOpenCashierResponseCopyWith<$Res> {
  _$GetOpenCashierResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? initialBalance = null,
    Object? finalBalance = null,
    Object? outletId = null,
    Object? openedAt = null,
    Object? closedAt = freezed,
    Object? operator = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      initialBalance: null == initialBalance
          ? _value.initialBalance
          : initialBalance // ignore: cast_nullable_to_non_nullable
              as String,
      finalBalance: null == finalBalance
          ? _value.finalBalance
          : finalBalance // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      openedAt: null == openedAt
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as String,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as OperatorModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OperatorModelCopyWith<$Res> get operator {
    return $OperatorModelCopyWith<$Res>(_value.operator, (value) {
      return _then(_value.copyWith(operator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetOpenCashierResponseImplCopyWith<$Res>
    implements $GetOpenCashierResponseCopyWith<$Res> {
  factory _$$GetOpenCashierResponseImplCopyWith(
          _$GetOpenCashierResponseImpl value,
          $Res Function(_$GetOpenCashierResponseImpl) then) =
      __$$GetOpenCashierResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      String initialBalance,
      String finalBalance,
      String outletId,
      String openedAt,
      String? closedAt,
      OperatorModel operator});

  @override
  $OperatorModelCopyWith<$Res> get operator;
}

/// @nodoc
class __$$GetOpenCashierResponseImplCopyWithImpl<$Res>
    extends _$GetOpenCashierResponseCopyWithImpl<$Res,
        _$GetOpenCashierResponseImpl>
    implements _$$GetOpenCashierResponseImplCopyWith<$Res> {
  __$$GetOpenCashierResponseImplCopyWithImpl(
      _$GetOpenCashierResponseImpl _value,
      $Res Function(_$GetOpenCashierResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? initialBalance = null,
    Object? finalBalance = null,
    Object? outletId = null,
    Object? openedAt = null,
    Object? closedAt = freezed,
    Object? operator = null,
  }) {
    return _then(_$GetOpenCashierResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      initialBalance: null == initialBalance
          ? _value.initialBalance
          : initialBalance // ignore: cast_nullable_to_non_nullable
              as String,
      finalBalance: null == finalBalance
          ? _value.finalBalance
          : finalBalance // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      openedAt: null == openedAt
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as String,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as OperatorModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetOpenCashierResponseImpl implements _GetOpenCashierResponse {
  const _$GetOpenCashierResponseImpl(
      {required this.id,
      required this.status,
      required this.initialBalance,
      required this.finalBalance,
      required this.outletId,
      required this.openedAt,
      this.closedAt,
      required this.operator});

  factory _$GetOpenCashierResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetOpenCashierResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String initialBalance;
  @override
  final String finalBalance;
  @override
  final String outletId;
  @override
  final String openedAt;
  @override
  final String? closedAt;
  @override
  final OperatorModel operator;

  @override
  String toString() {
    return 'GetOpenCashierResponse(id: $id, status: $status, initialBalance: $initialBalance, finalBalance: $finalBalance, outletId: $outletId, openedAt: $openedAt, closedAt: $closedAt, operator: $operator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOpenCashierResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.initialBalance, initialBalance) ||
                other.initialBalance == initialBalance) &&
            (identical(other.finalBalance, finalBalance) ||
                other.finalBalance == finalBalance) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.openedAt, openedAt) ||
                other.openedAt == openedAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.operator, operator) ||
                other.operator == operator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, initialBalance,
      finalBalance, outletId, openedAt, closedAt, operator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOpenCashierResponseImplCopyWith<_$GetOpenCashierResponseImpl>
      get copyWith => __$$GetOpenCashierResponseImplCopyWithImpl<
          _$GetOpenCashierResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetOpenCashierResponseImplToJson(
      this,
    );
  }
}

abstract class _GetOpenCashierResponse implements GetOpenCashierResponse {
  const factory _GetOpenCashierResponse(
      {required final String id,
      required final String status,
      required final String initialBalance,
      required final String finalBalance,
      required final String outletId,
      required final String openedAt,
      final String? closedAt,
      required final OperatorModel operator}) = _$GetOpenCashierResponseImpl;

  factory _GetOpenCashierResponse.fromJson(Map<String, dynamic> json) =
      _$GetOpenCashierResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String get initialBalance;
  @override
  String get finalBalance;
  @override
  String get outletId;
  @override
  String get openedAt;
  @override
  String? get closedAt;
  @override
  OperatorModel get operator;
  @override
  @JsonKey(ignore: true)
  _$$GetOpenCashierResponseImplCopyWith<_$GetOpenCashierResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
