// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderCreateModel _$OrderCreateModelFromJson(Map<String, dynamic> json) {
  return _OrderCreateModel.fromJson(json);
}

/// @nodoc
mixin _$OrderCreateModel {
  OrderCreateOrder get order => throw _privateConstructorUsedError;
  OrderCreateTransaction get transaction => throw _privateConstructorUsedError;
  OrderCreateInvoice get invoice => throw _privateConstructorUsedError;

  /// Serializes this OrderCreateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCreateModelCopyWith<OrderCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCreateModelCopyWith<$Res> {
  factory $OrderCreateModelCopyWith(
          OrderCreateModel value, $Res Function(OrderCreateModel) then) =
      _$OrderCreateModelCopyWithImpl<$Res, OrderCreateModel>;
  @useResult
  $Res call(
      {OrderCreateOrder order,
      OrderCreateTransaction transaction,
      OrderCreateInvoice invoice});

  $OrderCreateOrderCopyWith<$Res> get order;
  $OrderCreateTransactionCopyWith<$Res> get transaction;
  $OrderCreateInvoiceCopyWith<$Res> get invoice;
}

/// @nodoc
class _$OrderCreateModelCopyWithImpl<$Res, $Val extends OrderCreateModel>
    implements $OrderCreateModelCopyWith<$Res> {
  _$OrderCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? transaction = null,
    Object? invoice = null,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderCreateOrder,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as OrderCreateTransaction,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as OrderCreateInvoice,
    ) as $Val);
  }

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderCreateOrderCopyWith<$Res> get order {
    return $OrderCreateOrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderCreateTransactionCopyWith<$Res> get transaction {
    return $OrderCreateTransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderCreateInvoiceCopyWith<$Res> get invoice {
    return $OrderCreateInvoiceCopyWith<$Res>(_value.invoice, (value) {
      return _then(_value.copyWith(invoice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderCreateModelImplCopyWith<$Res>
    implements $OrderCreateModelCopyWith<$Res> {
  factory _$$OrderCreateModelImplCopyWith(_$OrderCreateModelImpl value,
          $Res Function(_$OrderCreateModelImpl) then) =
      __$$OrderCreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderCreateOrder order,
      OrderCreateTransaction transaction,
      OrderCreateInvoice invoice});

  @override
  $OrderCreateOrderCopyWith<$Res> get order;
  @override
  $OrderCreateTransactionCopyWith<$Res> get transaction;
  @override
  $OrderCreateInvoiceCopyWith<$Res> get invoice;
}

/// @nodoc
class __$$OrderCreateModelImplCopyWithImpl<$Res>
    extends _$OrderCreateModelCopyWithImpl<$Res, _$OrderCreateModelImpl>
    implements _$$OrderCreateModelImplCopyWith<$Res> {
  __$$OrderCreateModelImplCopyWithImpl(_$OrderCreateModelImpl _value,
      $Res Function(_$OrderCreateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? transaction = null,
    Object? invoice = null,
  }) {
    return _then(_$OrderCreateModelImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderCreateOrder,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as OrderCreateTransaction,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as OrderCreateInvoice,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCreateModelImpl implements _OrderCreateModel {
  const _$OrderCreateModelImpl(
      {required this.order, required this.transaction, required this.invoice});

  factory _$OrderCreateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCreateModelImplFromJson(json);

  @override
  final OrderCreateOrder order;
  @override
  final OrderCreateTransaction transaction;
  @override
  final OrderCreateInvoice invoice;

  @override
  String toString() {
    return 'OrderCreateModel(order: $order, transaction: $transaction, invoice: $invoice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCreateModelImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.invoice, invoice) || other.invoice == invoice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, order, transaction, invoice);

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCreateModelImplCopyWith<_$OrderCreateModelImpl> get copyWith =>
      __$$OrderCreateModelImplCopyWithImpl<_$OrderCreateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCreateModelImplToJson(
      this,
    );
  }
}

abstract class _OrderCreateModel implements OrderCreateModel {
  const factory _OrderCreateModel(
      {required final OrderCreateOrder order,
      required final OrderCreateTransaction transaction,
      required final OrderCreateInvoice invoice}) = _$OrderCreateModelImpl;

  factory _OrderCreateModel.fromJson(Map<String, dynamic> json) =
      _$OrderCreateModelImpl.fromJson;

  @override
  OrderCreateOrder get order;
  @override
  OrderCreateTransaction get transaction;
  @override
  OrderCreateInvoice get invoice;

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCreateModelImplCopyWith<_$OrderCreateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderCreateOrder _$OrderCreateOrderFromJson(Map<String, dynamic> json) {
  return _OrderCreateOrder.fromJson(json);
}

/// @nodoc
mixin _$OrderCreateOrder {
  String get id => throw _privateConstructorUsedError;
  int get no => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String get customerType => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get invoiceNumber => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String? get tableId => throw _privateConstructorUsedError;
  String? get cashierId => throw _privateConstructorUsedError;
  String? get shipmentId => throw _privateConstructorUsedError;
  DateTime? get closedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OrderCreateOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCreateOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCreateOrderCopyWith<OrderCreateOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCreateOrderCopyWith<$Res> {
  factory $OrderCreateOrderCopyWith(
          OrderCreateOrder value, $Res Function(OrderCreateOrder) then) =
      _$OrderCreateOrderCopyWithImpl<$Res, OrderCreateOrder>;
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
      String invoiceNumber,
      String outletId,
      String? tableId,
      String? cashierId,
      String? shipmentId,
      DateTime? closedAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$OrderCreateOrderCopyWithImpl<$Res, $Val extends OrderCreateOrder>
    implements $OrderCreateOrderCopyWith<$Res> {
  _$OrderCreateOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCreateOrder
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
    Object? invoiceNumber = null,
    Object? outletId = null,
    Object? tableId = freezed,
    Object? cashierId = freezed,
    Object? shipmentId = freezed,
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
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      tableId: freezed == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as String?,
      cashierId: freezed == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String?,
      shipmentId: freezed == shipmentId
          ? _value.shipmentId
          : shipmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCreateOrderImplCopyWith<$Res>
    implements $OrderCreateOrderCopyWith<$Res> {
  factory _$$OrderCreateOrderImplCopyWith(_$OrderCreateOrderImpl value,
          $Res Function(_$OrderCreateOrderImpl) then) =
      __$$OrderCreateOrderImplCopyWithImpl<$Res>;
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
      String invoiceNumber,
      String outletId,
      String? tableId,
      String? cashierId,
      String? shipmentId,
      DateTime? closedAt,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$OrderCreateOrderImplCopyWithImpl<$Res>
    extends _$OrderCreateOrderCopyWithImpl<$Res, _$OrderCreateOrderImpl>
    implements _$$OrderCreateOrderImplCopyWith<$Res> {
  __$$OrderCreateOrderImplCopyWithImpl(_$OrderCreateOrderImpl _value,
      $Res Function(_$OrderCreateOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCreateOrder
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
    Object? invoiceNumber = null,
    Object? outletId = null,
    Object? tableId = freezed,
    Object? cashierId = freezed,
    Object? shipmentId = freezed,
    Object? closedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OrderCreateOrderImpl(
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
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      tableId: freezed == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as String?,
      cashierId: freezed == cashierId
          ? _value.cashierId
          : cashierId // ignore: cast_nullable_to_non_nullable
              as String?,
      shipmentId: freezed == shipmentId
          ? _value.shipmentId
          : shipmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      closedAt: freezed == closedAt
          ? _value.closedAt
          : closedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCreateOrderImpl implements _OrderCreateOrder {
  const _$OrderCreateOrderImpl(
      {required this.id,
      required this.no,
      required this.status,
      required this.price,
      this.customerId,
      required this.paymentStatus,
      required this.customerType,
      required this.type,
      required this.source,
      required this.invoiceNumber,
      required this.outletId,
      this.tableId,
      this.cashierId,
      this.shipmentId,
      this.closedAt,
      required this.createdAt,
      required this.updatedAt});

  factory _$OrderCreateOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCreateOrderImplFromJson(json);

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
  final String invoiceNumber;
  @override
  final String outletId;
  @override
  final String? tableId;
  @override
  final String? cashierId;
  @override
  final String? shipmentId;
  @override
  final DateTime? closedAt;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'OrderCreateOrder(id: $id, no: $no, status: $status, price: $price, customerId: $customerId, paymentStatus: $paymentStatus, customerType: $customerType, type: $type, source: $source, invoiceNumber: $invoiceNumber, outletId: $outletId, tableId: $tableId, cashierId: $cashierId, shipmentId: $shipmentId, closedAt: $closedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCreateOrderImpl &&
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
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.cashierId, cashierId) ||
                other.cashierId == cashierId) &&
            (identical(other.shipmentId, shipmentId) ||
                other.shipmentId == shipmentId) &&
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
      invoiceNumber,
      outletId,
      tableId,
      cashierId,
      shipmentId,
      closedAt,
      createdAt,
      updatedAt);

  /// Create a copy of OrderCreateOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCreateOrderImplCopyWith<_$OrderCreateOrderImpl> get copyWith =>
      __$$OrderCreateOrderImplCopyWithImpl<_$OrderCreateOrderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCreateOrderImplToJson(
      this,
    );
  }
}

abstract class _OrderCreateOrder implements OrderCreateOrder {
  const factory _OrderCreateOrder(
      {required final String id,
      required final int no,
      required final String status,
      required final String price,
      final String? customerId,
      required final String paymentStatus,
      required final String customerType,
      required final String type,
      required final String source,
      required final String invoiceNumber,
      required final String outletId,
      final String? tableId,
      final String? cashierId,
      final String? shipmentId,
      final DateTime? closedAt,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$OrderCreateOrderImpl;

  factory _OrderCreateOrder.fromJson(Map<String, dynamic> json) =
      _$OrderCreateOrderImpl.fromJson;

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
  String get invoiceNumber;
  @override
  String get outletId;
  @override
  String? get tableId;
  @override
  String? get cashierId;
  @override
  String? get shipmentId;
  @override
  DateTime? get closedAt;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of OrderCreateOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCreateOrderImplCopyWith<_$OrderCreateOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderCreateTransaction _$OrderCreateTransactionFromJson(
    Map<String, dynamic> json) {
  return _OrderCreateTransaction.fromJson(json);
}

/// @nodoc
mixin _$OrderCreateTransaction {
  String get id => throw _privateConstructorUsedError;
  int get no => throw _privateConstructorUsedError;
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
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OrderCreateTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCreateTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCreateTransactionCopyWith<OrderCreateTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCreateTransactionCopyWith<$Res> {
  factory $OrderCreateTransactionCopyWith(OrderCreateTransaction value,
          $Res Function(OrderCreateTransaction) then) =
      _$OrderCreateTransactionCopyWithImpl<$Res, OrderCreateTransaction>;
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
      String? accountNumber,
      String? photo,
      String orderId,
      String outletId,
      String? externalId,
      String? approvalCode,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$OrderCreateTransactionCopyWithImpl<$Res,
        $Val extends OrderCreateTransaction>
    implements $OrderCreateTransactionCopyWith<$Res> {
  _$OrderCreateTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCreateTransaction
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCreateTransactionImplCopyWith<$Res>
    implements $OrderCreateTransactionCopyWith<$Res> {
  factory _$$OrderCreateTransactionImplCopyWith(
          _$OrderCreateTransactionImpl value,
          $Res Function(_$OrderCreateTransactionImpl) then) =
      __$$OrderCreateTransactionImplCopyWithImpl<$Res>;
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
      String? accountNumber,
      String? photo,
      String orderId,
      String outletId,
      String? externalId,
      String? approvalCode,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$OrderCreateTransactionImplCopyWithImpl<$Res>
    extends _$OrderCreateTransactionCopyWithImpl<$Res,
        _$OrderCreateTransactionImpl>
    implements _$$OrderCreateTransactionImplCopyWith<$Res> {
  __$$OrderCreateTransactionImplCopyWithImpl(
      _$OrderCreateTransactionImpl _value,
      $Res Function(_$OrderCreateTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCreateTransaction
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
    Object? accountNumber = freezed,
    Object? photo = freezed,
    Object? orderId = null,
    Object? outletId = null,
    Object? externalId = freezed,
    Object? approvalCode = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OrderCreateTransactionImpl(
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCreateTransactionImpl implements _OrderCreateTransaction {
  const _$OrderCreateTransactionImpl(
      {required this.id,
      required this.no,
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

  factory _$OrderCreateTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCreateTransactionImplFromJson(json);

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
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'OrderCreateTransaction(id: $id, no: $no, paymentMethod: $paymentMethod, status: $status, paidAmount: $paidAmount, paidFrom: $paidFrom, amount: $amount, change: $change, accountNumber: $accountNumber, photo: $photo, orderId: $orderId, outletId: $outletId, externalId: $externalId, approvalCode: $approvalCode, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCreateTransactionImpl &&
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
      no,
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

  /// Create a copy of OrderCreateTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCreateTransactionImplCopyWith<_$OrderCreateTransactionImpl>
      get copyWith => __$$OrderCreateTransactionImplCopyWithImpl<
          _$OrderCreateTransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCreateTransactionImplToJson(
      this,
    );
  }
}

abstract class _OrderCreateTransaction implements OrderCreateTransaction {
  const factory _OrderCreateTransaction(
      {required final String id,
      required final int no,
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
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$OrderCreateTransactionImpl;

  factory _OrderCreateTransaction.fromJson(Map<String, dynamic> json) =
      _$OrderCreateTransactionImpl.fromJson;

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
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of OrderCreateTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCreateTransactionImplCopyWith<_$OrderCreateTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderCreateInvoice _$OrderCreateInvoiceFromJson(Map<String, dynamic> json) {
  return _OrderCreateInvoice.fromJson(json);
}

/// @nodoc
mixin _$OrderCreateInvoice {
  String get id => throw _privateConstructorUsedError;
  String get externalId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get merchantName => throw _privateConstructorUsedError;
  String get merchantProfilePictureUrl => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;
  String get invoiceUrl => throw _privateConstructorUsedError;
  List<OrderCreateInvoiceBank> get availableBanks =>
      throw _privateConstructorUsedError;
  List<dynamic> get availableRetailOutlets =>
      throw _privateConstructorUsedError;
  List<dynamic> get availableEwallets => throw _privateConstructorUsedError;
  List<dynamic> get availableQrCodes => throw _privateConstructorUsedError;
  List<dynamic> get availableDirectDebits => throw _privateConstructorUsedError;
  List<dynamic> get availablePaylaters => throw _privateConstructorUsedError;
  bool get shouldExcludeCreditCard => throw _privateConstructorUsedError;
  bool get shouldSendEmail => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get updated => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this OrderCreateInvoice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCreateInvoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCreateInvoiceCopyWith<OrderCreateInvoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCreateInvoiceCopyWith<$Res> {
  factory $OrderCreateInvoiceCopyWith(
          OrderCreateInvoice value, $Res Function(OrderCreateInvoice) then) =
      _$OrderCreateInvoiceCopyWithImpl<$Res, OrderCreateInvoice>;
  @useResult
  $Res call(
      {String id,
      String externalId,
      String userId,
      String status,
      String merchantName,
      String merchantProfilePictureUrl,
      int amount,
      DateTime expiryDate,
      String invoiceUrl,
      List<OrderCreateInvoiceBank> availableBanks,
      List<dynamic> availableRetailOutlets,
      List<dynamic> availableEwallets,
      List<dynamic> availableQrCodes,
      List<dynamic> availableDirectDebits,
      List<dynamic> availablePaylaters,
      bool shouldExcludeCreditCard,
      bool shouldSendEmail,
      DateTime created,
      DateTime updated,
      String currency});
}

/// @nodoc
class _$OrderCreateInvoiceCopyWithImpl<$Res, $Val extends OrderCreateInvoice>
    implements $OrderCreateInvoiceCopyWith<$Res> {
  _$OrderCreateInvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCreateInvoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? externalId = null,
    Object? userId = null,
    Object? status = null,
    Object? merchantName = null,
    Object? merchantProfilePictureUrl = null,
    Object? amount = null,
    Object? expiryDate = null,
    Object? invoiceUrl = null,
    Object? availableBanks = null,
    Object? availableRetailOutlets = null,
    Object? availableEwallets = null,
    Object? availableQrCodes = null,
    Object? availableDirectDebits = null,
    Object? availablePaylaters = null,
    Object? shouldExcludeCreditCard = null,
    Object? shouldSendEmail = null,
    Object? created = null,
    Object? updated = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: null == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      merchantName: null == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String,
      merchantProfilePictureUrl: null == merchantProfilePictureUrl
          ? _value.merchantProfilePictureUrl
          : merchantProfilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceUrl: null == invoiceUrl
          ? _value.invoiceUrl
          : invoiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      availableBanks: null == availableBanks
          ? _value.availableBanks
          : availableBanks // ignore: cast_nullable_to_non_nullable
              as List<OrderCreateInvoiceBank>,
      availableRetailOutlets: null == availableRetailOutlets
          ? _value.availableRetailOutlets
          : availableRetailOutlets // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      availableEwallets: null == availableEwallets
          ? _value.availableEwallets
          : availableEwallets // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      availableQrCodes: null == availableQrCodes
          ? _value.availableQrCodes
          : availableQrCodes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      availableDirectDebits: null == availableDirectDebits
          ? _value.availableDirectDebits
          : availableDirectDebits // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      availablePaylaters: null == availablePaylaters
          ? _value.availablePaylaters
          : availablePaylaters // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      shouldExcludeCreditCard: null == shouldExcludeCreditCard
          ? _value.shouldExcludeCreditCard
          : shouldExcludeCreditCard // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldSendEmail: null == shouldSendEmail
          ? _value.shouldSendEmail
          : shouldSendEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCreateInvoiceImplCopyWith<$Res>
    implements $OrderCreateInvoiceCopyWith<$Res> {
  factory _$$OrderCreateInvoiceImplCopyWith(_$OrderCreateInvoiceImpl value,
          $Res Function(_$OrderCreateInvoiceImpl) then) =
      __$$OrderCreateInvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String externalId,
      String userId,
      String status,
      String merchantName,
      String merchantProfilePictureUrl,
      int amount,
      DateTime expiryDate,
      String invoiceUrl,
      List<OrderCreateInvoiceBank> availableBanks,
      List<dynamic> availableRetailOutlets,
      List<dynamic> availableEwallets,
      List<dynamic> availableQrCodes,
      List<dynamic> availableDirectDebits,
      List<dynamic> availablePaylaters,
      bool shouldExcludeCreditCard,
      bool shouldSendEmail,
      DateTime created,
      DateTime updated,
      String currency});
}

/// @nodoc
class __$$OrderCreateInvoiceImplCopyWithImpl<$Res>
    extends _$OrderCreateInvoiceCopyWithImpl<$Res, _$OrderCreateInvoiceImpl>
    implements _$$OrderCreateInvoiceImplCopyWith<$Res> {
  __$$OrderCreateInvoiceImplCopyWithImpl(_$OrderCreateInvoiceImpl _value,
      $Res Function(_$OrderCreateInvoiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCreateInvoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? externalId = null,
    Object? userId = null,
    Object? status = null,
    Object? merchantName = null,
    Object? merchantProfilePictureUrl = null,
    Object? amount = null,
    Object? expiryDate = null,
    Object? invoiceUrl = null,
    Object? availableBanks = null,
    Object? availableRetailOutlets = null,
    Object? availableEwallets = null,
    Object? availableQrCodes = null,
    Object? availableDirectDebits = null,
    Object? availablePaylaters = null,
    Object? shouldExcludeCreditCard = null,
    Object? shouldSendEmail = null,
    Object? created = null,
    Object? updated = null,
    Object? currency = null,
  }) {
    return _then(_$OrderCreateInvoiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      externalId: null == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      merchantName: null == merchantName
          ? _value.merchantName
          : merchantName // ignore: cast_nullable_to_non_nullable
              as String,
      merchantProfilePictureUrl: null == merchantProfilePictureUrl
          ? _value.merchantProfilePictureUrl
          : merchantProfilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceUrl: null == invoiceUrl
          ? _value.invoiceUrl
          : invoiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      availableBanks: null == availableBanks
          ? _value._availableBanks
          : availableBanks // ignore: cast_nullable_to_non_nullable
              as List<OrderCreateInvoiceBank>,
      availableRetailOutlets: null == availableRetailOutlets
          ? _value._availableRetailOutlets
          : availableRetailOutlets // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      availableEwallets: null == availableEwallets
          ? _value._availableEwallets
          : availableEwallets // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      availableQrCodes: null == availableQrCodes
          ? _value._availableQrCodes
          : availableQrCodes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      availableDirectDebits: null == availableDirectDebits
          ? _value._availableDirectDebits
          : availableDirectDebits // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      availablePaylaters: null == availablePaylaters
          ? _value._availablePaylaters
          : availablePaylaters // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      shouldExcludeCreditCard: null == shouldExcludeCreditCard
          ? _value.shouldExcludeCreditCard
          : shouldExcludeCreditCard // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldSendEmail: null == shouldSendEmail
          ? _value.shouldSendEmail
          : shouldSendEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCreateInvoiceImpl implements _OrderCreateInvoice {
  const _$OrderCreateInvoiceImpl(
      {required this.id,
      required this.externalId,
      required this.userId,
      required this.status,
      required this.merchantName,
      required this.merchantProfilePictureUrl,
      required this.amount,
      required this.expiryDate,
      required this.invoiceUrl,
      required final List<OrderCreateInvoiceBank> availableBanks,
      required final List<dynamic> availableRetailOutlets,
      required final List<dynamic> availableEwallets,
      required final List<dynamic> availableQrCodes,
      required final List<dynamic> availableDirectDebits,
      required final List<dynamic> availablePaylaters,
      required this.shouldExcludeCreditCard,
      required this.shouldSendEmail,
      required this.created,
      required this.updated,
      required this.currency})
      : _availableBanks = availableBanks,
        _availableRetailOutlets = availableRetailOutlets,
        _availableEwallets = availableEwallets,
        _availableQrCodes = availableQrCodes,
        _availableDirectDebits = availableDirectDebits,
        _availablePaylaters = availablePaylaters;

  factory _$OrderCreateInvoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCreateInvoiceImplFromJson(json);

  @override
  final String id;
  @override
  final String externalId;
  @override
  final String userId;
  @override
  final String status;
  @override
  final String merchantName;
  @override
  final String merchantProfilePictureUrl;
  @override
  final int amount;
  @override
  final DateTime expiryDate;
  @override
  final String invoiceUrl;
  final List<OrderCreateInvoiceBank> _availableBanks;
  @override
  List<OrderCreateInvoiceBank> get availableBanks {
    if (_availableBanks is EqualUnmodifiableListView) return _availableBanks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableBanks);
  }

  final List<dynamic> _availableRetailOutlets;
  @override
  List<dynamic> get availableRetailOutlets {
    if (_availableRetailOutlets is EqualUnmodifiableListView)
      return _availableRetailOutlets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableRetailOutlets);
  }

  final List<dynamic> _availableEwallets;
  @override
  List<dynamic> get availableEwallets {
    if (_availableEwallets is EqualUnmodifiableListView)
      return _availableEwallets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableEwallets);
  }

  final List<dynamic> _availableQrCodes;
  @override
  List<dynamic> get availableQrCodes {
    if (_availableQrCodes is EqualUnmodifiableListView)
      return _availableQrCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableQrCodes);
  }

  final List<dynamic> _availableDirectDebits;
  @override
  List<dynamic> get availableDirectDebits {
    if (_availableDirectDebits is EqualUnmodifiableListView)
      return _availableDirectDebits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableDirectDebits);
  }

  final List<dynamic> _availablePaylaters;
  @override
  List<dynamic> get availablePaylaters {
    if (_availablePaylaters is EqualUnmodifiableListView)
      return _availablePaylaters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availablePaylaters);
  }

  @override
  final bool shouldExcludeCreditCard;
  @override
  final bool shouldSendEmail;
  @override
  final DateTime created;
  @override
  final DateTime updated;
  @override
  final String currency;

  @override
  String toString() {
    return 'OrderCreateInvoice(id: $id, externalId: $externalId, userId: $userId, status: $status, merchantName: $merchantName, merchantProfilePictureUrl: $merchantProfilePictureUrl, amount: $amount, expiryDate: $expiryDate, invoiceUrl: $invoiceUrl, availableBanks: $availableBanks, availableRetailOutlets: $availableRetailOutlets, availableEwallets: $availableEwallets, availableQrCodes: $availableQrCodes, availableDirectDebits: $availableDirectDebits, availablePaylaters: $availablePaylaters, shouldExcludeCreditCard: $shouldExcludeCreditCard, shouldSendEmail: $shouldSendEmail, created: $created, updated: $updated, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCreateInvoiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.merchantProfilePictureUrl,
                    merchantProfilePictureUrl) ||
                other.merchantProfilePictureUrl == merchantProfilePictureUrl) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.invoiceUrl, invoiceUrl) ||
                other.invoiceUrl == invoiceUrl) &&
            const DeepCollectionEquality()
                .equals(other._availableBanks, _availableBanks) &&
            const DeepCollectionEquality().equals(
                other._availableRetailOutlets, _availableRetailOutlets) &&
            const DeepCollectionEquality()
                .equals(other._availableEwallets, _availableEwallets) &&
            const DeepCollectionEquality()
                .equals(other._availableQrCodes, _availableQrCodes) &&
            const DeepCollectionEquality()
                .equals(other._availableDirectDebits, _availableDirectDebits) &&
            const DeepCollectionEquality()
                .equals(other._availablePaylaters, _availablePaylaters) &&
            (identical(
                    other.shouldExcludeCreditCard, shouldExcludeCreditCard) ||
                other.shouldExcludeCreditCard == shouldExcludeCreditCard) &&
            (identical(other.shouldSendEmail, shouldSendEmail) ||
                other.shouldSendEmail == shouldSendEmail) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        externalId,
        userId,
        status,
        merchantName,
        merchantProfilePictureUrl,
        amount,
        expiryDate,
        invoiceUrl,
        const DeepCollectionEquality().hash(_availableBanks),
        const DeepCollectionEquality().hash(_availableRetailOutlets),
        const DeepCollectionEquality().hash(_availableEwallets),
        const DeepCollectionEquality().hash(_availableQrCodes),
        const DeepCollectionEquality().hash(_availableDirectDebits),
        const DeepCollectionEquality().hash(_availablePaylaters),
        shouldExcludeCreditCard,
        shouldSendEmail,
        created,
        updated,
        currency
      ]);

  /// Create a copy of OrderCreateInvoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCreateInvoiceImplCopyWith<_$OrderCreateInvoiceImpl> get copyWith =>
      __$$OrderCreateInvoiceImplCopyWithImpl<_$OrderCreateInvoiceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCreateInvoiceImplToJson(
      this,
    );
  }
}

abstract class _OrderCreateInvoice implements OrderCreateInvoice {
  const factory _OrderCreateInvoice(
      {required final String id,
      required final String externalId,
      required final String userId,
      required final String status,
      required final String merchantName,
      required final String merchantProfilePictureUrl,
      required final int amount,
      required final DateTime expiryDate,
      required final String invoiceUrl,
      required final List<OrderCreateInvoiceBank> availableBanks,
      required final List<dynamic> availableRetailOutlets,
      required final List<dynamic> availableEwallets,
      required final List<dynamic> availableQrCodes,
      required final List<dynamic> availableDirectDebits,
      required final List<dynamic> availablePaylaters,
      required final bool shouldExcludeCreditCard,
      required final bool shouldSendEmail,
      required final DateTime created,
      required final DateTime updated,
      required final String currency}) = _$OrderCreateInvoiceImpl;

  factory _OrderCreateInvoice.fromJson(Map<String, dynamic> json) =
      _$OrderCreateInvoiceImpl.fromJson;

  @override
  String get id;
  @override
  String get externalId;
  @override
  String get userId;
  @override
  String get status;
  @override
  String get merchantName;
  @override
  String get merchantProfilePictureUrl;
  @override
  int get amount;
  @override
  DateTime get expiryDate;
  @override
  String get invoiceUrl;
  @override
  List<OrderCreateInvoiceBank> get availableBanks;
  @override
  List<dynamic> get availableRetailOutlets;
  @override
  List<dynamic> get availableEwallets;
  @override
  List<dynamic> get availableQrCodes;
  @override
  List<dynamic> get availableDirectDebits;
  @override
  List<dynamic> get availablePaylaters;
  @override
  bool get shouldExcludeCreditCard;
  @override
  bool get shouldSendEmail;
  @override
  DateTime get created;
  @override
  DateTime get updated;
  @override
  String get currency;

  /// Create a copy of OrderCreateInvoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCreateInvoiceImplCopyWith<_$OrderCreateInvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderCreateInvoiceBank _$OrderCreateInvoiceBankFromJson(
    Map<String, dynamic> json) {
  return _OrderCreateInvoiceBank.fromJson(json);
}

/// @nodoc
mixin _$OrderCreateInvoiceBank {
  String get bankCode => throw _privateConstructorUsedError;
  String get collectionType => throw _privateConstructorUsedError;
  String get bankBranch => throw _privateConstructorUsedError;
  String get accountHolderName => throw _privateConstructorUsedError;
  int get transferAmount => throw _privateConstructorUsedError;

  /// Serializes this OrderCreateInvoiceBank to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCreateInvoiceBank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCreateInvoiceBankCopyWith<OrderCreateInvoiceBank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCreateInvoiceBankCopyWith<$Res> {
  factory $OrderCreateInvoiceBankCopyWith(OrderCreateInvoiceBank value,
          $Res Function(OrderCreateInvoiceBank) then) =
      _$OrderCreateInvoiceBankCopyWithImpl<$Res, OrderCreateInvoiceBank>;
  @useResult
  $Res call(
      {String bankCode,
      String collectionType,
      String bankBranch,
      String accountHolderName,
      int transferAmount});
}

/// @nodoc
class _$OrderCreateInvoiceBankCopyWithImpl<$Res,
        $Val extends OrderCreateInvoiceBank>
    implements $OrderCreateInvoiceBankCopyWith<$Res> {
  _$OrderCreateInvoiceBankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCreateInvoiceBank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankCode = null,
    Object? collectionType = null,
    Object? bankBranch = null,
    Object? accountHolderName = null,
    Object? transferAmount = null,
  }) {
    return _then(_value.copyWith(
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      collectionType: null == collectionType
          ? _value.collectionType
          : collectionType // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranch: null == bankBranch
          ? _value.bankBranch
          : bankBranch // ignore: cast_nullable_to_non_nullable
              as String,
      accountHolderName: null == accountHolderName
          ? _value.accountHolderName
          : accountHolderName // ignore: cast_nullable_to_non_nullable
              as String,
      transferAmount: null == transferAmount
          ? _value.transferAmount
          : transferAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCreateInvoiceBankImplCopyWith<$Res>
    implements $OrderCreateInvoiceBankCopyWith<$Res> {
  factory _$$OrderCreateInvoiceBankImplCopyWith(
          _$OrderCreateInvoiceBankImpl value,
          $Res Function(_$OrderCreateInvoiceBankImpl) then) =
      __$$OrderCreateInvoiceBankImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bankCode,
      String collectionType,
      String bankBranch,
      String accountHolderName,
      int transferAmount});
}

/// @nodoc
class __$$OrderCreateInvoiceBankImplCopyWithImpl<$Res>
    extends _$OrderCreateInvoiceBankCopyWithImpl<$Res,
        _$OrderCreateInvoiceBankImpl>
    implements _$$OrderCreateInvoiceBankImplCopyWith<$Res> {
  __$$OrderCreateInvoiceBankImplCopyWithImpl(
      _$OrderCreateInvoiceBankImpl _value,
      $Res Function(_$OrderCreateInvoiceBankImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCreateInvoiceBank
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankCode = null,
    Object? collectionType = null,
    Object? bankBranch = null,
    Object? accountHolderName = null,
    Object? transferAmount = null,
  }) {
    return _then(_$OrderCreateInvoiceBankImpl(
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      collectionType: null == collectionType
          ? _value.collectionType
          : collectionType // ignore: cast_nullable_to_non_nullable
              as String,
      bankBranch: null == bankBranch
          ? _value.bankBranch
          : bankBranch // ignore: cast_nullable_to_non_nullable
              as String,
      accountHolderName: null == accountHolderName
          ? _value.accountHolderName
          : accountHolderName // ignore: cast_nullable_to_non_nullable
              as String,
      transferAmount: null == transferAmount
          ? _value.transferAmount
          : transferAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCreateInvoiceBankImpl implements _OrderCreateInvoiceBank {
  const _$OrderCreateInvoiceBankImpl(
      {required this.bankCode,
      required this.collectionType,
      required this.bankBranch,
      required this.accountHolderName,
      required this.transferAmount});

  factory _$OrderCreateInvoiceBankImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCreateInvoiceBankImplFromJson(json);

  @override
  final String bankCode;
  @override
  final String collectionType;
  @override
  final String bankBranch;
  @override
  final String accountHolderName;
  @override
  final int transferAmount;

  @override
  String toString() {
    return 'OrderCreateInvoiceBank(bankCode: $bankCode, collectionType: $collectionType, bankBranch: $bankBranch, accountHolderName: $accountHolderName, transferAmount: $transferAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCreateInvoiceBankImpl &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.collectionType, collectionType) ||
                other.collectionType == collectionType) &&
            (identical(other.bankBranch, bankBranch) ||
                other.bankBranch == bankBranch) &&
            (identical(other.accountHolderName, accountHolderName) ||
                other.accountHolderName == accountHolderName) &&
            (identical(other.transferAmount, transferAmount) ||
                other.transferAmount == transferAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bankCode, collectionType,
      bankBranch, accountHolderName, transferAmount);

  /// Create a copy of OrderCreateInvoiceBank
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCreateInvoiceBankImplCopyWith<_$OrderCreateInvoiceBankImpl>
      get copyWith => __$$OrderCreateInvoiceBankImplCopyWithImpl<
          _$OrderCreateInvoiceBankImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCreateInvoiceBankImplToJson(
      this,
    );
  }
}

abstract class _OrderCreateInvoiceBank implements OrderCreateInvoiceBank {
  const factory _OrderCreateInvoiceBank(
      {required final String bankCode,
      required final String collectionType,
      required final String bankBranch,
      required final String accountHolderName,
      required final int transferAmount}) = _$OrderCreateInvoiceBankImpl;

  factory _OrderCreateInvoiceBank.fromJson(Map<String, dynamic> json) =
      _$OrderCreateInvoiceBankImpl.fromJson;

  @override
  String get bankCode;
  @override
  String get collectionType;
  @override
  String get bankBranch;
  @override
  String get accountHolderName;
  @override
  int get transferAmount;

  /// Create a copy of OrderCreateInvoiceBank
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCreateInvoiceBankImplCopyWith<_$OrderCreateInvoiceBankImpl>
      get copyWith => throw _privateConstructorUsedError;
}
