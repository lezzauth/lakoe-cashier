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

PreviewOrderItem _$PreviewOrderItemFromJson(Map<String, dynamic> json) {
  return _PreviewOrderItem.fromJson(json);
}

/// @nodoc
mixin _$PreviewOrderItem {
  String get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreviewOrderItemCopyWith<PreviewOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewOrderItemCopyWith<$Res> {
  factory $PreviewOrderItemCopyWith(
          PreviewOrderItem value, $Res Function(PreviewOrderItem) then) =
      _$PreviewOrderItemCopyWithImpl<$Res, PreviewOrderItem>;
  @useResult
  $Res call({String price, int quantity, String productId, String notes});
}

/// @nodoc
class _$PreviewOrderItemCopyWithImpl<$Res, $Val extends PreviewOrderItem>
    implements $PreviewOrderItemCopyWith<$Res> {
  _$PreviewOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? quantity = null,
    Object? productId = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreviewOrderItemImplCopyWith<$Res>
    implements $PreviewOrderItemCopyWith<$Res> {
  factory _$$PreviewOrderItemImplCopyWith(_$PreviewOrderItemImpl value,
          $Res Function(_$PreviewOrderItemImpl) then) =
      __$$PreviewOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String price, int quantity, String productId, String notes});
}

/// @nodoc
class __$$PreviewOrderItemImplCopyWithImpl<$Res>
    extends _$PreviewOrderItemCopyWithImpl<$Res, _$PreviewOrderItemImpl>
    implements _$$PreviewOrderItemImplCopyWith<$Res> {
  __$$PreviewOrderItemImplCopyWithImpl(_$PreviewOrderItemImpl _value,
      $Res Function(_$PreviewOrderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? quantity = null,
    Object? productId = null,
    Object? notes = null,
  }) {
    return _then(_$PreviewOrderItemImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreviewOrderItemImpl implements _PreviewOrderItem {
  const _$PreviewOrderItemImpl(
      {required this.price,
      required this.quantity,
      required this.productId,
      required this.notes});

  factory _$PreviewOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewOrderItemImplFromJson(json);

  @override
  final String price;
  @override
  final int quantity;
  @override
  final String productId;
  @override
  final String notes;

  @override
  String toString() {
    return 'PreviewOrderItem(price: $price, quantity: $quantity, productId: $productId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewOrderItemImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, price, quantity, productId, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewOrderItemImplCopyWith<_$PreviewOrderItemImpl> get copyWith =>
      __$$PreviewOrderItemImplCopyWithImpl<_$PreviewOrderItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreviewOrderItemImplToJson(
      this,
    );
  }
}

abstract class _PreviewOrderItem implements PreviewOrderItem {
  const factory _PreviewOrderItem(
      {required final String price,
      required final int quantity,
      required final String productId,
      required final String notes}) = _$PreviewOrderItemImpl;

  factory _PreviewOrderItem.fromJson(Map<String, dynamic> json) =
      _$PreviewOrderItemImpl.fromJson;

  @override
  String get price;
  @override
  int get quantity;
  @override
  String get productId;
  @override
  String get notes;
  @override
  @JsonKey(ignore: true)
  _$$PreviewOrderItemImplCopyWith<_$PreviewOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreviewOrderCharge _$PreviewOrderChargeFromJson(Map<String, dynamic> json) {
  return _PreviewOrderCharge.fromJson(json);
}

/// @nodoc
mixin _$PreviewOrderCharge {
  String get type => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreviewOrderChargeCopyWith<PreviewOrderCharge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewOrderChargeCopyWith<$Res> {
  factory $PreviewOrderChargeCopyWith(
          PreviewOrderCharge value, $Res Function(PreviewOrderCharge) then) =
      _$PreviewOrderChargeCopyWithImpl<$Res, PreviewOrderCharge>;
  @useResult
  $Res call({String type, String amount});
}

/// @nodoc
class _$PreviewOrderChargeCopyWithImpl<$Res, $Val extends PreviewOrderCharge>
    implements $PreviewOrderChargeCopyWith<$Res> {
  _$PreviewOrderChargeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreviewOrderChargeImplCopyWith<$Res>
    implements $PreviewOrderChargeCopyWith<$Res> {
  factory _$$PreviewOrderChargeImplCopyWith(_$PreviewOrderChargeImpl value,
          $Res Function(_$PreviewOrderChargeImpl) then) =
      __$$PreviewOrderChargeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String amount});
}

/// @nodoc
class __$$PreviewOrderChargeImplCopyWithImpl<$Res>
    extends _$PreviewOrderChargeCopyWithImpl<$Res, _$PreviewOrderChargeImpl>
    implements _$$PreviewOrderChargeImplCopyWith<$Res> {
  __$$PreviewOrderChargeImplCopyWithImpl(_$PreviewOrderChargeImpl _value,
      $Res Function(_$PreviewOrderChargeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_$PreviewOrderChargeImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreviewOrderChargeImpl implements _PreviewOrderCharge {
  const _$PreviewOrderChargeImpl({required this.type, required this.amount});

  factory _$PreviewOrderChargeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewOrderChargeImplFromJson(json);

  @override
  final String type;
  @override
  final String amount;

  @override
  String toString() {
    return 'PreviewOrderCharge(type: $type, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewOrderChargeImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewOrderChargeImplCopyWith<_$PreviewOrderChargeImpl> get copyWith =>
      __$$PreviewOrderChargeImplCopyWithImpl<_$PreviewOrderChargeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreviewOrderChargeImplToJson(
      this,
    );
  }
}

abstract class _PreviewOrderCharge implements PreviewOrderCharge {
  const factory _PreviewOrderCharge(
      {required final String type,
      required final String amount}) = _$PreviewOrderChargeImpl;

  factory _PreviewOrderCharge.fromJson(Map<String, dynamic> json) =
      _$PreviewOrderChargeImpl.fromJson;

  @override
  String get type;
  @override
  String get amount;
  @override
  @JsonKey(ignore: true)
  _$$PreviewOrderChargeImplCopyWith<_$PreviewOrderChargeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreviewOrderPriceResponse _$PreviewOrderPriceResponseFromJson(
    Map<String, dynamic> json) {
  return _PreviewOrderPriceResponse.fromJson(json);
}

/// @nodoc
mixin _$PreviewOrderPriceResponse {
  String get total => throw _privateConstructorUsedError;
  List<PreviewOrderItem> get orderItems => throw _privateConstructorUsedError;
  List<PreviewOrderCharge> get charges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreviewOrderPriceResponseCopyWith<PreviewOrderPriceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewOrderPriceResponseCopyWith<$Res> {
  factory $PreviewOrderPriceResponseCopyWith(PreviewOrderPriceResponse value,
          $Res Function(PreviewOrderPriceResponse) then) =
      _$PreviewOrderPriceResponseCopyWithImpl<$Res, PreviewOrderPriceResponse>;
  @useResult
  $Res call(
      {String total,
      List<PreviewOrderItem> orderItems,
      List<PreviewOrderCharge> charges});
}

/// @nodoc
class _$PreviewOrderPriceResponseCopyWithImpl<$Res,
        $Val extends PreviewOrderPriceResponse>
    implements $PreviewOrderPriceResponseCopyWith<$Res> {
  _$PreviewOrderPriceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? orderItems = null,
    Object? charges = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      orderItems: null == orderItems
          ? _value.orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<PreviewOrderItem>,
      charges: null == charges
          ? _value.charges
          : charges // ignore: cast_nullable_to_non_nullable
              as List<PreviewOrderCharge>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreviewOrderPriceResponseImplCopyWith<$Res>
    implements $PreviewOrderPriceResponseCopyWith<$Res> {
  factory _$$PreviewOrderPriceResponseImplCopyWith(
          _$PreviewOrderPriceResponseImpl value,
          $Res Function(_$PreviewOrderPriceResponseImpl) then) =
      __$$PreviewOrderPriceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String total,
      List<PreviewOrderItem> orderItems,
      List<PreviewOrderCharge> charges});
}

/// @nodoc
class __$$PreviewOrderPriceResponseImplCopyWithImpl<$Res>
    extends _$PreviewOrderPriceResponseCopyWithImpl<$Res,
        _$PreviewOrderPriceResponseImpl>
    implements _$$PreviewOrderPriceResponseImplCopyWith<$Res> {
  __$$PreviewOrderPriceResponseImplCopyWithImpl(
      _$PreviewOrderPriceResponseImpl _value,
      $Res Function(_$PreviewOrderPriceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? orderItems = null,
    Object? charges = null,
  }) {
    return _then(_$PreviewOrderPriceResponseImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      orderItems: null == orderItems
          ? _value._orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<PreviewOrderItem>,
      charges: null == charges
          ? _value._charges
          : charges // ignore: cast_nullable_to_non_nullable
              as List<PreviewOrderCharge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreviewOrderPriceResponseImpl implements _PreviewOrderPriceResponse {
  const _$PreviewOrderPriceResponseImpl(
      {required this.total,
      required final List<PreviewOrderItem> orderItems,
      required final List<PreviewOrderCharge> charges})
      : _orderItems = orderItems,
        _charges = charges;

  factory _$PreviewOrderPriceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewOrderPriceResponseImplFromJson(json);

  @override
  final String total;
  final List<PreviewOrderItem> _orderItems;
  @override
  List<PreviewOrderItem> get orderItems {
    if (_orderItems is EqualUnmodifiableListView) return _orderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderItems);
  }

  final List<PreviewOrderCharge> _charges;
  @override
  List<PreviewOrderCharge> get charges {
    if (_charges is EqualUnmodifiableListView) return _charges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charges);
  }

  @override
  String toString() {
    return 'PreviewOrderPriceResponse(total: $total, orderItems: $orderItems, charges: $charges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewOrderPriceResponseImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems) &&
            const DeepCollectionEquality().equals(other._charges, _charges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      total,
      const DeepCollectionEquality().hash(_orderItems),
      const DeepCollectionEquality().hash(_charges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewOrderPriceResponseImplCopyWith<_$PreviewOrderPriceResponseImpl>
      get copyWith => __$$PreviewOrderPriceResponseImplCopyWithImpl<
          _$PreviewOrderPriceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreviewOrderPriceResponseImplToJson(
      this,
    );
  }
}

abstract class _PreviewOrderPriceResponse implements PreviewOrderPriceResponse {
  const factory _PreviewOrderPriceResponse(
          {required final String total,
          required final List<PreviewOrderItem> orderItems,
          required final List<PreviewOrderCharge> charges}) =
      _$PreviewOrderPriceResponseImpl;

  factory _PreviewOrderPriceResponse.fromJson(Map<String, dynamic> json) =
      _$PreviewOrderPriceResponseImpl.fromJson;

  @override
  String get total;
  @override
  List<PreviewOrderItem> get orderItems;
  @override
  List<PreviewOrderCharge> get charges;
  @override
  @JsonKey(ignore: true)
  _$$PreviewOrderPriceResponseImplCopyWith<_$PreviewOrderPriceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SaveOrderResponse _$SaveOrderResponseFromJson(Map<String, dynamic> json) {
  return _SaveOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$SaveOrderResponse {
  String get id => throw _privateConstructorUsedError;
  String get no => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String get customerType => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String? get tableId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaveOrderResponseCopyWith<SaveOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveOrderResponseCopyWith<$Res> {
  factory $SaveOrderResponseCopyWith(
          SaveOrderResponse value, $Res Function(SaveOrderResponse) then) =
      _$SaveOrderResponseCopyWithImpl<$Res, SaveOrderResponse>;
  @useResult
  $Res call(
      {String id,
      String no,
      String status,
      String price,
      String? customerId,
      String paymentStatus,
      String customerType,
      String type,
      String source,
      String outletId,
      String? tableId});
}

/// @nodoc
class _$SaveOrderResponseCopyWithImpl<$Res, $Val extends SaveOrderResponse>
    implements $SaveOrderResponseCopyWith<$Res> {
  _$SaveOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? status = null,
    Object? price = null,
    Object? customerId = freezed,
    Object? paymentStatus = null,
    Object? customerType = null,
    Object? type = null,
    Object? source = null,
    Object? outletId = null,
    Object? tableId = freezed,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      customerType: null == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      tableId: freezed == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveOrderResponseImplCopyWith<$Res>
    implements $SaveOrderResponseCopyWith<$Res> {
  factory _$$SaveOrderResponseImplCopyWith(_$SaveOrderResponseImpl value,
          $Res Function(_$SaveOrderResponseImpl) then) =
      __$$SaveOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String no,
      String status,
      String price,
      String? customerId,
      String paymentStatus,
      String customerType,
      String type,
      String source,
      String outletId,
      String? tableId});
}

/// @nodoc
class __$$SaveOrderResponseImplCopyWithImpl<$Res>
    extends _$SaveOrderResponseCopyWithImpl<$Res, _$SaveOrderResponseImpl>
    implements _$$SaveOrderResponseImplCopyWith<$Res> {
  __$$SaveOrderResponseImplCopyWithImpl(_$SaveOrderResponseImpl _value,
      $Res Function(_$SaveOrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? status = null,
    Object? price = null,
    Object? customerId = freezed,
    Object? paymentStatus = null,
    Object? customerType = null,
    Object? type = null,
    Object? source = null,
    Object? outletId = null,
    Object? tableId = freezed,
  }) {
    return _then(_$SaveOrderResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      customerType: null == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      tableId: freezed == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaveOrderResponseImpl implements _SaveOrderResponse {
  const _$SaveOrderResponseImpl(
      {required this.id,
      required this.no,
      required this.status,
      required this.price,
      this.customerId,
      required this.paymentStatus,
      required this.customerType,
      required this.type,
      required this.source,
      required this.outletId,
      this.tableId});

  factory _$SaveOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveOrderResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String no;
  @override
  final String status;
  @override
  final String price;
  @override
  final String? customerId;
  @override
  final String paymentStatus;
  @override
  final String customerType;
  @override
  final String type;
  @override
  final String source;
  @override
  final String outletId;
  @override
  final String? tableId;

  @override
  String toString() {
    return 'SaveOrderResponse(id: $id, no: $no, status: $status, price: $price, customerId: $customerId, paymentStatus: $paymentStatus, customerType: $customerType, type: $type, source: $source, outletId: $outletId, tableId: $tableId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveOrderResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.tableId, tableId) || other.tableId == tableId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, no, status, price,
      customerId, paymentStatus, customerType, type, source, outletId, tableId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveOrderResponseImplCopyWith<_$SaveOrderResponseImpl> get copyWith =>
      __$$SaveOrderResponseImplCopyWithImpl<_$SaveOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _SaveOrderResponse implements SaveOrderResponse {
  const factory _SaveOrderResponse(
      {required final String id,
      required final String no,
      required final String status,
      required final String price,
      final String? customerId,
      required final String paymentStatus,
      required final String customerType,
      required final String type,
      required final String source,
      required final String outletId,
      final String? tableId}) = _$SaveOrderResponseImpl;

  factory _SaveOrderResponse.fromJson(Map<String, dynamic> json) =
      _$SaveOrderResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get no;
  @override
  String get status;
  @override
  String get price;
  @override
  String? get customerId;
  @override
  String get paymentStatus;
  @override
  String get customerType;
  @override
  String get type;
  @override
  String get source;
  @override
  String get outletId;
  @override
  String? get tableId;
  @override
  @JsonKey(ignore: true)
  _$$SaveOrderResponseImplCopyWith<_$SaveOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemResponse _$OrderItemResponseFromJson(Map<String, dynamic> json) {
  return _OrderItemResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderItemResponse {
  String get no => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String get customerType => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemResponseCopyWith<OrderItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemResponseCopyWith<$Res> {
  factory $OrderItemResponseCopyWith(
          OrderItemResponse value, $Res Function(OrderItemResponse) then) =
      _$OrderItemResponseCopyWithImpl<$Res, OrderItemResponse>;
  @useResult
  $Res call(
      {String no,
      String price,
      String paymentStatus,
      String customerType,
      String type,
      String source});
}

/// @nodoc
class _$OrderItemResponseCopyWithImpl<$Res, $Val extends OrderItemResponse>
    implements $OrderItemResponseCopyWith<$Res> {
  _$OrderItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? price = null,
    Object? paymentStatus = null,
    Object? customerType = null,
    Object? type = null,
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      customerType: null == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemResponseImplCopyWith<$Res>
    implements $OrderItemResponseCopyWith<$Res> {
  factory _$$OrderItemResponseImplCopyWith(_$OrderItemResponseImpl value,
          $Res Function(_$OrderItemResponseImpl) then) =
      __$$OrderItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String no,
      String price,
      String paymentStatus,
      String customerType,
      String type,
      String source});
}

/// @nodoc
class __$$OrderItemResponseImplCopyWithImpl<$Res>
    extends _$OrderItemResponseCopyWithImpl<$Res, _$OrderItemResponseImpl>
    implements _$$OrderItemResponseImplCopyWith<$Res> {
  __$$OrderItemResponseImplCopyWithImpl(_$OrderItemResponseImpl _value,
      $Res Function(_$OrderItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? price = null,
    Object? paymentStatus = null,
    Object? customerType = null,
    Object? type = null,
    Object? source = null,
  }) {
    return _then(_$OrderItemResponseImpl(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      customerType: null == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemResponseImpl implements _OrderItemResponse {
  const _$OrderItemResponseImpl(
      {required this.no,
      required this.price,
      required this.paymentStatus,
      required this.customerType,
      required this.type,
      required this.source});

  factory _$OrderItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemResponseImplFromJson(json);

  @override
  final String no;
  @override
  final String price;
  @override
  final String paymentStatus;
  @override
  final String customerType;
  @override
  final String type;
  @override
  final String source;

  @override
  String toString() {
    return 'OrderItemResponse(no: $no, price: $price, paymentStatus: $paymentStatus, customerType: $customerType, type: $type, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemResponseImpl &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, no, price, paymentStatus, customerType, type, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemResponseImplCopyWith<_$OrderItemResponseImpl> get copyWith =>
      __$$OrderItemResponseImplCopyWithImpl<_$OrderItemResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemResponseImplToJson(
      this,
    );
  }
}

abstract class _OrderItemResponse implements OrderItemResponse {
  const factory _OrderItemResponse(
      {required final String no,
      required final String price,
      required final String paymentStatus,
      required final String customerType,
      required final String type,
      required final String source}) = _$OrderItemResponseImpl;

  factory _OrderItemResponse.fromJson(Map<String, dynamic> json) =
      _$OrderItemResponseImpl.fromJson;

  @override
  String get no;
  @override
  String get price;
  @override
  String get paymentStatus;
  @override
  String get customerType;
  @override
  String get type;
  @override
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemResponseImplCopyWith<_$OrderItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
