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
  String? get email => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
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
      String? email,
      String? profilePicture,
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
    Object? email = freezed,
    Object? profilePicture = freezed,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
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
      String? email,
      String? profilePicture,
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
    Object? email = freezed,
    Object? profilePicture = freezed,
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
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
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
      this.email,
      this.profilePicture,
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
  final String? email;
  @override
  final String? profilePicture;
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
    return 'OperatorModel(id: $id, role: $role, name: $name, phoneNumber: $phoneNumber, email: $email, profilePicture: $profilePicture, emailVerified: $emailVerified, phoneVerified: $phoneVerified, outletId: $outletId, createdAt: $createdAt, updatedAt: $updatedAt)';
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
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      id,
      role,
      name,
      phoneNumber,
      email,
      profilePicture,
      emailVerified,
      phoneVerified,
      outletId,
      createdAt,
      updatedAt);

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
      final String? email,
      final String? profilePicture,
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
  String? get email;
  @override
  String? get profilePicture;
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

OrderCashierItemCustomer _$OrderCashierItemCustomerFromJson(
    Map<String, dynamic> json) {
  return _OrderCashierItemCustomer.fromJson(json);
}

/// @nodoc
mixin _$OrderCashierItemCustomer {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this OrderCashierItemCustomer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCashierItemCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCashierItemCustomerCopyWith<OrderCashierItemCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCashierItemCustomerCopyWith<$Res> {
  factory $OrderCashierItemCustomerCopyWith(OrderCashierItemCustomer value,
          $Res Function(OrderCashierItemCustomer) then) =
      _$OrderCashierItemCustomerCopyWithImpl<$Res, OrderCashierItemCustomer>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$OrderCashierItemCustomerCopyWithImpl<$Res,
        $Val extends OrderCashierItemCustomer>
    implements $OrderCashierItemCustomerCopyWith<$Res> {
  _$OrderCashierItemCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCashierItemCustomer
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
abstract class _$$OrderCashierItemCustomerImplCopyWith<$Res>
    implements $OrderCashierItemCustomerCopyWith<$Res> {
  factory _$$OrderCashierItemCustomerImplCopyWith(
          _$OrderCashierItemCustomerImpl value,
          $Res Function(_$OrderCashierItemCustomerImpl) then) =
      __$$OrderCashierItemCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$OrderCashierItemCustomerImplCopyWithImpl<$Res>
    extends _$OrderCashierItemCustomerCopyWithImpl<$Res,
        _$OrderCashierItemCustomerImpl>
    implements _$$OrderCashierItemCustomerImplCopyWith<$Res> {
  __$$OrderCashierItemCustomerImplCopyWithImpl(
      _$OrderCashierItemCustomerImpl _value,
      $Res Function(_$OrderCashierItemCustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCashierItemCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$OrderCashierItemCustomerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCashierItemCustomerImpl implements _OrderCashierItemCustomer {
  const _$OrderCashierItemCustomerImpl({required this.name});

  factory _$OrderCashierItemCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCashierItemCustomerImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'OrderCashierItemCustomer(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCashierItemCustomerImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of OrderCashierItemCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCashierItemCustomerImplCopyWith<_$OrderCashierItemCustomerImpl>
      get copyWith => __$$OrderCashierItemCustomerImplCopyWithImpl<
          _$OrderCashierItemCustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCashierItemCustomerImplToJson(
      this,
    );
  }
}

abstract class _OrderCashierItemCustomer implements OrderCashierItemCustomer {
  const factory _OrderCashierItemCustomer({required final String name}) =
      _$OrderCashierItemCustomerImpl;

  factory _OrderCashierItemCustomer.fromJson(Map<String, dynamic> json) =
      _$OrderCashierItemCustomerImpl.fromJson;

  @override
  String get name;

  /// Create a copy of OrderCashierItemCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCashierItemCustomerImplCopyWith<_$OrderCashierItemCustomerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderCashierItemTable _$OrderCashierItemTableFromJson(
    Map<String, dynamic> json) {
  return _OrderCashierItemTable.fromJson(json);
}

/// @nodoc
mixin _$OrderCashierItemTable {
  String get no => throw _privateConstructorUsedError;

  /// Serializes this OrderCashierItemTable to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCashierItemTable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCashierItemTableCopyWith<OrderCashierItemTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCashierItemTableCopyWith<$Res> {
  factory $OrderCashierItemTableCopyWith(OrderCashierItemTable value,
          $Res Function(OrderCashierItemTable) then) =
      _$OrderCashierItemTableCopyWithImpl<$Res, OrderCashierItemTable>;
  @useResult
  $Res call({String no});
}

/// @nodoc
class _$OrderCashierItemTableCopyWithImpl<$Res,
        $Val extends OrderCashierItemTable>
    implements $OrderCashierItemTableCopyWith<$Res> {
  _$OrderCashierItemTableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCashierItemTable
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
abstract class _$$OrderCashierItemTableImplCopyWith<$Res>
    implements $OrderCashierItemTableCopyWith<$Res> {
  factory _$$OrderCashierItemTableImplCopyWith(
          _$OrderCashierItemTableImpl value,
          $Res Function(_$OrderCashierItemTableImpl) then) =
      __$$OrderCashierItemTableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String no});
}

/// @nodoc
class __$$OrderCashierItemTableImplCopyWithImpl<$Res>
    extends _$OrderCashierItemTableCopyWithImpl<$Res,
        _$OrderCashierItemTableImpl>
    implements _$$OrderCashierItemTableImplCopyWith<$Res> {
  __$$OrderCashierItemTableImplCopyWithImpl(_$OrderCashierItemTableImpl _value,
      $Res Function(_$OrderCashierItemTableImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCashierItemTable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
  }) {
    return _then(_$OrderCashierItemTableImpl(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCashierItemTableImpl implements _OrderCashierItemTable {
  const _$OrderCashierItemTableImpl({required this.no});

  factory _$OrderCashierItemTableImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCashierItemTableImplFromJson(json);

  @override
  final String no;

  @override
  String toString() {
    return 'OrderCashierItemTable(no: $no)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCashierItemTableImpl &&
            (identical(other.no, no) || other.no == no));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, no);

  /// Create a copy of OrderCashierItemTable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCashierItemTableImplCopyWith<_$OrderCashierItemTableImpl>
      get copyWith => __$$OrderCashierItemTableImplCopyWithImpl<
          _$OrderCashierItemTableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCashierItemTableImplToJson(
      this,
    );
  }
}

abstract class _OrderCashierItemTable implements OrderCashierItemTable {
  const factory _OrderCashierItemTable({required final String no}) =
      _$OrderCashierItemTableImpl;

  factory _OrderCashierItemTable.fromJson(Map<String, dynamic> json) =
      _$OrderCashierItemTableImpl.fromJson;

  @override
  String get no;

  /// Create a copy of OrderCashierItemTable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCashierItemTableImplCopyWith<_$OrderCashierItemTableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderCashierItemRes _$OrderCashierItemResFromJson(Map<String, dynamic> json) {
  return _OrderCashierItemRes.fromJson(json);
}

/// @nodoc
mixin _$OrderCashierItemRes {
  String get id => throw _privateConstructorUsedError;
  int get no => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String get customerType => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  OrderCashierItemCustomer? get customer => throw _privateConstructorUsedError;
  OrderCashierItemTable? get table => throw _privateConstructorUsedError;

  /// Serializes this OrderCashierItemRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCashierItemRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCashierItemResCopyWith<OrderCashierItemRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCashierItemResCopyWith<$Res> {
  factory $OrderCashierItemResCopyWith(
          OrderCashierItemRes value, $Res Function(OrderCashierItemRes) then) =
      _$OrderCashierItemResCopyWithImpl<$Res, OrderCashierItemRes>;
  @useResult
  $Res call(
      {String id,
      int no,
      String price,
      String paymentStatus,
      String customerType,
      String type,
      String source,
      String status,
      OrderCashierItemCustomer? customer,
      OrderCashierItemTable? table});

  $OrderCashierItemCustomerCopyWith<$Res>? get customer;
  $OrderCashierItemTableCopyWith<$Res>? get table;
}

/// @nodoc
class _$OrderCashierItemResCopyWithImpl<$Res, $Val extends OrderCashierItemRes>
    implements $OrderCashierItemResCopyWith<$Res> {
  _$OrderCashierItemResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCashierItemRes
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
    Object? status = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as OrderCashierItemCustomer?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as OrderCashierItemTable?,
    ) as $Val);
  }

  /// Create a copy of OrderCashierItemRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderCashierItemCustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $OrderCashierItemCustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of OrderCashierItemRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderCashierItemTableCopyWith<$Res>? get table {
    if (_value.table == null) {
      return null;
    }

    return $OrderCashierItemTableCopyWith<$Res>(_value.table!, (value) {
      return _then(_value.copyWith(table: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderCashierItemResImplCopyWith<$Res>
    implements $OrderCashierItemResCopyWith<$Res> {
  factory _$$OrderCashierItemResImplCopyWith(_$OrderCashierItemResImpl value,
          $Res Function(_$OrderCashierItemResImpl) then) =
      __$$OrderCashierItemResImplCopyWithImpl<$Res>;
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
      String status,
      OrderCashierItemCustomer? customer,
      OrderCashierItemTable? table});

  @override
  $OrderCashierItemCustomerCopyWith<$Res>? get customer;
  @override
  $OrderCashierItemTableCopyWith<$Res>? get table;
}

/// @nodoc
class __$$OrderCashierItemResImplCopyWithImpl<$Res>
    extends _$OrderCashierItemResCopyWithImpl<$Res, _$OrderCashierItemResImpl>
    implements _$$OrderCashierItemResImplCopyWith<$Res> {
  __$$OrderCashierItemResImplCopyWithImpl(_$OrderCashierItemResImpl _value,
      $Res Function(_$OrderCashierItemResImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCashierItemRes
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
    Object? status = null,
    Object? customer = freezed,
    Object? table = freezed,
  }) {
    return _then(_$OrderCashierItemResImpl(
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as OrderCashierItemCustomer?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as OrderCashierItemTable?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCashierItemResImpl implements _OrderCashierItemRes {
  const _$OrderCashierItemResImpl(
      {required this.id,
      required this.no,
      required this.price,
      required this.paymentStatus,
      required this.customerType,
      required this.type,
      required this.source,
      required this.status,
      this.customer,
      this.table});

  factory _$OrderCashierItemResImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCashierItemResImplFromJson(json);

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
  final String status;
  @override
  final OrderCashierItemCustomer? customer;
  @override
  final OrderCashierItemTable? table;

  @override
  String toString() {
    return 'OrderCashierItemRes(id: $id, no: $no, price: $price, paymentStatus: $paymentStatus, customerType: $customerType, type: $type, source: $source, status: $status, customer: $customer, table: $table)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCashierItemResImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.table, table) || other.table == table));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, no, price, paymentStatus,
      customerType, type, source, status, customer, table);

  /// Create a copy of OrderCashierItemRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCashierItemResImplCopyWith<_$OrderCashierItemResImpl> get copyWith =>
      __$$OrderCashierItemResImplCopyWithImpl<_$OrderCashierItemResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCashierItemResImplToJson(
      this,
    );
  }
}

abstract class _OrderCashierItemRes implements OrderCashierItemRes {
  const factory _OrderCashierItemRes(
      {required final String id,
      required final int no,
      required final String price,
      required final String paymentStatus,
      required final String customerType,
      required final String type,
      required final String source,
      required final String status,
      final OrderCashierItemCustomer? customer,
      final OrderCashierItemTable? table}) = _$OrderCashierItemResImpl;

  factory _OrderCashierItemRes.fromJson(Map<String, dynamic> json) =
      _$OrderCashierItemResImpl.fromJson;

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
  String get status;
  @override
  OrderCashierItemCustomer? get customer;
  @override
  OrderCashierItemTable? get table;

  /// Create a copy of OrderCashierItemRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCashierItemResImplCopyWith<_$OrderCashierItemResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegenerateCashierTokenRes _$RegenerateCashierTokenResFromJson(
    Map<String, dynamic> json) {
  return _RegenerateCashierTokenRes.fromJson(json);
}

/// @nodoc
mixin _$RegenerateCashierTokenRes {
  String get token => throw _privateConstructorUsedError;

  /// Serializes this RegenerateCashierTokenRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegenerateCashierTokenRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegenerateCashierTokenResCopyWith<RegenerateCashierTokenRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegenerateCashierTokenResCopyWith<$Res> {
  factory $RegenerateCashierTokenResCopyWith(RegenerateCashierTokenRes value,
          $Res Function(RegenerateCashierTokenRes) then) =
      _$RegenerateCashierTokenResCopyWithImpl<$Res, RegenerateCashierTokenRes>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$RegenerateCashierTokenResCopyWithImpl<$Res,
        $Val extends RegenerateCashierTokenRes>
    implements $RegenerateCashierTokenResCopyWith<$Res> {
  _$RegenerateCashierTokenResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegenerateCashierTokenRes
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
abstract class _$$RegenerateCashierTokenResImplCopyWith<$Res>
    implements $RegenerateCashierTokenResCopyWith<$Res> {
  factory _$$RegenerateCashierTokenResImplCopyWith(
          _$RegenerateCashierTokenResImpl value,
          $Res Function(_$RegenerateCashierTokenResImpl) then) =
      __$$RegenerateCashierTokenResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$RegenerateCashierTokenResImplCopyWithImpl<$Res>
    extends _$RegenerateCashierTokenResCopyWithImpl<$Res,
        _$RegenerateCashierTokenResImpl>
    implements _$$RegenerateCashierTokenResImplCopyWith<$Res> {
  __$$RegenerateCashierTokenResImplCopyWithImpl(
      _$RegenerateCashierTokenResImpl _value,
      $Res Function(_$RegenerateCashierTokenResImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegenerateCashierTokenRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$RegenerateCashierTokenResImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegenerateCashierTokenResImpl implements _RegenerateCashierTokenRes {
  const _$RegenerateCashierTokenResImpl({required this.token});

  factory _$RegenerateCashierTokenResImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegenerateCashierTokenResImplFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'RegenerateCashierTokenRes(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegenerateCashierTokenResImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of RegenerateCashierTokenRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegenerateCashierTokenResImplCopyWith<_$RegenerateCashierTokenResImpl>
      get copyWith => __$$RegenerateCashierTokenResImplCopyWithImpl<
          _$RegenerateCashierTokenResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegenerateCashierTokenResImplToJson(
      this,
    );
  }
}

abstract class _RegenerateCashierTokenRes implements RegenerateCashierTokenRes {
  const factory _RegenerateCashierTokenRes({required final String token}) =
      _$RegenerateCashierTokenResImpl;

  factory _RegenerateCashierTokenRes.fromJson(Map<String, dynamic> json) =
      _$RegenerateCashierTokenResImpl.fromJson;

  @override
  String get token;

  /// Create a copy of RegenerateCashierTokenRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegenerateCashierTokenResImplCopyWith<_$RegenerateCashierTokenResImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CompleteOrderRes _$CompleteOrderResFromJson(Map<String, dynamic> json) {
  return _CompleteOrderRes.fromJson(json);
}

/// @nodoc
mixin _$CompleteOrderRes {
  Order get order => throw _privateConstructorUsedError;
  Transaction get transaction => throw _privateConstructorUsedError;

  /// Serializes this CompleteOrderRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompleteOrderRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompleteOrderResCopyWith<CompleteOrderRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteOrderResCopyWith<$Res> {
  factory $CompleteOrderResCopyWith(
          CompleteOrderRes value, $Res Function(CompleteOrderRes) then) =
      _$CompleteOrderResCopyWithImpl<$Res, CompleteOrderRes>;
  @useResult
  $Res call({Order order, Transaction transaction});

  $OrderCopyWith<$Res> get order;
  $TransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class _$CompleteOrderResCopyWithImpl<$Res, $Val extends CompleteOrderRes>
    implements $CompleteOrderResCopyWith<$Res> {
  _$CompleteOrderResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteOrderRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? transaction = null,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
    ) as $Val);
  }

  /// Create a copy of CompleteOrderRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get order {
    return $OrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  /// Create a copy of CompleteOrderRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompleteOrderResImplCopyWith<$Res>
    implements $CompleteOrderResCopyWith<$Res> {
  factory _$$CompleteOrderResImplCopyWith(_$CompleteOrderResImpl value,
          $Res Function(_$CompleteOrderResImpl) then) =
      __$$CompleteOrderResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Order order, Transaction transaction});

  @override
  $OrderCopyWith<$Res> get order;
  @override
  $TransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class __$$CompleteOrderResImplCopyWithImpl<$Res>
    extends _$CompleteOrderResCopyWithImpl<$Res, _$CompleteOrderResImpl>
    implements _$$CompleteOrderResImplCopyWith<$Res> {
  __$$CompleteOrderResImplCopyWithImpl(_$CompleteOrderResImpl _value,
      $Res Function(_$CompleteOrderResImpl) _then)
      : super(_value, _then);

  /// Create a copy of CompleteOrderRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? transaction = null,
  }) {
    return _then(_$CompleteOrderResImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompleteOrderResImpl implements _CompleteOrderRes {
  const _$CompleteOrderResImpl(
      {required this.order, required this.transaction});

  factory _$CompleteOrderResImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompleteOrderResImplFromJson(json);

  @override
  final Order order;
  @override
  final Transaction transaction;

  @override
  String toString() {
    return 'CompleteOrderRes(order: $order, transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteOrderResImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, order, transaction);

  /// Create a copy of CompleteOrderRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteOrderResImplCopyWith<_$CompleteOrderResImpl> get copyWith =>
      __$$CompleteOrderResImplCopyWithImpl<_$CompleteOrderResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompleteOrderResImplToJson(
      this,
    );
  }
}

abstract class _CompleteOrderRes implements CompleteOrderRes {
  const factory _CompleteOrderRes(
      {required final Order order,
      required final Transaction transaction}) = _$CompleteOrderResImpl;

  factory _CompleteOrderRes.fromJson(Map<String, dynamic> json) =
      _$CompleteOrderResImpl.fromJson;

  @override
  Order get order;
  @override
  Transaction get transaction;

  /// Create a copy of CompleteOrderRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteOrderResImplCopyWith<_$CompleteOrderResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
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
  String get cashierId => throw _privateConstructorUsedError;
  String get closedAt => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
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
      String? tableId,
      String cashierId,
      String closedAt,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
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
    Object? cashierId = null,
    Object? closedAt = null,
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
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      closedAt: null == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
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
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
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
      String? tableId,
      String cashierId,
      String closedAt,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
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
    Object? cashierId = null,
    Object? closedAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OrderImpl(
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
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      closedAt: null == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
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
class _$OrderImpl implements _Order {
  const _$OrderImpl(
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
      this.tableId,
      required this.cashierId,
      required this.closedAt,
      required this.createdAt,
      required this.updatedAt});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

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
  final String cashierId;
  @override
  final String closedAt;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'Order(id: $id, no: $no, status: $status, price: $price, customerId: $customerId, paymentStatus: $paymentStatus, customerType: $customerType, type: $type, source: $source, outletId: $outletId, tableId: $tableId, cashierId: $cashierId, closedAt: $closedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
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
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.cashierId, cashierId) ||
                other.cashierId == cashierId) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
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
      status,
      price,
      customerId,
      paymentStatus,
      customerType,
      type,
      source,
      outletId,
      tableId,
      cashierId,
      closedAt,
      createdAt,
      updatedAt);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
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
      final String? tableId,
      required final String cashierId,
      required final String closedAt,
      required final String createdAt,
      required final String updatedAt}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

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
  @override
  String get cashierId;
  @override
  String get closedAt;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get paidAmount => throw _privateConstructorUsedError;
  String get paidFrom => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get change => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String? get externalId => throw _privateConstructorUsedError;
  String? get approvalCode => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String id,
      String paymentMethod,
      String status,
      String paidAmount,
      String paidFrom,
      String amount,
      String change,
      String? accountNumber,
      String? photo,
      String orderId,
      String outletId,
      String? externalId,
      String? approvalCode,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? paidAmount = null,
    Object? paidFrom = null,
    Object? amount = null,
    Object? change = null,
    Object? accountNumber = freezed,
    Object? photo = freezed,
    Object? orderId = null,
    Object? outletId = null,
    Object? externalId = freezed,
    Object? approvalCode = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      approvalCode: freezed == approvalCode
          ? _value.approvalCode
          : approvalCode // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String paymentMethod,
      String status,
      String paidAmount,
      String paidFrom,
      String amount,
      String change,
      String? accountNumber,
      String? photo,
      String orderId,
      String outletId,
      String? externalId,
      String? approvalCode,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? paidAmount = null,
    Object? paidFrom = null,
    Object? amount = null,
    Object? change = null,
    Object? accountNumber = freezed,
    Object? photo = freezed,
    Object? orderId = null,
    Object? outletId = null,
    Object? externalId = freezed,
    Object? approvalCode = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      approvalCode: freezed == approvalCode
          ? _value.approvalCode
          : approvalCode // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {required this.id,
      required this.paymentMethod,
      required this.status,
      required this.paidAmount,
      required this.paidFrom,
      required this.amount,
      required this.change,
      this.accountNumber,
      this.photo,
      required this.orderId,
      required this.outletId,
      this.externalId,
      this.approvalCode,
      required this.createdAt,
      required this.updatedAt});

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String id;
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
  final String? accountNumber;
  @override
  final String? photo;
  @override
  final String orderId;
  @override
  final String outletId;
  @override
  final String? externalId;
  @override
  final String? approvalCode;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'Transaction(id: $id, paymentMethod: $paymentMethod, status: $status, paidAmount: $paidAmount, paidFrom: $paidFrom, amount: $amount, change: $change, accountNumber: $accountNumber, photo: $photo, orderId: $orderId, outletId: $outletId, externalId: $externalId, approvalCode: $approvalCode, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.paidFrom, paidFrom) ||
                other.paidFrom == paidFrom) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.change, change) || other.change == change) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            (identical(other.approvalCode, approvalCode) ||
                other.approvalCode == approvalCode) &&
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
      paymentMethod,
      status,
      paidAmount,
      paidFrom,
      amount,
      change,
      accountNumber,
      photo,
      orderId,
      outletId,
      externalId,
      approvalCode,
      createdAt,
      updatedAt);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final String id,
      required final String paymentMethod,
      required final String status,
      required final String paidAmount,
      required final String paidFrom,
      required final String amount,
      required final String change,
      final String? accountNumber,
      final String? photo,
      required final String orderId,
      required final String outletId,
      final String? externalId,
      final String? approvalCode,
      required final String createdAt,
      required final String updatedAt}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String get id;
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
  String? get accountNumber;
  @override
  String? get photo;
  @override
  String get orderId;
  @override
  String get outletId;
  @override
  String? get externalId;
  @override
  String? get approvalCode;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CancelOrderResponse _$CancelOrderResponseFromJson(Map<String, dynamic> json) {
  return _CancelOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$CancelOrderResponse {
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
  String get cashierId => throw _privateConstructorUsedError;
  String? get closedAt => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CancelOrderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CancelOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CancelOrderResponseCopyWith<CancelOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelOrderResponseCopyWith<$Res> {
  factory $CancelOrderResponseCopyWith(
          CancelOrderResponse value, $Res Function(CancelOrderResponse) then) =
      _$CancelOrderResponseCopyWithImpl<$Res, CancelOrderResponse>;
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
      String? tableId,
      String cashierId,
      String? closedAt,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$CancelOrderResponseCopyWithImpl<$Res, $Val extends CancelOrderResponse>
    implements $CancelOrderResponseCopyWith<$Res> {
  _$CancelOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CancelOrderResponse
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
    Object? cashierId = null,
    Object? closedAt = freezed,
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
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$CancelOrderResponseImplCopyWith<$Res>
    implements $CancelOrderResponseCopyWith<$Res> {
  factory _$$CancelOrderResponseImplCopyWith(_$CancelOrderResponseImpl value,
          $Res Function(_$CancelOrderResponseImpl) then) =
      __$$CancelOrderResponseImplCopyWithImpl<$Res>;
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
      String? tableId,
      String cashierId,
      String? closedAt,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$CancelOrderResponseImplCopyWithImpl<$Res>
    extends _$CancelOrderResponseCopyWithImpl<$Res, _$CancelOrderResponseImpl>
    implements _$$CancelOrderResponseImplCopyWith<$Res> {
  __$$CancelOrderResponseImplCopyWithImpl(_$CancelOrderResponseImpl _value,
      $Res Function(_$CancelOrderResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CancelOrderResponse
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
    Object? cashierId = null,
    Object? closedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CancelOrderResponseImpl(
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
      cashierId: null == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$CancelOrderResponseImpl implements _CancelOrderResponse {
  const _$CancelOrderResponseImpl(
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
      this.tableId,
      required this.cashierId,
      this.closedAt,
      required this.createdAt,
      required this.updatedAt});

  factory _$CancelOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelOrderResponseImplFromJson(json);

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
  final String cashierId;
  @override
  final String? closedAt;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'CancelOrderResponse(id: $id, no: $no, status: $status, price: $price, customerId: $customerId, paymentStatus: $paymentStatus, customerType: $customerType, type: $type, source: $source, outletId: $outletId, tableId: $tableId, cashierId: $cashierId, closedAt: $closedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelOrderResponseImpl &&
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
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.cashierId, cashierId) ||
                other.cashierId == cashierId) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
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
      status,
      price,
      customerId,
      paymentStatus,
      customerType,
      type,
      source,
      outletId,
      tableId,
      cashierId,
      closedAt,
      createdAt,
      updatedAt);

  /// Create a copy of CancelOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelOrderResponseImplCopyWith<_$CancelOrderResponseImpl> get copyWith =>
      __$$CancelOrderResponseImplCopyWithImpl<_$CancelOrderResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _CancelOrderResponse implements CancelOrderResponse {
  const factory _CancelOrderResponse(
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
      final String? tableId,
      required final String cashierId,
      final String? closedAt,
      required final String createdAt,
      required final String updatedAt}) = _$CancelOrderResponseImpl;

  factory _CancelOrderResponse.fromJson(Map<String, dynamic> json) =
      _$CancelOrderResponseImpl.fromJson;

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
  @override
  String get cashierId;
  @override
  String? get closedAt;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of CancelOrderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelOrderResponseImplCopyWith<_$CancelOrderResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
