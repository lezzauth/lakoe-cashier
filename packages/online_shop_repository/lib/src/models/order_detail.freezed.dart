// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) {
  return _OrderDetailModel.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailModel {
  String get id => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get invoiceNumber => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  OrderDetailShipment get shipment => throw _privateConstructorUsedError;
  List<OrderDetailItem> get items => throw _privateConstructorUsedError;
  List<OrderDetailCharge> get charges => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailModelCopyWith<OrderDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailModelCopyWith<$Res> {
  factory $OrderDetailModelCopyWith(
          OrderDetailModel value, $Res Function(OrderDetailModel) then) =
      _$OrderDetailModelCopyWithImpl<$Res, OrderDetailModel>;
  @useResult
  $Res call(
      {String id,
      String price,
      String status,
      String invoiceNumber,
      DateTime createdAt,
      OrderDetailShipment shipment,
      List<OrderDetailItem> items,
      List<OrderDetailCharge> charges});

  $OrderDetailShipmentCopyWith<$Res> get shipment;
}

/// @nodoc
class _$OrderDetailModelCopyWithImpl<$Res, $Val extends OrderDetailModel>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? status = null,
    Object? invoiceNumber = null,
    Object? createdAt = null,
    Object? shipment = null,
    Object? items = null,
    Object? charges = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shipment: null == shipment
          ? _value.shipment
          : shipment // ignore: cast_nullable_to_non_nullable
              as OrderDetailShipment,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailItem>,
      charges: null == charges
          ? _value.charges
          : charges // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailCharge>,
    ) as $Val);
  }

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderDetailShipmentCopyWith<$Res> get shipment {
    return $OrderDetailShipmentCopyWith<$Res>(_value.shipment, (value) {
      return _then(_value.copyWith(shipment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDetailModelImplCopyWith<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  factory _$$OrderDetailModelImplCopyWith(_$OrderDetailModelImpl value,
          $Res Function(_$OrderDetailModelImpl) then) =
      __$$OrderDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String price,
      String status,
      String invoiceNumber,
      DateTime createdAt,
      OrderDetailShipment shipment,
      List<OrderDetailItem> items,
      List<OrderDetailCharge> charges});

  @override
  $OrderDetailShipmentCopyWith<$Res> get shipment;
}

/// @nodoc
class __$$OrderDetailModelImplCopyWithImpl<$Res>
    extends _$OrderDetailModelCopyWithImpl<$Res, _$OrderDetailModelImpl>
    implements _$$OrderDetailModelImplCopyWith<$Res> {
  __$$OrderDetailModelImplCopyWithImpl(_$OrderDetailModelImpl _value,
      $Res Function(_$OrderDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? status = null,
    Object? invoiceNumber = null,
    Object? createdAt = null,
    Object? shipment = null,
    Object? items = null,
    Object? charges = null,
  }) {
    return _then(_$OrderDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shipment: null == shipment
          ? _value.shipment
          : shipment // ignore: cast_nullable_to_non_nullable
              as OrderDetailShipment,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailItem>,
      charges: null == charges
          ? _value._charges
          : charges // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailCharge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailModelImpl implements _OrderDetailModel {
  const _$OrderDetailModelImpl(
      {required this.id,
      required this.price,
      required this.status,
      required this.invoiceNumber,
      required this.createdAt,
      required this.shipment,
      required final List<OrderDetailItem> items,
      required final List<OrderDetailCharge> charges})
      : _items = items,
        _charges = charges;

  factory _$OrderDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailModelImplFromJson(json);

  @override
  final String id;
  @override
  final String price;
  @override
  final String status;
  @override
  final String invoiceNumber;
  @override
  final DateTime createdAt;
  @override
  final OrderDetailShipment shipment;
  final List<OrderDetailItem> _items;
  @override
  List<OrderDetailItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<OrderDetailCharge> _charges;
  @override
  List<OrderDetailCharge> get charges {
    if (_charges is EqualUnmodifiableListView) return _charges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charges);
  }

  @override
  String toString() {
    return 'OrderDetailModel(id: $id, price: $price, status: $status, invoiceNumber: $invoiceNumber, createdAt: $createdAt, shipment: $shipment, items: $items, charges: $charges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.shipment, shipment) ||
                other.shipment == shipment) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._charges, _charges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      price,
      status,
      invoiceNumber,
      createdAt,
      shipment,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_charges));

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      __$$OrderDetailModelImplCopyWithImpl<_$OrderDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailModelImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailModel implements OrderDetailModel {
  const factory _OrderDetailModel(
      {required final String id,
      required final String price,
      required final String status,
      required final String invoiceNumber,
      required final DateTime createdAt,
      required final OrderDetailShipment shipment,
      required final List<OrderDetailItem> items,
      required final List<OrderDetailCharge> charges}) = _$OrderDetailModelImpl;

  factory _OrderDetailModel.fromJson(Map<String, dynamic> json) =
      _$OrderDetailModelImpl.fromJson;

  @override
  String get id;
  @override
  String get price;
  @override
  String get status;
  @override
  String get invoiceNumber;
  @override
  DateTime get createdAt;
  @override
  OrderDetailShipment get shipment;
  @override
  List<OrderDetailItem> get items;
  @override
  List<OrderDetailCharge> get charges;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetailShipment _$OrderDetailShipmentFromJson(Map<String, dynamic> json) {
  return _OrderDetailShipment.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailShipment {
  String get id => throw _privateConstructorUsedError;
  String get destinationContactName => throw _privateConstructorUsedError;
  String get destinationContactPhone => throw _privateConstructorUsedError;
  String? get waybillId => throw _privateConstructorUsedError;
  String? get trackingId => throw _privateConstructorUsedError;
  String? get courierType => throw _privateConstructorUsedError;
  String? get courierCompany => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailShipment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailShipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailShipmentCopyWith<OrderDetailShipment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailShipmentCopyWith<$Res> {
  factory $OrderDetailShipmentCopyWith(
          OrderDetailShipment value, $Res Function(OrderDetailShipment) then) =
      _$OrderDetailShipmentCopyWithImpl<$Res, OrderDetailShipment>;
  @useResult
  $Res call(
      {String id,
      String destinationContactName,
      String destinationContactPhone,
      String? waybillId,
      String? trackingId,
      String? courierType,
      String? courierCompany});
}

/// @nodoc
class _$OrderDetailShipmentCopyWithImpl<$Res, $Val extends OrderDetailShipment>
    implements $OrderDetailShipmentCopyWith<$Res> {
  _$OrderDetailShipmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailShipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? destinationContactName = null,
    Object? destinationContactPhone = null,
    Object? waybillId = freezed,
    Object? trackingId = freezed,
    Object? courierType = freezed,
    Object? courierCompany = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      destinationContactName: null == destinationContactName
          ? _value.destinationContactName
          : destinationContactName // ignore: cast_nullable_to_non_nullable
              as String,
      destinationContactPhone: null == destinationContactPhone
          ? _value.destinationContactPhone
          : destinationContactPhone // ignore: cast_nullable_to_non_nullable
              as String,
      waybillId: freezed == waybillId
          ? _value.waybillId
          : waybillId // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingId: freezed == trackingId
          ? _value.trackingId
          : trackingId // ignore: cast_nullable_to_non_nullable
              as String?,
      courierType: freezed == courierType
          ? _value.courierType
          : courierType // ignore: cast_nullable_to_non_nullable
              as String?,
      courierCompany: freezed == courierCompany
          ? _value.courierCompany
          : courierCompany // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailShipmentImplCopyWith<$Res>
    implements $OrderDetailShipmentCopyWith<$Res> {
  factory _$$OrderDetailShipmentImplCopyWith(_$OrderDetailShipmentImpl value,
          $Res Function(_$OrderDetailShipmentImpl) then) =
      __$$OrderDetailShipmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String destinationContactName,
      String destinationContactPhone,
      String? waybillId,
      String? trackingId,
      String? courierType,
      String? courierCompany});
}

/// @nodoc
class __$$OrderDetailShipmentImplCopyWithImpl<$Res>
    extends _$OrderDetailShipmentCopyWithImpl<$Res, _$OrderDetailShipmentImpl>
    implements _$$OrderDetailShipmentImplCopyWith<$Res> {
  __$$OrderDetailShipmentImplCopyWithImpl(_$OrderDetailShipmentImpl _value,
      $Res Function(_$OrderDetailShipmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailShipment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? destinationContactName = null,
    Object? destinationContactPhone = null,
    Object? waybillId = freezed,
    Object? trackingId = freezed,
    Object? courierType = freezed,
    Object? courierCompany = freezed,
  }) {
    return _then(_$OrderDetailShipmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      destinationContactName: null == destinationContactName
          ? _value.destinationContactName
          : destinationContactName // ignore: cast_nullable_to_non_nullable
              as String,
      destinationContactPhone: null == destinationContactPhone
          ? _value.destinationContactPhone
          : destinationContactPhone // ignore: cast_nullable_to_non_nullable
              as String,
      waybillId: freezed == waybillId
          ? _value.waybillId
          : waybillId // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingId: freezed == trackingId
          ? _value.trackingId
          : trackingId // ignore: cast_nullable_to_non_nullable
              as String?,
      courierType: freezed == courierType
          ? _value.courierType
          : courierType // ignore: cast_nullable_to_non_nullable
              as String?,
      courierCompany: freezed == courierCompany
          ? _value.courierCompany
          : courierCompany // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailShipmentImpl implements _OrderDetailShipment {
  const _$OrderDetailShipmentImpl(
      {required this.id,
      required this.destinationContactName,
      required this.destinationContactPhone,
      this.waybillId,
      this.trackingId,
      this.courierType,
      this.courierCompany});

  factory _$OrderDetailShipmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailShipmentImplFromJson(json);

  @override
  final String id;
  @override
  final String destinationContactName;
  @override
  final String destinationContactPhone;
  @override
  final String? waybillId;
  @override
  final String? trackingId;
  @override
  final String? courierType;
  @override
  final String? courierCompany;

  @override
  String toString() {
    return 'OrderDetailShipment(id: $id, destinationContactName: $destinationContactName, destinationContactPhone: $destinationContactPhone, waybillId: $waybillId, trackingId: $trackingId, courierType: $courierType, courierCompany: $courierCompany)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailShipmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.destinationContactName, destinationContactName) ||
                other.destinationContactName == destinationContactName) &&
            (identical(
                    other.destinationContactPhone, destinationContactPhone) ||
                other.destinationContactPhone == destinationContactPhone) &&
            (identical(other.waybillId, waybillId) ||
                other.waybillId == waybillId) &&
            (identical(other.trackingId, trackingId) ||
                other.trackingId == trackingId) &&
            (identical(other.courierType, courierType) ||
                other.courierType == courierType) &&
            (identical(other.courierCompany, courierCompany) ||
                other.courierCompany == courierCompany));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      destinationContactName,
      destinationContactPhone,
      waybillId,
      trackingId,
      courierType,
      courierCompany);

  /// Create a copy of OrderDetailShipment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailShipmentImplCopyWith<_$OrderDetailShipmentImpl> get copyWith =>
      __$$OrderDetailShipmentImplCopyWithImpl<_$OrderDetailShipmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailShipmentImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailShipment implements OrderDetailShipment {
  const factory _OrderDetailShipment(
      {required final String id,
      required final String destinationContactName,
      required final String destinationContactPhone,
      final String? waybillId,
      final String? trackingId,
      final String? courierType,
      final String? courierCompany}) = _$OrderDetailShipmentImpl;

  factory _OrderDetailShipment.fromJson(Map<String, dynamic> json) =
      _$OrderDetailShipmentImpl.fromJson;

  @override
  String get id;
  @override
  String get destinationContactName;
  @override
  String get destinationContactPhone;
  @override
  String? get waybillId;
  @override
  String? get trackingId;
  @override
  String? get courierType;
  @override
  String? get courierCompany;

  /// Create a copy of OrderDetailShipment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailShipmentImplCopyWith<_$OrderDetailShipmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetailItem _$OrderDetailItemFromJson(Map<String, dynamic> json) {
  return _OrderDetailItem.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailItem {
  int get quantity => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  OrderDetailProduct get product => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailItemCopyWith<OrderDetailItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailItemCopyWith<$Res> {
  factory $OrderDetailItemCopyWith(
          OrderDetailItem value, $Res Function(OrderDetailItem) then) =
      _$OrderDetailItemCopyWithImpl<$Res, OrderDetailItem>;
  @useResult
  $Res call({int quantity, String price, OrderDetailProduct product});

  $OrderDetailProductCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderDetailItemCopyWithImpl<$Res, $Val extends OrderDetailItem>
    implements $OrderDetailItemCopyWith<$Res> {
  _$OrderDetailItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? price = null,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as OrderDetailProduct,
    ) as $Val);
  }

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderDetailProductCopyWith<$Res> get product {
    return $OrderDetailProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDetailItemImplCopyWith<$Res>
    implements $OrderDetailItemCopyWith<$Res> {
  factory _$$OrderDetailItemImplCopyWith(_$OrderDetailItemImpl value,
          $Res Function(_$OrderDetailItemImpl) then) =
      __$$OrderDetailItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quantity, String price, OrderDetailProduct product});

  @override
  $OrderDetailProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$OrderDetailItemImplCopyWithImpl<$Res>
    extends _$OrderDetailItemCopyWithImpl<$Res, _$OrderDetailItemImpl>
    implements _$$OrderDetailItemImplCopyWith<$Res> {
  __$$OrderDetailItemImplCopyWithImpl(
      _$OrderDetailItemImpl _value, $Res Function(_$OrderDetailItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? price = null,
    Object? product = null,
  }) {
    return _then(_$OrderDetailItemImpl(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as OrderDetailProduct,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailItemImpl implements _OrderDetailItem {
  const _$OrderDetailItemImpl(
      {required this.quantity, required this.price, required this.product});

  factory _$OrderDetailItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailItemImplFromJson(json);

  @override
  final int quantity;
  @override
  final String price;
  @override
  final OrderDetailProduct product;

  @override
  String toString() {
    return 'OrderDetailItem(quantity: $quantity, price: $price, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailItemImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quantity, price, product);

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailItemImplCopyWith<_$OrderDetailItemImpl> get copyWith =>
      __$$OrderDetailItemImplCopyWithImpl<_$OrderDetailItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailItemImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailItem implements OrderDetailItem {
  const factory _OrderDetailItem(
      {required final int quantity,
      required final String price,
      required final OrderDetailProduct product}) = _$OrderDetailItemImpl;

  factory _OrderDetailItem.fromJson(Map<String, dynamic> json) =
      _$OrderDetailItemImpl.fromJson;

  @override
  int get quantity;
  @override
  String get price;
  @override
  OrderDetailProduct get product;

  /// Create a copy of OrderDetailItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailItemImplCopyWith<_$OrderDetailItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetailProduct _$OrderDetailProductFromJson(Map<String, dynamic> json) {
  return _OrderDetailProduct.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailProduct {
  String get name => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailProductCopyWith<OrderDetailProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailProductCopyWith<$Res> {
  factory $OrderDetailProductCopyWith(
          OrderDetailProduct value, $Res Function(OrderDetailProduct) then) =
      _$OrderDetailProductCopyWithImpl<$Res, OrderDetailProduct>;
  @useResult
  $Res call({String name, List<String> images});
}

/// @nodoc
class _$OrderDetailProductCopyWithImpl<$Res, $Val extends OrderDetailProduct>
    implements $OrderDetailProductCopyWith<$Res> {
  _$OrderDetailProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailProductImplCopyWith<$Res>
    implements $OrderDetailProductCopyWith<$Res> {
  factory _$$OrderDetailProductImplCopyWith(_$OrderDetailProductImpl value,
          $Res Function(_$OrderDetailProductImpl) then) =
      __$$OrderDetailProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<String> images});
}

/// @nodoc
class __$$OrderDetailProductImplCopyWithImpl<$Res>
    extends _$OrderDetailProductCopyWithImpl<$Res, _$OrderDetailProductImpl>
    implements _$$OrderDetailProductImplCopyWith<$Res> {
  __$$OrderDetailProductImplCopyWithImpl(_$OrderDetailProductImpl _value,
      $Res Function(_$OrderDetailProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? images = null,
  }) {
    return _then(_$OrderDetailProductImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailProductImpl implements _OrderDetailProduct {
  const _$OrderDetailProductImpl(
      {required this.name, required final List<String> images})
      : _images = images;

  factory _$OrderDetailProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailProductImplFromJson(json);

  @override
  final String name;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'OrderDetailProduct(name: $name, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailProductImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_images));

  /// Create a copy of OrderDetailProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailProductImplCopyWith<_$OrderDetailProductImpl> get copyWith =>
      __$$OrderDetailProductImplCopyWithImpl<_$OrderDetailProductImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailProductImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailProduct implements OrderDetailProduct {
  const factory _OrderDetailProduct(
      {required final String name,
      required final List<String> images}) = _$OrderDetailProductImpl;

  factory _OrderDetailProduct.fromJson(Map<String, dynamic> json) =
      _$OrderDetailProductImpl.fromJson;

  @override
  String get name;
  @override
  List<String> get images;

  /// Create a copy of OrderDetailProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailProductImplCopyWith<_$OrderDetailProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetailCharge _$OrderDetailChargeFromJson(Map<String, dynamic> json) {
  return _OrderDetailCharge.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailCharge {
  String get name => throw _privateConstructorUsedError;
  bool get isPercentage => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  double? get percentageValue => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailCharge to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailCharge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailChargeCopyWith<OrderDetailCharge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailChargeCopyWith<$Res> {
  factory $OrderDetailChargeCopyWith(
          OrderDetailCharge value, $Res Function(OrderDetailCharge) then) =
      _$OrderDetailChargeCopyWithImpl<$Res, OrderDetailCharge>;
  @useResult
  $Res call(
      {String name, bool isPercentage, String amount, double? percentageValue});
}

/// @nodoc
class _$OrderDetailChargeCopyWithImpl<$Res, $Val extends OrderDetailCharge>
    implements $OrderDetailChargeCopyWith<$Res> {
  _$OrderDetailChargeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailCharge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isPercentage = null,
    Object? amount = null,
    Object? percentageValue = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPercentage: null == isPercentage
          ? _value.isPercentage
          : isPercentage // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      percentageValue: freezed == percentageValue
          ? _value.percentageValue
          : percentageValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailChargeImplCopyWith<$Res>
    implements $OrderDetailChargeCopyWith<$Res> {
  factory _$$OrderDetailChargeImplCopyWith(_$OrderDetailChargeImpl value,
          $Res Function(_$OrderDetailChargeImpl) then) =
      __$$OrderDetailChargeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, bool isPercentage, String amount, double? percentageValue});
}

/// @nodoc
class __$$OrderDetailChargeImplCopyWithImpl<$Res>
    extends _$OrderDetailChargeCopyWithImpl<$Res, _$OrderDetailChargeImpl>
    implements _$$OrderDetailChargeImplCopyWith<$Res> {
  __$$OrderDetailChargeImplCopyWithImpl(_$OrderDetailChargeImpl _value,
      $Res Function(_$OrderDetailChargeImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetailCharge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isPercentage = null,
    Object? amount = null,
    Object? percentageValue = freezed,
  }) {
    return _then(_$OrderDetailChargeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPercentage: null == isPercentage
          ? _value.isPercentage
          : isPercentage // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      percentageValue: freezed == percentageValue
          ? _value.percentageValue
          : percentageValue // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailChargeImpl implements _OrderDetailCharge {
  const _$OrderDetailChargeImpl(
      {required this.name,
      required this.isPercentage,
      required this.amount,
      this.percentageValue});

  factory _$OrderDetailChargeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailChargeImplFromJson(json);

  @override
  final String name;
  @override
  final bool isPercentage;
  @override
  final String amount;
  @override
  final double? percentageValue;

  @override
  String toString() {
    return 'OrderDetailCharge(name: $name, isPercentage: $isPercentage, amount: $amount, percentageValue: $percentageValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailChargeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isPercentage, isPercentage) ||
                other.isPercentage == isPercentage) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentageValue, percentageValue) ||
                other.percentageValue == percentageValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, isPercentage, amount, percentageValue);

  /// Create a copy of OrderDetailCharge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailChargeImplCopyWith<_$OrderDetailChargeImpl> get copyWith =>
      __$$OrderDetailChargeImplCopyWithImpl<_$OrderDetailChargeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailChargeImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailCharge implements OrderDetailCharge {
  const factory _OrderDetailCharge(
      {required final String name,
      required final bool isPercentage,
      required final String amount,
      final double? percentageValue}) = _$OrderDetailChargeImpl;

  factory _OrderDetailCharge.fromJson(Map<String, dynamic> json) =
      _$OrderDetailChargeImpl.fromJson;

  @override
  String get name;
  @override
  bool get isPercentage;
  @override
  String get amount;
  @override
  double? get percentageValue;

  /// Create a copy of OrderDetailCharge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailChargeImplCopyWith<_$OrderDetailChargeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
