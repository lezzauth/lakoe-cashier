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

  /// Serializes this OpenCashierResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of OpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of OpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of OpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of OpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this OperatorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OperatorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of OperatorModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of OperatorModel
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, role, name, phoneNumber,
      email, emailVerified, phoneVerified, outletId, createdAt, updatedAt);

  /// Create a copy of OperatorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of OperatorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this CashierModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CashierModel
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of CashierModel
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, initialBalance,
      finalBalance, outletId, openedAt, closedAt);

  /// Create a copy of CashierModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CashierModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this GetOpenCashierResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetOpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of GetOpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of GetOpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of GetOpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, initialBalance,
      finalBalance, outletId, openedAt, closedAt, operator);

  /// Create a copy of GetOpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of GetOpenCashierResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetOpenCashierResponseImplCopyWith<_$GetOpenCashierResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SaveOrderResponse _$SaveOrderResponseFromJson(Map<String, dynamic> json) {
  return _SaveOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$SaveOrderResponse {
  String get id => throw _privateConstructorUsedError;
  int get no => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String get customerType => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String? get tableId => throw _privateConstructorUsedError;

  /// Serializes this SaveOrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      int no,
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

  /// Create a copy of SaveOrderResponse
  /// with the given fields replaced by the non-null parameter values.
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
              as int,
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
      int no,
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

  /// Create a copy of SaveOrderResponse
  /// with the given fields replaced by the non-null parameter values.
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
              as int,
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
  final int no;
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, no, status, price,
      customerId, paymentStatus, customerType, type, source, outletId, tableId);

  /// Create a copy of SaveOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required final int no,
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
  int get no;
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

  /// Create a copy of SaveOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveOrderResponseImplCopyWith<_$SaveOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemCustomer _$OrderItemCustomerFromJson(Map<String, dynamic> json) {
  return _OrderItemCustomer.fromJson(json);
}

