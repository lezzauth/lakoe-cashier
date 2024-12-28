// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseDetail _$PurchaseDetailFromJson(Map<String, dynamic> json) {
  return _PurchaseDetail.fromJson(json);
}

/// @nodoc
mixin _$PurchaseDetail {
  PurchaseModel get purchaseResult => throw _privateConstructorUsedError;
  PaymentRequest get paymentRequest => throw _privateConstructorUsedError;

  /// Serializes this PurchaseDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseDetailCopyWith<PurchaseDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseDetailCopyWith<$Res> {
  factory $PurchaseDetailCopyWith(
          PurchaseDetail value, $Res Function(PurchaseDetail) then) =
      _$PurchaseDetailCopyWithImpl<$Res, PurchaseDetail>;
  @useResult
  $Res call({PurchaseModel purchaseResult, PaymentRequest paymentRequest});

  $PurchaseModelCopyWith<$Res> get purchaseResult;
  $PaymentRequestCopyWith<$Res> get paymentRequest;
}

/// @nodoc
class _$PurchaseDetailCopyWithImpl<$Res, $Val extends PurchaseDetail>
    implements $PurchaseDetailCopyWith<$Res> {
  _$PurchaseDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseResult = null,
    Object? paymentRequest = null,
  }) {
    return _then(_value.copyWith(
      purchaseResult: null == purchaseResult
          ? _value.purchaseResult
          : purchaseResult // ignore: cast_nullable_to_non_nullable
              as PurchaseModel,
      paymentRequest: null == paymentRequest
          ? _value.paymentRequest
          : paymentRequest // ignore: cast_nullable_to_non_nullable
              as PaymentRequest,
    ) as $Val);
  }

  /// Create a copy of PurchaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseModelCopyWith<$Res> get purchaseResult {
    return $PurchaseModelCopyWith<$Res>(_value.purchaseResult, (value) {
      return _then(_value.copyWith(purchaseResult: value) as $Val);
    });
  }

  /// Create a copy of PurchaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentRequestCopyWith<$Res> get paymentRequest {
    return $PaymentRequestCopyWith<$Res>(_value.paymentRequest, (value) {
      return _then(_value.copyWith(paymentRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseDetailImplCopyWith<$Res>
    implements $PurchaseDetailCopyWith<$Res> {
  factory _$$PurchaseDetailImplCopyWith(_$PurchaseDetailImpl value,
          $Res Function(_$PurchaseDetailImpl) then) =
      __$$PurchaseDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PurchaseModel purchaseResult, PaymentRequest paymentRequest});

  @override
  $PurchaseModelCopyWith<$Res> get purchaseResult;
  @override
  $PaymentRequestCopyWith<$Res> get paymentRequest;
}

/// @nodoc
class __$$PurchaseDetailImplCopyWithImpl<$Res>
    extends _$PurchaseDetailCopyWithImpl<$Res, _$PurchaseDetailImpl>
    implements _$$PurchaseDetailImplCopyWith<$Res> {
  __$$PurchaseDetailImplCopyWithImpl(
      _$PurchaseDetailImpl _value, $Res Function(_$PurchaseDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseResult = null,
    Object? paymentRequest = null,
  }) {
    return _then(_$PurchaseDetailImpl(
      purchaseResult: null == purchaseResult
          ? _value.purchaseResult
          : purchaseResult // ignore: cast_nullable_to_non_nullable
              as PurchaseModel,
      paymentRequest: null == paymentRequest
          ? _value.paymentRequest
          : paymentRequest // ignore: cast_nullable_to_non_nullable
              as PaymentRequest,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseDetailImpl implements _PurchaseDetail {
  const _$PurchaseDetailImpl(
      {required this.purchaseResult, required this.paymentRequest});

  factory _$PurchaseDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseDetailImplFromJson(json);

  @override
  final PurchaseModel purchaseResult;
  @override
  final PaymentRequest paymentRequest;

  @override
  String toString() {
    return 'PurchaseDetail(purchaseResult: $purchaseResult, paymentRequest: $paymentRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseDetailImpl &&
            (identical(other.purchaseResult, purchaseResult) ||
                other.purchaseResult == purchaseResult) &&
            (identical(other.paymentRequest, paymentRequest) ||
                other.paymentRequest == paymentRequest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, purchaseResult, paymentRequest);

  /// Create a copy of PurchaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseDetailImplCopyWith<_$PurchaseDetailImpl> get copyWith =>
      __$$PurchaseDetailImplCopyWithImpl<_$PurchaseDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseDetailImplToJson(
      this,
    );
  }
}

abstract class _PurchaseDetail implements PurchaseDetail {
  const factory _PurchaseDetail(
      {required final PurchaseModel purchaseResult,
      required final PaymentRequest paymentRequest}) = _$PurchaseDetailImpl;

  factory _PurchaseDetail.fromJson(Map<String, dynamic> json) =
      _$PurchaseDetailImpl.fromJson;

  @override
  PurchaseModel get purchaseResult;
  @override
  PaymentRequest get paymentRequest;

  /// Create a copy of PurchaseDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseDetailImplCopyWith<_$PurchaseDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FindAllPurchaseDto {
  String? get status => throw _privateConstructorUsedError;

  /// Create a copy of FindAllPurchaseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindAllPurchaseDtoCopyWith<FindAllPurchaseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllPurchaseDtoCopyWith<$Res> {
  factory $FindAllPurchaseDtoCopyWith(
          FindAllPurchaseDto value, $Res Function(FindAllPurchaseDto) then) =
      _$FindAllPurchaseDtoCopyWithImpl<$Res, FindAllPurchaseDto>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class _$FindAllPurchaseDtoCopyWithImpl<$Res, $Val extends FindAllPurchaseDto>
    implements $FindAllPurchaseDtoCopyWith<$Res> {
  _$FindAllPurchaseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindAllPurchaseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindAllPurchaseDtoImplCopyWith<$Res>
    implements $FindAllPurchaseDtoCopyWith<$Res> {
  factory _$$FindAllPurchaseDtoImplCopyWith(_$FindAllPurchaseDtoImpl value,
          $Res Function(_$FindAllPurchaseDtoImpl) then) =
      __$$FindAllPurchaseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$FindAllPurchaseDtoImplCopyWithImpl<$Res>
    extends _$FindAllPurchaseDtoCopyWithImpl<$Res, _$FindAllPurchaseDtoImpl>
    implements _$$FindAllPurchaseDtoImplCopyWith<$Res> {
  __$$FindAllPurchaseDtoImplCopyWithImpl(_$FindAllPurchaseDtoImpl _value,
      $Res Function(_$FindAllPurchaseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindAllPurchaseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$FindAllPurchaseDtoImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FindAllPurchaseDtoImpl implements _FindAllPurchaseDto {
  const _$FindAllPurchaseDtoImpl({this.status});

  @override
  final String? status;

  @override
  String toString() {
    return 'FindAllPurchaseDto(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllPurchaseDtoImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of FindAllPurchaseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllPurchaseDtoImplCopyWith<_$FindAllPurchaseDtoImpl> get copyWith =>
      __$$FindAllPurchaseDtoImplCopyWithImpl<_$FindAllPurchaseDtoImpl>(
          this, _$identity);
}

abstract class _FindAllPurchaseDto implements FindAllPurchaseDto {
  const factory _FindAllPurchaseDto({final String? status}) =
      _$FindAllPurchaseDtoImpl;

  @override
  String? get status;

  /// Create a copy of FindAllPurchaseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindAllPurchaseDtoImplCopyWith<_$FindAllPurchaseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) {
  return _PurchaseModel.fromJson(json);
}

/// @nodoc
mixin _$PurchaseModel {
  String get id => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get paidAmount => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  int get period => throw _privateConstructorUsedError;
  String get startPeriod => throw _privateConstructorUsedError;
  String get endPeriod => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String? get externalId => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PurchaseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseModelCopyWith<PurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseModelCopyWith<$Res> {
  factory $PurchaseModelCopyWith(
          PurchaseModel value, $Res Function(PurchaseModel) then) =
      _$PurchaseModelCopyWithImpl<$Res, PurchaseModel>;
  @useResult
  $Res call(
      {String id,
      String paymentMethod,
      String status,
      String paidAmount,
      String amount,
      int period,
      String startPeriod,
      String endPeriod,
      String ownerId,
      String? externalId,
      String packageName,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$PurchaseModelCopyWithImpl<$Res, $Val extends PurchaseModel>
    implements $PurchaseModelCopyWith<$Res> {
  _$PurchaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? paidAmount = null,
    Object? amount = null,
    Object? period = null,
    Object? startPeriod = null,
    Object? endPeriod = null,
    Object? ownerId = null,
    Object? externalId = freezed,
    Object? packageName = null,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      startPeriod: null == startPeriod
          ? _value.startPeriod
          : startPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      endPeriod: null == endPeriod
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PurchaseModelImplCopyWith<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  factory _$$PurchaseModelImplCopyWith(
          _$PurchaseModelImpl value, $Res Function(_$PurchaseModelImpl) then) =
      __$$PurchaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String paymentMethod,
      String status,
      String paidAmount,
      String amount,
      int period,
      String startPeriod,
      String endPeriod,
      String ownerId,
      String? externalId,
      String packageName,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$PurchaseModelImplCopyWithImpl<$Res>
    extends _$PurchaseModelCopyWithImpl<$Res, _$PurchaseModelImpl>
    implements _$$PurchaseModelImplCopyWith<$Res> {
  __$$PurchaseModelImplCopyWithImpl(
      _$PurchaseModelImpl _value, $Res Function(_$PurchaseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? paidAmount = null,
    Object? amount = null,
    Object? period = null,
    Object? startPeriod = null,
    Object? endPeriod = null,
    Object? ownerId = null,
    Object? externalId = freezed,
    Object? packageName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PurchaseModelImpl(
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      startPeriod: null == startPeriod
          ? _value.startPeriod
          : startPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      endPeriod: null == endPeriod
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
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
class _$PurchaseModelImpl implements _PurchaseModel {
  const _$PurchaseModelImpl(
      {required this.id,
      required this.paymentMethod,
      required this.status,
      required this.paidAmount,
      required this.amount,
      required this.period,
      required this.startPeriod,
      required this.endPeriod,
      required this.ownerId,
      this.externalId,
      required this.packageName,
      required this.createdAt,
      required this.updatedAt});

  factory _$PurchaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseModelImplFromJson(json);

  @override
  final String id;
  @override
  final String paymentMethod;
  @override
  final String status;
  @override
  final String paidAmount;
  @override
  final String amount;
  @override
  final int period;
  @override
  final String startPeriod;
  @override
  final String endPeriod;
  @override
  final String ownerId;
  @override
  final String? externalId;
  @override
  final String packageName;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'PurchaseModel(id: $id, paymentMethod: $paymentMethod, status: $status, paidAmount: $paidAmount, amount: $amount, period: $period, startPeriod: $startPeriod, endPeriod: $endPeriod, ownerId: $ownerId, externalId: $externalId, packageName: $packageName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.startPeriod, startPeriod) ||
                other.startPeriod == startPeriod) &&
            (identical(other.endPeriod, endPeriod) ||
                other.endPeriod == endPeriod) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
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
      amount,
      period,
      startPeriod,
      endPeriod,
      ownerId,
      externalId,
      packageName,
      createdAt,
      updatedAt);

  /// Create a copy of PurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseModelImplCopyWith<_$PurchaseModelImpl> get copyWith =>
      __$$PurchaseModelImplCopyWithImpl<_$PurchaseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseModelImplToJson(
      this,
    );
  }
}

abstract class _PurchaseModel implements PurchaseModel {
  const factory _PurchaseModel(
      {required final String id,
      required final String paymentMethod,
      required final String status,
      required final String paidAmount,
      required final String amount,
      required final int period,
      required final String startPeriod,
      required final String endPeriod,
      required final String ownerId,
      final String? externalId,
      required final String packageName,
      required final String createdAt,
      required final String updatedAt}) = _$PurchaseModelImpl;

  factory _PurchaseModel.fromJson(Map<String, dynamic> json) =
      _$PurchaseModelImpl.fromJson;

  @override
  String get id;
  @override
  String get paymentMethod;
  @override
  String get status;
  @override
  String get paidAmount;
  @override
  String get amount;
  @override
  int get period;
  @override
  String get startPeriod;
  @override
  String get endPeriod;
  @override
  String get ownerId;
  @override
  String? get externalId;
  @override
  String get packageName;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of PurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseModelImplCopyWith<_$PurchaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) {
  return _PaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$PaymentRequest {
  String get id => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;
  String get updated => throw _privateConstructorUsedError;
  String get referenceId => throw _privateConstructorUsedError;
  String get businessId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  String get captureMethod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<ActionPayment> get actions => throw _privateConstructorUsedError;
  List<Item>? get items => throw _privateConstructorUsedError;

  /// Serializes this PaymentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentRequestCopyWith<PaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRequestCopyWith<$Res> {
  factory $PaymentRequestCopyWith(
          PaymentRequest value, $Res Function(PaymentRequest) then) =
      _$PaymentRequestCopyWithImpl<$Res, PaymentRequest>;
  @useResult
  $Res call(
      {String id,
      String created,
      String updated,
      String referenceId,
      String businessId,
      int amount,
      String country,
      String currency,
      PaymentMethod paymentMethod,
      String captureMethod,
      String status,
      List<ActionPayment> actions,
      List<Item>? items});

  $PaymentMethodCopyWith<$Res> get paymentMethod;
}

/// @nodoc
class _$PaymentRequestCopyWithImpl<$Res, $Val extends PaymentRequest>
    implements $PaymentRequestCopyWith<$Res> {
  _$PaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? updated = null,
    Object? referenceId = null,
    Object? businessId = null,
    Object? amount = null,
    Object? country = null,
    Object? currency = null,
    Object? paymentMethod = null,
    Object? captureMethod = null,
    Object? status = null,
    Object? actions = null,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      captureMethod: null == captureMethod
          ? _value.captureMethod
          : captureMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<ActionPayment>,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ) as $Val);
  }

  /// Create a copy of PaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res> get paymentMethod {
    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentRequestImplCopyWith<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  factory _$$PaymentRequestImplCopyWith(_$PaymentRequestImpl value,
          $Res Function(_$PaymentRequestImpl) then) =
      __$$PaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String created,
      String updated,
      String referenceId,
      String businessId,
      int amount,
      String country,
      String currency,
      PaymentMethod paymentMethod,
      String captureMethod,
      String status,
      List<ActionPayment> actions,
      List<Item>? items});

  @override
  $PaymentMethodCopyWith<$Res> get paymentMethod;
}

/// @nodoc
class __$$PaymentRequestImplCopyWithImpl<$Res>
    extends _$PaymentRequestCopyWithImpl<$Res, _$PaymentRequestImpl>
    implements _$$PaymentRequestImplCopyWith<$Res> {
  __$$PaymentRequestImplCopyWithImpl(
      _$PaymentRequestImpl _value, $Res Function(_$PaymentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? updated = null,
    Object? referenceId = null,
    Object? businessId = null,
    Object? amount = null,
    Object? country = null,
    Object? currency = null,
    Object? paymentMethod = null,
    Object? captureMethod = null,
    Object? status = null,
    Object? actions = null,
    Object? items = freezed,
  }) {
    return _then(_$PaymentRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: null == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      captureMethod: null == captureMethod
          ? _value.captureMethod
          : captureMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<ActionPayment>,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentRequestImpl implements _PaymentRequest {
  const _$PaymentRequestImpl(
      {required this.id,
      required this.created,
      required this.updated,
      required this.referenceId,
      required this.businessId,
      required this.amount,
      required this.country,
      required this.currency,
      required this.paymentMethod,
      required this.captureMethod,
      required this.status,
      required final List<ActionPayment> actions,
      final List<Item>? items})
      : _actions = actions,
        _items = items;

  factory _$PaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String created;
  @override
  final String updated;
  @override
  final String referenceId;
  @override
  final String businessId;
  @override
  final int amount;
  @override
  final String country;
  @override
  final String currency;
  @override
  final PaymentMethod paymentMethod;
  @override
  final String captureMethod;
  @override
  final String status;
  final List<ActionPayment> _actions;
  @override
  List<ActionPayment> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  final List<Item>? _items;
  @override
  List<Item>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaymentRequest(id: $id, created: $created, updated: $updated, referenceId: $referenceId, businessId: $businessId, amount: $amount, country: $country, currency: $currency, paymentMethod: $paymentMethod, captureMethod: $captureMethod, status: $status, actions: $actions, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.captureMethod, captureMethod) ||
                other.captureMethod == captureMethod) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      created,
      updated,
      referenceId,
      businessId,
      amount,
      country,
      currency,
      paymentMethod,
      captureMethod,
      status,
      const DeepCollectionEquality().hash(_actions),
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of PaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentRequestImplCopyWith<_$PaymentRequestImpl> get copyWith =>
      __$$PaymentRequestImplCopyWithImpl<_$PaymentRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentRequestImplToJson(
      this,
    );
  }
}

abstract class _PaymentRequest implements PaymentRequest {
  const factory _PaymentRequest(
      {required final String id,
      required final String created,
      required final String updated,
      required final String referenceId,
      required final String businessId,
      required final int amount,
      required final String country,
      required final String currency,
      required final PaymentMethod paymentMethod,
      required final String captureMethod,
      required final String status,
      required final List<ActionPayment> actions,
      final List<Item>? items}) = _$PaymentRequestImpl;

  factory _PaymentRequest.fromJson(Map<String, dynamic> json) =
      _$PaymentRequestImpl.fromJson;

  @override
  String get id;
  @override
  String get created;
  @override
  String get updated;
  @override
  String get referenceId;
  @override
  String get businessId;
  @override
  int get amount;
  @override
  String get country;
  @override
  String get currency;
  @override
  PaymentMethod get paymentMethod;
  @override
  String get captureMethod;
  @override
  String get status;
  @override
  List<ActionPayment> get actions;
  @override
  List<Item>? get items;

  /// Create a copy of PaymentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentRequestImplCopyWith<_$PaymentRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;
  String get updated => throw _privateConstructorUsedError;
  String get referenceId => throw _privateConstructorUsedError;
  Ewallet? get ewallet => throw _privateConstructorUsedError;
  VirtualAccount? get virtualAccount => throw _privateConstructorUsedError;
  String get reusability => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call(
      {String id,
      String type,
      String created,
      String updated,
      String referenceId,
      Ewallet? ewallet,
      VirtualAccount? virtualAccount,
      String reusability,
      String status});

  $EwalletCopyWith<$Res>? get ewallet;
  $VirtualAccountCopyWith<$Res>? get virtualAccount;
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? created = null,
    Object? updated = null,
    Object? referenceId = null,
    Object? ewallet = freezed,
    Object? virtualAccount = freezed,
    Object? reusability = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      ewallet: freezed == ewallet
          ? _value.ewallet
          : ewallet // ignore: cast_nullable_to_non_nullable
              as Ewallet?,
      virtualAccount: freezed == virtualAccount
          ? _value.virtualAccount
          : virtualAccount // ignore: cast_nullable_to_non_nullable
              as VirtualAccount?,
      reusability: null == reusability
          ? _value.reusability
          : reusability // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EwalletCopyWith<$Res>? get ewallet {
    if (_value.ewallet == null) {
      return null;
    }

    return $EwalletCopyWith<$Res>(_value.ewallet!, (value) {
      return _then(_value.copyWith(ewallet: value) as $Val);
    });
  }

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VirtualAccountCopyWith<$Res>? get virtualAccount {
    if (_value.virtualAccount == null) {
      return null;
    }

    return $VirtualAccountCopyWith<$Res>(_value.virtualAccount!, (value) {
      return _then(_value.copyWith(virtualAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String created,
      String updated,
      String referenceId,
      Ewallet? ewallet,
      VirtualAccount? virtualAccount,
      String reusability,
      String status});

  @override
  $EwalletCopyWith<$Res>? get ewallet;
  @override
  $VirtualAccountCopyWith<$Res>? get virtualAccount;
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? created = null,
    Object? updated = null,
    Object? referenceId = null,
    Object? ewallet = freezed,
    Object? virtualAccount = freezed,
    Object? reusability = null,
    Object? status = null,
  }) {
    return _then(_$PaymentMethodImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      ewallet: freezed == ewallet
          ? _value.ewallet
          : ewallet // ignore: cast_nullable_to_non_nullable
              as Ewallet?,
      virtualAccount: freezed == virtualAccount
          ? _value.virtualAccount
          : virtualAccount // ignore: cast_nullable_to_non_nullable
              as VirtualAccount?,
      reusability: null == reusability
          ? _value.reusability
          : reusability // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl implements _PaymentMethod {
  const _$PaymentMethodImpl(
      {required this.id,
      required this.type,
      required this.created,
      required this.updated,
      required this.referenceId,
      this.ewallet,
      this.virtualAccount,
      required this.reusability,
      required this.status});

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String created;
  @override
  final String updated;
  @override
  final String referenceId;
  @override
  final Ewallet? ewallet;
  @override
  final VirtualAccount? virtualAccount;
  @override
  final String reusability;
  @override
  final String status;

  @override
  String toString() {
    return 'PaymentMethod(id: $id, type: $type, created: $created, updated: $updated, referenceId: $referenceId, ewallet: $ewallet, virtualAccount: $virtualAccount, reusability: $reusability, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.ewallet, ewallet) || other.ewallet == ewallet) &&
            (identical(other.virtualAccount, virtualAccount) ||
                other.virtualAccount == virtualAccount) &&
            (identical(other.reusability, reusability) ||
                other.reusability == reusability) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, created, updated,
      referenceId, ewallet, virtualAccount, reusability, status);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod(
      {required final String id,
      required final String type,
      required final String created,
      required final String updated,
      required final String referenceId,
      final Ewallet? ewallet,
      final VirtualAccount? virtualAccount,
      required final String reusability,
      required final String status}) = _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get created;
  @override
  String get updated;
  @override
  String get referenceId;
  @override
  Ewallet? get ewallet;
  @override
  VirtualAccount? get virtualAccount;
  @override
  String get reusability;
  @override
  String get status;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ewallet _$EwalletFromJson(Map<String, dynamic> json) {
  return _Ewallet.fromJson(json);
}

/// @nodoc
mixin _$Ewallet {
  String get channelCode => throw _privateConstructorUsedError;
  ChannelProperties get channelProperties => throw _privateConstructorUsedError;
  Map<String, dynamic>? get account => throw _privateConstructorUsedError;

  /// Serializes this Ewallet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ewallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EwalletCopyWith<Ewallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EwalletCopyWith<$Res> {
  factory $EwalletCopyWith(Ewallet value, $Res Function(Ewallet) then) =
      _$EwalletCopyWithImpl<$Res, Ewallet>;
  @useResult
  $Res call(
      {String channelCode,
      ChannelProperties channelProperties,
      Map<String, dynamic>? account});

  $ChannelPropertiesCopyWith<$Res> get channelProperties;
}

/// @nodoc
class _$EwalletCopyWithImpl<$Res, $Val extends Ewallet>
    implements $EwalletCopyWith<$Res> {
  _$EwalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ewallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelCode = null,
    Object? channelProperties = null,
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      channelCode: null == channelCode
          ? _value.channelCode
          : channelCode // ignore: cast_nullable_to_non_nullable
              as String,
      channelProperties: null == channelProperties
          ? _value.channelProperties
          : channelProperties // ignore: cast_nullable_to_non_nullable
              as ChannelProperties,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  /// Create a copy of Ewallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPropertiesCopyWith<$Res> get channelProperties {
    return $ChannelPropertiesCopyWith<$Res>(_value.channelProperties, (value) {
      return _then(_value.copyWith(channelProperties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EwalletImplCopyWith<$Res> implements $EwalletCopyWith<$Res> {
  factory _$$EwalletImplCopyWith(
          _$EwalletImpl value, $Res Function(_$EwalletImpl) then) =
      __$$EwalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String channelCode,
      ChannelProperties channelProperties,
      Map<String, dynamic>? account});

  @override
  $ChannelPropertiesCopyWith<$Res> get channelProperties;
}

/// @nodoc
class __$$EwalletImplCopyWithImpl<$Res>
    extends _$EwalletCopyWithImpl<$Res, _$EwalletImpl>
    implements _$$EwalletImplCopyWith<$Res> {
  __$$EwalletImplCopyWithImpl(
      _$EwalletImpl _value, $Res Function(_$EwalletImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ewallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelCode = null,
    Object? channelProperties = null,
    Object? account = freezed,
  }) {
    return _then(_$EwalletImpl(
      channelCode: null == channelCode
          ? _value.channelCode
          : channelCode // ignore: cast_nullable_to_non_nullable
              as String,
      channelProperties: null == channelProperties
          ? _value.channelProperties
          : channelProperties // ignore: cast_nullable_to_non_nullable
              as ChannelProperties,
      account: freezed == account
          ? _value._account
          : account // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EwalletImpl implements _Ewallet {
  const _$EwalletImpl(
      {required this.channelCode,
      required this.channelProperties,
      final Map<String, dynamic>? account})
      : _account = account;

  factory _$EwalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$EwalletImplFromJson(json);

  @override
  final String channelCode;
  @override
  final ChannelProperties channelProperties;
  final Map<String, dynamic>? _account;
  @override
  Map<String, dynamic>? get account {
    final value = _account;
    if (value == null) return null;
    if (_account is EqualUnmodifiableMapView) return _account;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Ewallet(channelCode: $channelCode, channelProperties: $channelProperties, account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EwalletImpl &&
            (identical(other.channelCode, channelCode) ||
                other.channelCode == channelCode) &&
            (identical(other.channelProperties, channelProperties) ||
                other.channelProperties == channelProperties) &&
            const DeepCollectionEquality().equals(other._account, _account));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, channelCode, channelProperties,
      const DeepCollectionEquality().hash(_account));

  /// Create a copy of Ewallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EwalletImplCopyWith<_$EwalletImpl> get copyWith =>
      __$$EwalletImplCopyWithImpl<_$EwalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EwalletImplToJson(
      this,
    );
  }
}

abstract class _Ewallet implements Ewallet {
  const factory _Ewallet(
      {required final String channelCode,
      required final ChannelProperties channelProperties,
      final Map<String, dynamic>? account}) = _$EwalletImpl;

  factory _Ewallet.fromJson(Map<String, dynamic> json) = _$EwalletImpl.fromJson;

  @override
  String get channelCode;
  @override
  ChannelProperties get channelProperties;
  @override
  Map<String, dynamic>? get account;

  /// Create a copy of Ewallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EwalletImplCopyWith<_$EwalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VirtualAccount _$VirtualAccountFromJson(Map<String, dynamic> json) {
  return _VirtualAccount.fromJson(json);
}

/// @nodoc
mixin _$VirtualAccount {
  int get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get channelCode => throw _privateConstructorUsedError;
  VirtualAccountChannelProperties get channelProperties =>
      throw _privateConstructorUsedError;

  /// Serializes this VirtualAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VirtualAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VirtualAccountCopyWith<VirtualAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VirtualAccountCopyWith<$Res> {
  factory $VirtualAccountCopyWith(
          VirtualAccount value, $Res Function(VirtualAccount) then) =
      _$VirtualAccountCopyWithImpl<$Res, VirtualAccount>;
  @useResult
  $Res call(
      {int amount,
      String currency,
      String channelCode,
      VirtualAccountChannelProperties channelProperties});

  $VirtualAccountChannelPropertiesCopyWith<$Res> get channelProperties;
}

/// @nodoc
class _$VirtualAccountCopyWithImpl<$Res, $Val extends VirtualAccount>
    implements $VirtualAccountCopyWith<$Res> {
  _$VirtualAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VirtualAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? channelCode = null,
    Object? channelProperties = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      channelCode: null == channelCode
          ? _value.channelCode
          : channelCode // ignore: cast_nullable_to_non_nullable
              as String,
      channelProperties: null == channelProperties
          ? _value.channelProperties
          : channelProperties // ignore: cast_nullable_to_non_nullable
              as VirtualAccountChannelProperties,
    ) as $Val);
  }

  /// Create a copy of VirtualAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VirtualAccountChannelPropertiesCopyWith<$Res> get channelProperties {
    return $VirtualAccountChannelPropertiesCopyWith<$Res>(
        _value.channelProperties, (value) {
      return _then(_value.copyWith(channelProperties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VirtualAccountImplCopyWith<$Res>
    implements $VirtualAccountCopyWith<$Res> {
  factory _$$VirtualAccountImplCopyWith(_$VirtualAccountImpl value,
          $Res Function(_$VirtualAccountImpl) then) =
      __$$VirtualAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int amount,
      String currency,
      String channelCode,
      VirtualAccountChannelProperties channelProperties});

  @override
  $VirtualAccountChannelPropertiesCopyWith<$Res> get channelProperties;
}

/// @nodoc
class __$$VirtualAccountImplCopyWithImpl<$Res>
    extends _$VirtualAccountCopyWithImpl<$Res, _$VirtualAccountImpl>
    implements _$$VirtualAccountImplCopyWith<$Res> {
  __$$VirtualAccountImplCopyWithImpl(
      _$VirtualAccountImpl _value, $Res Function(_$VirtualAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of VirtualAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? channelCode = null,
    Object? channelProperties = null,
  }) {
    return _then(_$VirtualAccountImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      channelCode: null == channelCode
          ? _value.channelCode
          : channelCode // ignore: cast_nullable_to_non_nullable
              as String,
      channelProperties: null == channelProperties
          ? _value.channelProperties
          : channelProperties // ignore: cast_nullable_to_non_nullable
              as VirtualAccountChannelProperties,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VirtualAccountImpl implements _VirtualAccount {
  const _$VirtualAccountImpl(
      {required this.amount,
      required this.currency,
      required this.channelCode,
      required this.channelProperties});

  factory _$VirtualAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$VirtualAccountImplFromJson(json);

  @override
  final int amount;
  @override
  final String currency;
  @override
  final String channelCode;
  @override
  final VirtualAccountChannelProperties channelProperties;

  @override
  String toString() {
    return 'VirtualAccount(amount: $amount, currency: $currency, channelCode: $channelCode, channelProperties: $channelProperties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VirtualAccountImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.channelCode, channelCode) ||
                other.channelCode == channelCode) &&
            (identical(other.channelProperties, channelProperties) ||
                other.channelProperties == channelProperties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, amount, currency, channelCode, channelProperties);

  /// Create a copy of VirtualAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VirtualAccountImplCopyWith<_$VirtualAccountImpl> get copyWith =>
      __$$VirtualAccountImplCopyWithImpl<_$VirtualAccountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VirtualAccountImplToJson(
      this,
    );
  }
}

abstract class _VirtualAccount implements VirtualAccount {
  const factory _VirtualAccount(
          {required final int amount,
          required final String currency,
          required final String channelCode,
          required final VirtualAccountChannelProperties channelProperties}) =
      _$VirtualAccountImpl;

  factory _VirtualAccount.fromJson(Map<String, dynamic> json) =
      _$VirtualAccountImpl.fromJson;

  @override
  int get amount;
  @override
  String get currency;
  @override
  String get channelCode;
  @override
  VirtualAccountChannelProperties get channelProperties;

  /// Create a copy of VirtualAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VirtualAccountImplCopyWith<_$VirtualAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelProperties _$ChannelPropertiesFromJson(Map<String, dynamic> json) {
  return _ChannelProperties.fromJson(json);
}

/// @nodoc
mixin _$ChannelProperties {
  String get successReturnUrl => throw _privateConstructorUsedError;
  String? get failureReturnUrl => throw _privateConstructorUsedError;

  /// Serializes this ChannelProperties to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelPropertiesCopyWith<ChannelProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelPropertiesCopyWith<$Res> {
  factory $ChannelPropertiesCopyWith(
          ChannelProperties value, $Res Function(ChannelProperties) then) =
      _$ChannelPropertiesCopyWithImpl<$Res, ChannelProperties>;
  @useResult
  $Res call({String successReturnUrl, String? failureReturnUrl});
}

/// @nodoc
class _$ChannelPropertiesCopyWithImpl<$Res, $Val extends ChannelProperties>
    implements $ChannelPropertiesCopyWith<$Res> {
  _$ChannelPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successReturnUrl = null,
    Object? failureReturnUrl = freezed,
  }) {
    return _then(_value.copyWith(
      successReturnUrl: null == successReturnUrl
          ? _value.successReturnUrl
          : successReturnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      failureReturnUrl: freezed == failureReturnUrl
          ? _value.failureReturnUrl
          : failureReturnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelPropertiesImplCopyWith<$Res>
    implements $ChannelPropertiesCopyWith<$Res> {
  factory _$$ChannelPropertiesImplCopyWith(_$ChannelPropertiesImpl value,
          $Res Function(_$ChannelPropertiesImpl) then) =
      __$$ChannelPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String successReturnUrl, String? failureReturnUrl});
}

/// @nodoc
class __$$ChannelPropertiesImplCopyWithImpl<$Res>
    extends _$ChannelPropertiesCopyWithImpl<$Res, _$ChannelPropertiesImpl>
    implements _$$ChannelPropertiesImplCopyWith<$Res> {
  __$$ChannelPropertiesImplCopyWithImpl(_$ChannelPropertiesImpl _value,
      $Res Function(_$ChannelPropertiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successReturnUrl = null,
    Object? failureReturnUrl = freezed,
  }) {
    return _then(_$ChannelPropertiesImpl(
      successReturnUrl: null == successReturnUrl
          ? _value.successReturnUrl
          : successReturnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      failureReturnUrl: freezed == failureReturnUrl
          ? _value.failureReturnUrl
          : failureReturnUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelPropertiesImpl implements _ChannelProperties {
  const _$ChannelPropertiesImpl(
      {required this.successReturnUrl, this.failureReturnUrl});

  factory _$ChannelPropertiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelPropertiesImplFromJson(json);

  @override
  final String successReturnUrl;
  @override
  final String? failureReturnUrl;

  @override
  String toString() {
    return 'ChannelProperties(successReturnUrl: $successReturnUrl, failureReturnUrl: $failureReturnUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelPropertiesImpl &&
            (identical(other.successReturnUrl, successReturnUrl) ||
                other.successReturnUrl == successReturnUrl) &&
            (identical(other.failureReturnUrl, failureReturnUrl) ||
                other.failureReturnUrl == failureReturnUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, successReturnUrl, failureReturnUrl);

  /// Create a copy of ChannelProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelPropertiesImplCopyWith<_$ChannelPropertiesImpl> get copyWith =>
      __$$ChannelPropertiesImplCopyWithImpl<_$ChannelPropertiesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelPropertiesImplToJson(
      this,
    );
  }
}

abstract class _ChannelProperties implements ChannelProperties {
  const factory _ChannelProperties(
      {required final String successReturnUrl,
      final String? failureReturnUrl}) = _$ChannelPropertiesImpl;

  factory _ChannelProperties.fromJson(Map<String, dynamic> json) =
      _$ChannelPropertiesImpl.fromJson;

  @override
  String get successReturnUrl;
  @override
  String? get failureReturnUrl;

  /// Create a copy of ChannelProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelPropertiesImplCopyWith<_$ChannelPropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VirtualAccountChannelProperties _$VirtualAccountChannelPropertiesFromJson(
    Map<String, dynamic> json) {
  return _VirtualAccountChannelProperties.fromJson(json);
}

/// @nodoc
mixin _$VirtualAccountChannelProperties {
  String get customerName => throw _privateConstructorUsedError;
  String get virtualAccountNumber => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this VirtualAccountChannelProperties to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VirtualAccountChannelProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VirtualAccountChannelPropertiesCopyWith<VirtualAccountChannelProperties>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VirtualAccountChannelPropertiesCopyWith<$Res> {
  factory $VirtualAccountChannelPropertiesCopyWith(
          VirtualAccountChannelProperties value,
          $Res Function(VirtualAccountChannelProperties) then) =
      _$VirtualAccountChannelPropertiesCopyWithImpl<$Res,
          VirtualAccountChannelProperties>;
  @useResult
  $Res call(
      {String customerName, String virtualAccountNumber, DateTime expiresAt});
}

/// @nodoc
class _$VirtualAccountChannelPropertiesCopyWithImpl<$Res,
        $Val extends VirtualAccountChannelProperties>
    implements $VirtualAccountChannelPropertiesCopyWith<$Res> {
  _$VirtualAccountChannelPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VirtualAccountChannelProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? virtualAccountNumber = null,
    Object? expiresAt = null,
  }) {
    return _then(_value.copyWith(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      virtualAccountNumber: null == virtualAccountNumber
          ? _value.virtualAccountNumber
          : virtualAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VirtualAccountChannelPropertiesImplCopyWith<$Res>
    implements $VirtualAccountChannelPropertiesCopyWith<$Res> {
  factory _$$VirtualAccountChannelPropertiesImplCopyWith(
          _$VirtualAccountChannelPropertiesImpl value,
          $Res Function(_$VirtualAccountChannelPropertiesImpl) then) =
      __$$VirtualAccountChannelPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerName, String virtualAccountNumber, DateTime expiresAt});
}

/// @nodoc
class __$$VirtualAccountChannelPropertiesImplCopyWithImpl<$Res>
    extends _$VirtualAccountChannelPropertiesCopyWithImpl<$Res,
        _$VirtualAccountChannelPropertiesImpl>
    implements _$$VirtualAccountChannelPropertiesImplCopyWith<$Res> {
  __$$VirtualAccountChannelPropertiesImplCopyWithImpl(
      _$VirtualAccountChannelPropertiesImpl _value,
      $Res Function(_$VirtualAccountChannelPropertiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of VirtualAccountChannelProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? virtualAccountNumber = null,
    Object? expiresAt = null,
  }) {
    return _then(_$VirtualAccountChannelPropertiesImpl(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      virtualAccountNumber: null == virtualAccountNumber
          ? _value.virtualAccountNumber
          : virtualAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VirtualAccountChannelPropertiesImpl
    implements _VirtualAccountChannelProperties {
  const _$VirtualAccountChannelPropertiesImpl(
      {required this.customerName,
      required this.virtualAccountNumber,
      required this.expiresAt});

  factory _$VirtualAccountChannelPropertiesImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VirtualAccountChannelPropertiesImplFromJson(json);

  @override
  final String customerName;
  @override
  final String virtualAccountNumber;
  @override
  final DateTime expiresAt;

  @override
  String toString() {
    return 'VirtualAccountChannelProperties(customerName: $customerName, virtualAccountNumber: $virtualAccountNumber, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VirtualAccountChannelPropertiesImpl &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.virtualAccountNumber, virtualAccountNumber) ||
                other.virtualAccountNumber == virtualAccountNumber) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, customerName, virtualAccountNumber, expiresAt);

  /// Create a copy of VirtualAccountChannelProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VirtualAccountChannelPropertiesImplCopyWith<
          _$VirtualAccountChannelPropertiesImpl>
      get copyWith => __$$VirtualAccountChannelPropertiesImplCopyWithImpl<
          _$VirtualAccountChannelPropertiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VirtualAccountChannelPropertiesImplToJson(
      this,
    );
  }
}

abstract class _VirtualAccountChannelProperties
    implements VirtualAccountChannelProperties {
  const factory _VirtualAccountChannelProperties(
          {required final String customerName,
          required final String virtualAccountNumber,
          required final DateTime expiresAt}) =
      _$VirtualAccountChannelPropertiesImpl;

  factory _VirtualAccountChannelProperties.fromJson(Map<String, dynamic> json) =
      _$VirtualAccountChannelPropertiesImpl.fromJson;

  @override
  String get customerName;
  @override
  String get virtualAccountNumber;
  @override
  DateTime get expiresAt;

  /// Create a copy of VirtualAccountChannelProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VirtualAccountChannelPropertiesImplCopyWith<
          _$VirtualAccountChannelPropertiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ActionPayment _$ActionPaymentFromJson(Map<String, dynamic> json) {
  return _ActionPayment.fromJson(json);
}

/// @nodoc
mixin _$ActionPayment {
  String? get action => throw _privateConstructorUsedError;
  String? get urlType => throw _privateConstructorUsedError;
  String? get method => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get qrCode => throw _privateConstructorUsedError;

  /// Serializes this ActionPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActionPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActionPaymentCopyWith<ActionPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionPaymentCopyWith<$Res> {
  factory $ActionPaymentCopyWith(
          ActionPayment value, $Res Function(ActionPayment) then) =
      _$ActionPaymentCopyWithImpl<$Res, ActionPayment>;
  @useResult
  $Res call(
      {String? action,
      String? urlType,
      String? method,
      String? url,
      String? qrCode});
}

/// @nodoc
class _$ActionPaymentCopyWithImpl<$Res, $Val extends ActionPayment>
    implements $ActionPaymentCopyWith<$Res> {
  _$ActionPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? urlType = freezed,
    Object? method = freezed,
    Object? url = freezed,
    Object? qrCode = freezed,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      urlType: freezed == urlType
          ? _value.urlType
          : urlType // ignore: cast_nullable_to_non_nullable
              as String?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionPaymentImplCopyWith<$Res>
    implements $ActionPaymentCopyWith<$Res> {
  factory _$$ActionPaymentImplCopyWith(
          _$ActionPaymentImpl value, $Res Function(_$ActionPaymentImpl) then) =
      __$$ActionPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? action,
      String? urlType,
      String? method,
      String? url,
      String? qrCode});
}

/// @nodoc
class __$$ActionPaymentImplCopyWithImpl<$Res>
    extends _$ActionPaymentCopyWithImpl<$Res, _$ActionPaymentImpl>
    implements _$$ActionPaymentImplCopyWith<$Res> {
  __$$ActionPaymentImplCopyWithImpl(
      _$ActionPaymentImpl _value, $Res Function(_$ActionPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActionPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? urlType = freezed,
    Object? method = freezed,
    Object? url = freezed,
    Object? qrCode = freezed,
  }) {
    return _then(_$ActionPaymentImpl(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      urlType: freezed == urlType
          ? _value.urlType
          : urlType // ignore: cast_nullable_to_non_nullable
              as String?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionPaymentImpl implements _ActionPayment {
  const _$ActionPaymentImpl(
      {required this.action,
      required this.urlType,
      required this.method,
      this.url,
      this.qrCode});

  factory _$ActionPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionPaymentImplFromJson(json);

  @override
  final String? action;
  @override
  final String? urlType;
  @override
  final String? method;
  @override
  final String? url;
  @override
  final String? qrCode;

  @override
  String toString() {
    return 'ActionPayment(action: $action, urlType: $urlType, method: $method, url: $url, qrCode: $qrCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionPaymentImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.urlType, urlType) || other.urlType == urlType) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, action, urlType, method, url, qrCode);

  /// Create a copy of ActionPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionPaymentImplCopyWith<_$ActionPaymentImpl> get copyWith =>
      __$$ActionPaymentImplCopyWithImpl<_$ActionPaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionPaymentImplToJson(
      this,
    );
  }
}

abstract class _ActionPayment implements ActionPayment {
  const factory _ActionPayment(
      {required final String? action,
      required final String? urlType,
      required final String? method,
      final String? url,
      final String? qrCode}) = _$ActionPaymentImpl;

  factory _ActionPayment.fromJson(Map<String, dynamic> json) =
      _$ActionPaymentImpl.fromJson;

  @override
  String? get action;
  @override
  String? get urlType;
  @override
  String? get method;
  @override
  String? get url;
  @override
  String? get qrCode;

  /// Create a copy of ActionPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionPaymentImplCopyWith<_$ActionPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get referenceId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String referenceId,
      String name,
      String type,
      String category,
      String currency,
      int quantity,
      int price});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceId = null,
    Object? name = null,
    Object? type = null,
    Object? category = null,
    Object? currency = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String referenceId,
      String name,
      String type,
      String category,
      String currency,
      int quantity,
      int price});
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referenceId = null,
    Object? name = null,
    Object? type = null,
    Object? category = null,
    Object? currency = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$ItemImpl(
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl(
      {required this.referenceId,
      required this.name,
      required this.type,
      required this.category,
      required this.currency,
      required this.quantity,
      required this.price});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final String referenceId;
  @override
  final String name;
  @override
  final String type;
  @override
  final String category;
  @override
  final String currency;
  @override
  final int quantity;
  @override
  final int price;

  @override
  String toString() {
    return 'Item(referenceId: $referenceId, name: $name, type: $type, category: $category, currency: $currency, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, referenceId, name, type,
      category, currency, quantity, price);

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required final String referenceId,
      required final String name,
      required final String type,
      required final String category,
      required final String currency,
      required final int quantity,
      required final int price}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  String get referenceId;
  @override
  String get name;
  @override
  String get type;
  @override
  String get category;
  @override
  String get currency;
  @override
  int get quantity;
  @override
  int get price;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