/// @nodoc
mixin _$OrderItemCustomer {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this OrderItemCustomer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemCustomerCopyWith<OrderItemCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCustomerCopyWith<$Res> {
  factory $OrderItemCustomerCopyWith(
          OrderItemCustomer value, $Res Function(OrderItemCustomer) then) =
      _$OrderItemCustomerCopyWithImpl<$Res, OrderItemCustomer>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$OrderItemCustomerCopyWithImpl<$Res, $Val extends OrderItemCustomer>
    implements $OrderItemCustomerCopyWith<$Res> {
  _$OrderItemCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemCustomerImplCopyWith<$Res>
    implements $OrderItemCustomerCopyWith<$Res> {
  factory _$$OrderItemCustomerImplCopyWith(_$OrderItemCustomerImpl value,
          $Res Function(_$OrderItemCustomerImpl) then) =
      __$$OrderItemCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$OrderItemCustomerImplCopyWithImpl<$Res>
    extends _$OrderItemCustomerCopyWithImpl<$Res, _$OrderItemCustomerImpl>
    implements _$$OrderItemCustomerImplCopyWith<$Res> {
  __$$OrderItemCustomerImplCopyWithImpl(_$OrderItemCustomerImpl _value,
      $Res Function(_$OrderItemCustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$OrderItemCustomerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemCustomerImpl implements _OrderItemCustomer {
  const _$OrderItemCustomerImpl({required this.name});

  factory _$OrderItemCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemCustomerImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'OrderItemCustomer(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemCustomerImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of OrderItemCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemCustomerImplCopyWith<_$OrderItemCustomerImpl> get copyWith =>
      __$$OrderItemCustomerImplCopyWithImpl<_$OrderItemCustomerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemCustomerImplToJson(
      this,
    );
  }
}

abstract class _OrderItemCustomer implements OrderItemCustomer {
  const factory _OrderItemCustomer({required final String name}) =
      _$OrderItemCustomerImpl;

  factory _OrderItemCustomer.fromJson(Map<String, dynamic> json) =
      _$OrderItemCustomerImpl.fromJson;

  @override
  String get name;

  /// Create a copy of OrderItemCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemCustomerImplCopyWith<_$OrderItemCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemTable _$OrderItemTableFromJson(Map<String, dynamic> json) {
  return _OrderItemTable.fromJson(json);
}

/// @nodoc
mixin _$OrderItemTable {
  String get no => throw _privateConstructorUsedError;

  /// Serializes this OrderItemTable to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemTable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemTableCopyWith<OrderItemTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemTableCopyWith<$Res> {
  factory $OrderItemTableCopyWith(
          OrderItemTable value, $Res Function(OrderItemTable) then) =
      _$OrderItemTableCopyWithImpl<$Res, OrderItemTable>;
  @useResult
  $Res call({String no});
}

/// @nodoc
class _$OrderItemTableCopyWithImpl<$Res, $Val extends OrderItemTable>
    implements $OrderItemTableCopyWith<$Res> {
  _$OrderItemTableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemTable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
  }) {
    return _then(_value.copyWith(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemTableImplCopyWith<$Res>
    implements $OrderItemTableCopyWith<$Res> {
  factory _$$OrderItemTableImplCopyWith(_$OrderItemTableImpl value,
          $Res Function(_$OrderItemTableImpl) then) =
      __$$OrderItemTableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String no});
}

/// @nodoc
class __$$OrderItemTableImplCopyWithImpl<$Res>
    extends _$OrderItemTableCopyWithImpl<$Res, _$OrderItemTableImpl>
    implements _$$OrderItemTableImplCopyWith<$Res> {
  __$$OrderItemTableImplCopyWithImpl(
      _$OrderItemTableImpl _value, $Res Function(_$OrderItemTableImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemTable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
  }) {
    return _then(_$OrderItemTableImpl(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemTableImpl implements _OrderItemTable {
  const _$OrderItemTableImpl({required this.no});

  factory _$OrderItemTableImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemTableImplFromJson(json);

  @override
  final String no;

  @override
  String toString() {
    return 'OrderItemTable(no: $no)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemTableImpl &&
            (identical(other.no, no) || other.no == no));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, no);

  /// Create a copy of OrderItemTable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemTableImplCopyWith<_$OrderItemTableImpl> get copyWith =>
      __$$OrderItemTableImplCopyWithImpl<_$OrderItemTableImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemTableImplToJson(
      this,
    );
  }
}

abstract class _OrderItemTable implements OrderItemTable {
  const factory _OrderItemTable({required final String no}) =
      _$OrderItemTableImpl;

  factory _OrderItemTable.fromJson(Map<String, dynamic> json) =
      _$OrderItemTableImpl.fromJson;

  @override
  String get no;

  /// Create a copy of OrderItemTable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemTableImplCopyWith<_$OrderItemTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemResponse _$OrderItemResponseFromJson(Map<String, dynamic> json) {
  return _OrderItemResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderItemResponse {
  String get id => throw _privateConstructorUsedError;
  int get no => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String get customerType => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  OrderItemCustomer? get customer => throw _privateConstructorUsedError;
  OrderItemTable? get table => throw _privateConstructorUsedError;

  /// Serializes this OrderItemResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {String id,
      int no,
      String price,
      String paymentStatus,
      String customerType,
      String type,
      String source,
      OrderItemCustomer? customer,
      OrderItemTable? table});

  $OrderItemCustomerCopyWith<$Res>? get customer;
  $OrderItemTableCopyWith<$Res>? get table;
}

/// @nodoc
class _$OrderItemResponseCopyWithImpl<$Res, $Val extends OrderItemResponse>
    implements $OrderItemResponseCopyWith<$Res> {
  _$OrderItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? price = null,
    Object? paymentStatus = null,
    Object? customerType = null,
    Object? type = null,
    Object? source = null,
    Object? customer = freezed,
    Object? table = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
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
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as OrderItemCustomer?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as OrderItemTable?,
    ) as $Val);
  }

  /// Create a copy of OrderItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderItemCustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $OrderItemCustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of OrderItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderItemTableCopyWith<$Res>? get table {
    if (_value.table == null) {
      return null;
    }

    return $OrderItemTableCopyWith<$Res>(_value.table!, (value) {
      return _then(_value.copyWith(table: value) as $Val);
    });
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
      {String id,
      int no,
      String price,
      String paymentStatus,
      String customerType,
      String type,
      String source,
      OrderItemCustomer? customer,
      OrderItemTable? table});

  @override
  $OrderItemCustomerCopyWith<$Res>? get customer;
  @override
  $OrderItemTableCopyWith<$Res>? get table;
}

/// @nodoc
class __$$OrderItemResponseImplCopyWithImpl<$Res>
    extends _$OrderItemResponseCopyWithImpl<$Res, _$OrderItemResponseImpl>
    implements _$$OrderItemResponseImplCopyWith<$Res> {
  __$$OrderItemResponseImplCopyWithImpl(_$OrderItemResponseImpl _value,
      $Res Function(_$OrderItemResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? price = null,
    Object? paymentStatus = null,
    Object? customerType = null,
    Object? type = null,
    Object? source = null,
    Object? customer = freezed,
    Object? table = freezed,
  }) {
    return _then(_$OrderItemResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
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
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as OrderItemCustomer?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as OrderItemTable?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemResponseImpl implements _OrderItemResponse {
  const _$OrderItemResponseImpl(
      {required this.id,
      required this.no,
      required this.price,
      required this.paymentStatus,
      required this.customerType,
      required this.type,
      required this.source,
      this.customer,
      this.table});

  factory _$OrderItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemResponseImplFromJson(json);

  @override
  final String id;
  @override
  final int no;
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
  final OrderItemCustomer? customer;
  @override
  final OrderItemTable? table;

  @override
  String toString() {
    return 'OrderItemResponse(id: $id, no: $no, price: $price, paymentStatus: $paymentStatus, customerType: $customerType, type: $type, source: $source, customer: $customer, table: $table)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.table, table) || other.table == table));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, no, price, paymentStatus,
      customerType, type, source, customer, table);

  /// Create a copy of OrderItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final String id,
      required final int no,
      required final String price,
      required final String paymentStatus,
      required final String customerType,
      required final String type,
      required final String source,
      final OrderItemCustomer? customer,
      final OrderItemTable? table}) = _$OrderItemResponseImpl;

  factory _OrderItemResponse.fromJson(Map<String, dynamic> json) =
      _$OrderItemResponseImpl.fromJson;

  @override
  String get id;
  @override
  int get no;
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
  OrderItemCustomer? get customer;
  @override
  OrderItemTable? get table;

  /// Create a copy of OrderItemResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemResponseImplCopyWith<_$OrderItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegenerateCashierTokenResponse _$RegenerateCashierTokenResponseFromJson(
    Map<String, dynamic> json) {
  return _RegenerateCashierTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$RegenerateCashierTokenResponse {
  String get token => throw _privateConstructorUsedError;

  /// Serializes this RegenerateCashierTokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegenerateCashierTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegenerateCashierTokenResponseCopyWith<RegenerateCashierTokenResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegenerateCashierTokenResponseCopyWith<$Res> {
  factory $RegenerateCashierTokenResponseCopyWith(
          RegenerateCashierTokenResponse value,
          $Res Function(RegenerateCashierTokenResponse) then) =
      _$RegenerateCashierTokenResponseCopyWithImpl<$Res,
          RegenerateCashierTokenResponse>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$RegenerateCashierTokenResponseCopyWithImpl<$Res,
        $Val extends RegenerateCashierTokenResponse>
    implements $RegenerateCashierTokenResponseCopyWith<$Res> {
  _$RegenerateCashierTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegenerateCashierTokenResponse
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$RegenerateCashierTokenResponseImplCopyWith<$Res>
    implements $RegenerateCashierTokenResponseCopyWith<$Res> {
  factory _$$RegenerateCashierTokenResponseImplCopyWith(
          _$RegenerateCashierTokenResponseImpl value,
          $Res Function(_$RegenerateCashierTokenResponseImpl) then) =
      __$$RegenerateCashierTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$RegenerateCashierTokenResponseImplCopyWithImpl<$Res>
    extends _$RegenerateCashierTokenResponseCopyWithImpl<$Res,
        _$RegenerateCashierTokenResponseImpl>
    implements _$$RegenerateCashierTokenResponseImplCopyWith<$Res> {
  __$$RegenerateCashierTokenResponseImplCopyWithImpl(
      _$RegenerateCashierTokenResponseImpl _value,
      $Res Function(_$RegenerateCashierTokenResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegenerateCashierTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$RegenerateCashierTokenResponseImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegenerateCashierTokenResponseImpl
    implements _RegenerateCashierTokenResponse {
  const _$RegenerateCashierTokenResponseImpl({required this.token});

  factory _$RegenerateCashierTokenResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RegenerateCashierTokenResponseImplFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'RegenerateCashierTokenResponse(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegenerateCashierTokenResponseImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of RegenerateCashierTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegenerateCashierTokenResponseImplCopyWith<
          _$RegenerateCashierTokenResponseImpl>
      get copyWith => __$$RegenerateCashierTokenResponseImplCopyWithImpl<
          _$RegenerateCashierTokenResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegenerateCashierTokenResponseImplToJson(
      this,
    );
  }
}

abstract class _RegenerateCashierTokenResponse
    implements RegenerateCashierTokenResponse {
  const factory _RegenerateCashierTokenResponse({required final String token}) =
      _$RegenerateCashierTokenResponseImpl;

  factory _RegenerateCashierTokenResponse.fromJson(Map<String, dynamic> json) =
      _$RegenerateCashierTokenResponseImpl.fromJson;

  @override
  String get token;

  /// Create a copy of RegenerateCashierTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegenerateCashierTokenResponseImplCopyWith<
          _$RegenerateCashierTokenResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CompleteOrderResponse _$CompleteOrderResponseFromJson(
    Map<String, dynamic> json) {
  return _CompleteOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$CompleteOrderResponse {
  String get id => throw _privateConstructorUsedError;
  int get no => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get paidAmount => throw _privateConstructorUsedError;
  String get paidFrom => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get change => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CompleteOrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompleteOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompleteOrderResponseCopyWith<CompleteOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteOrderResponseCopyWith<$Res> {
  factory $CompleteOrderResponseCopyWith(CompleteOrderResponse value,
          $Res Function(CompleteOrderResponse) then) =
      _$CompleteOrderResponseCopyWithImpl<$Res, CompleteOrderResponse>;
  @useResult
  $Res call(
      {String id,
      int no,
      String paymentMethod,
      String status,
      String paidAmount,
      String paidFrom,
      String amount,
      String change,
      String orderId,
      String outletId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$CompleteOrderResponseCopyWithImpl<$Res,
        $Val extends CompleteOrderResponse>
    implements $CompleteOrderResponseCopyWith<$Res> {
  _$CompleteOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? paidAmount = null,
    Object? paidFrom = null,
    Object? amount = null,
    Object? change = null,
    Object? orderId = null,
    Object? outletId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paidFrom: null == paidFrom
          ? _value.paidFrom
          : paidFrom // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CompleteOrderResponseImplCopyWith<$Res>
    implements $CompleteOrderResponseCopyWith<$Res> {
  factory _$$CompleteOrderResponseImplCopyWith(
          _$CompleteOrderResponseImpl value,
          $Res Function(_$CompleteOrderResponseImpl) then) =
      __$$CompleteOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int no,
      String paymentMethod,
      String status,
      String paidAmount,
      String paidFrom,
      String amount,
      String change,
      String orderId,
      String outletId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$CompleteOrderResponseImplCopyWithImpl<$Res>
    extends _$CompleteOrderResponseCopyWithImpl<$Res,
        _$CompleteOrderResponseImpl>
    implements _$$CompleteOrderResponseImplCopyWith<$Res> {
  __$$CompleteOrderResponseImplCopyWithImpl(_$CompleteOrderResponseImpl _value,
      $Res Function(_$CompleteOrderResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? paidAmount = null,
    Object? paidFrom = null,
    Object? amount = null,
    Object? change = null,
    Object? orderId = null,
    Object? outletId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CompleteOrderResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as String,
      paidFrom: null == paidFrom
          ? _value.paidFrom
          : paidFrom // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
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
class _$CompleteOrderResponseImpl implements _CompleteOrderResponse {
  const _$CompleteOrderResponseImpl(
      {required this.id,
      required this.no,
      required this.paymentMethod,
      required this.status,
      required this.paidAmount,
      required this.paidFrom,
      required this.amount,
      required this.change,
      required this.orderId,
      required this.outletId,
      required this.createdAt,
      required this.updatedAt});

  factory _$CompleteOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompleteOrderResponseImplFromJson(json);

  @override
  final String id;
  @override
  final int no;
  @override
  final String paymentMethod;
  @override
  final String status;
  @override
  final String paidAmount;
  @override
  final String paidFrom;
  @override
  final String amount;
  @override
  final String change;
  @override
  final String orderId;
  @override
  final String outletId;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'CompleteOrderResponse(id: $id, no: $no, paymentMethod: $paymentMethod, status: $status, paidAmount: $paidAmount, paidFrom: $paidFrom, amount: $amount, change: $change, orderId: $orderId, outletId: $outletId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteOrderResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.paidFrom, paidFrom) ||
                other.paidFrom == paidFrom) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.change, change) || other.change == change) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      no,
      paymentMethod,
      status,
      paidAmount,
      paidFrom,
      amount,
      change,
      orderId,
      outletId,
      createdAt,
      updatedAt);

  /// Create a copy of CompleteOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteOrderResponseImplCopyWith<_$CompleteOrderResponseImpl>
      get copyWith => __$$CompleteOrderResponseImplCopyWithImpl<
          _$CompleteOrderResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompleteOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _CompleteOrderResponse implements CompleteOrderResponse {
  const factory _CompleteOrderResponse(
      {required final String id,
      required final int no,
      required final String paymentMethod,
      required final String status,
      required final String paidAmount,
      required final String paidFrom,
      required final String amount,
      required final String change,
      required final String orderId,
      required final String outletId,
      required final String createdAt,
      required final String updatedAt}) = _$CompleteOrderResponseImpl;

  factory _CompleteOrderResponse.fromJson(Map<String, dynamic> json) =
      _$CompleteOrderResponseImpl.fromJson;

  @override
  String get id;
  @override
  int get no;
  @override
  String get paymentMethod;
  @override
  String get status;
  @override
  String get paidAmount;
  @override
  String get paidFrom;
  @override
  String get amount;
  @override
  String get change;
  @override
  String get orderId;
  @override
  String get outletId;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of CompleteOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteOrderResponseImplCopyWith<_$CompleteOrderResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
