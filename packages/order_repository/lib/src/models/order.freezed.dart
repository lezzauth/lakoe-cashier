// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderCharge _$OrderChargeFromJson(Map<String, dynamic> json) {
  return _OrderCharge.fromJson(json);
}

/// @nodoc
mixin _$OrderCharge {
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderChargeCopyWith<OrderCharge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderChargeCopyWith<$Res> {
  factory $OrderChargeCopyWith(
          OrderCharge value, $Res Function(OrderCharge) then) =
      _$OrderChargeCopyWithImpl<$Res, OrderCharge>;
  @useResult
  $Res call(
      {String id,
      String orderId,
      String name,
      String type,
      String amount,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$OrderChargeCopyWithImpl<$Res, $Val extends OrderCharge>
    implements $OrderChargeCopyWith<$Res> {
  _$OrderChargeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? name = null,
    Object? type = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
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
abstract class _$$OrderChargeImplCopyWith<$Res>
    implements $OrderChargeCopyWith<$Res> {
  factory _$$OrderChargeImplCopyWith(
          _$OrderChargeImpl value, $Res Function(_$OrderChargeImpl) then) =
      __$$OrderChargeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderId,
      String name,
      String type,
      String amount,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$OrderChargeImplCopyWithImpl<$Res>
    extends _$OrderChargeCopyWithImpl<$Res, _$OrderChargeImpl>
    implements _$$OrderChargeImplCopyWith<$Res> {
  __$$OrderChargeImplCopyWithImpl(
      _$OrderChargeImpl _value, $Res Function(_$OrderChargeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? name = null,
    Object? type = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OrderChargeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
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
class _$OrderChargeImpl implements _OrderCharge {
  const _$OrderChargeImpl(
      {required this.id,
      required this.orderId,
      required this.name,
      required this.type,
      required this.amount,
      required this.createdAt,
      required this.updatedAt});

  factory _$OrderChargeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderChargeImplFromJson(json);

  @override
  final String id;
  @override
  final String orderId;
  @override
  final String name;
  @override
  final String type;
  @override
  final String amount;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'OrderCharge(id: $id, orderId: $orderId, name: $name, type: $type, amount: $amount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderChargeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, orderId, name, type, amount, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderChargeImplCopyWith<_$OrderChargeImpl> get copyWith =>
      __$$OrderChargeImplCopyWithImpl<_$OrderChargeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderChargeImplToJson(
      this,
    );
  }
}

abstract class _OrderCharge implements OrderCharge {
  const factory _OrderCharge(
      {required final String id,
      required final String orderId,
      required final String name,
      required final String type,
      required final String amount,
      required final String createdAt,
      required final String updatedAt}) = _$OrderChargeImpl;

  factory _OrderCharge.fromJson(Map<String, dynamic> json) =
      _$OrderChargeImpl.fromJson;

  @override
  String get id;
  @override
  String get orderId;
  @override
  String get name;
  @override
  String get type;
  @override
  String get amount;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderChargeImplCopyWith<_$OrderChargeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  String get id => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  OrderItemProduct get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {String id,
      String? notes,
      String price,
      int quantity,
      String orderId,
      String productId,
      String createdAt,
      String updatedAt,
      OrderItemProduct product});

  $OrderItemProductCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notes = freezed,
    Object? price = null,
    Object? quantity = null,
    Object? orderId = null,
    Object? productId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as OrderItemProduct,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderItemProductCopyWith<$Res> get product {
    return $OrderItemProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? notes,
      String price,
      int quantity,
      String orderId,
      String productId,
      String createdAt,
      String updatedAt,
      OrderItemProduct product});

  @override
  $OrderItemProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notes = freezed,
    Object? price = null,
    Object? quantity = null,
    Object? orderId = null,
    Object? productId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? product = null,
  }) {
    return _then(_$OrderItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as OrderItemProduct,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl(
      {required this.id,
      this.notes,
      required this.price,
      required this.quantity,
      required this.orderId,
      required this.productId,
      required this.createdAt,
      required this.updatedAt,
      required this.product});

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  final String id;
  @override
  final String? notes;
  @override
  final String price;
  @override
  final int quantity;
  @override
  final String orderId;
  @override
  final String productId;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final OrderItemProduct product;

  @override
  String toString() {
    return 'OrderItem(id: $id, notes: $notes, price: $price, quantity: $quantity, orderId: $orderId, productId: $productId, createdAt: $createdAt, updatedAt: $updatedAt, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, notes, price, quantity,
      orderId, productId, createdAt, updatedAt, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(
      this,
    );
  }
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
      {required final String id,
      final String? notes,
      required final String price,
      required final int quantity,
      required final String orderId,
      required final String productId,
      required final String createdAt,
      required final String updatedAt,
      required final OrderItemProduct product}) = _$OrderItemImpl;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  String get id;
  @override
  String? get notes;
  @override
  String get price;
  @override
  int get quantity;
  @override
  String get orderId;
  @override
  String get productId;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  OrderItemProduct get product;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemProduct _$OrderItemProductFromJson(Map<String, dynamic> json) {
  return _OrderItemProduct.fromJson(json);
}

/// @nodoc
mixin _$OrderItemProduct {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemProductCopyWith<OrderItemProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemProductCopyWith<$Res> {
  factory $OrderItemProductCopyWith(
          OrderItemProduct value, $Res Function(OrderItemProduct) then) =
      _$OrderItemProductCopyWithImpl<$Res, OrderItemProduct>;
  @useResult
  $Res call(
      {String name, String? description, String price, List<String> images});
}

/// @nodoc
class _$OrderItemProductCopyWithImpl<$Res, $Val extends OrderItemProduct>
    implements $OrderItemProductCopyWith<$Res> {
  _$OrderItemProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemProductImplCopyWith<$Res>
    implements $OrderItemProductCopyWith<$Res> {
  factory _$$OrderItemProductImplCopyWith(_$OrderItemProductImpl value,
          $Res Function(_$OrderItemProductImpl) then) =
      __$$OrderItemProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String? description, String price, List<String> images});
}

/// @nodoc
class __$$OrderItemProductImplCopyWithImpl<$Res>
    extends _$OrderItemProductCopyWithImpl<$Res, _$OrderItemProductImpl>
    implements _$$OrderItemProductImplCopyWith<$Res> {
  __$$OrderItemProductImplCopyWithImpl(_$OrderItemProductImpl _value,
      $Res Function(_$OrderItemProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? images = null,
  }) {
    return _then(_$OrderItemProductImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
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
class _$OrderItemProductImpl implements _OrderItemProduct {
  const _$OrderItemProductImpl(
      {required this.name,
      this.description,
      required this.price,
      required final List<String> images})
      : _images = images;

  factory _$OrderItemProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemProductImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final String price;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'OrderItemProduct(name: $name, description: $description, price: $price, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemProductImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, price,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemProductImplCopyWith<_$OrderItemProductImpl> get copyWith =>
      __$$OrderItemProductImplCopyWithImpl<_$OrderItemProductImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemProductImplToJson(
      this,
    );
  }
}

abstract class _OrderItemProduct implements OrderItemProduct {
  const factory _OrderItemProduct(
      {required final String name,
      final String? description,
      required final String price,
      required final List<String> images}) = _$OrderItemProductImpl;

  factory _OrderItemProduct.fromJson(Map<String, dynamic> json) =
      _$OrderItemProductImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  String get price;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemProductImplCopyWith<_$OrderItemProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderCustomer _$OrderCustomerFromJson(Map<String, dynamic> json) {
  return _OrderCustomer.fromJson(json);
}

/// @nodoc
mixin _$OrderCustomer {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCustomerCopyWith<OrderCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCustomerCopyWith<$Res> {
  factory $OrderCustomerCopyWith(
          OrderCustomer value, $Res Function(OrderCustomer) then) =
      _$OrderCustomerCopyWithImpl<$Res, OrderCustomer>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? email,
      String phoneNumber,
      String? address,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$OrderCustomerCopyWithImpl<$Res, $Val extends OrderCustomer>
    implements $OrderCustomerCopyWith<$Res> {
  _$OrderCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? phoneNumber = null,
    Object? address = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
abstract class _$$OrderCustomerImplCopyWith<$Res>
    implements $OrderCustomerCopyWith<$Res> {
  factory _$$OrderCustomerImplCopyWith(
          _$OrderCustomerImpl value, $Res Function(_$OrderCustomerImpl) then) =
      __$$OrderCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? email,
      String phoneNumber,
      String? address,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$OrderCustomerImplCopyWithImpl<$Res>
    extends _$OrderCustomerCopyWithImpl<$Res, _$OrderCustomerImpl>
    implements _$$OrderCustomerImplCopyWith<$Res> {
  __$$OrderCustomerImplCopyWithImpl(
      _$OrderCustomerImpl _value, $Res Function(_$OrderCustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? phoneNumber = null,
    Object? address = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OrderCustomerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
class _$OrderCustomerImpl implements _OrderCustomer {
  const _$OrderCustomerImpl(
      {required this.id,
      required this.name,
      this.email,
      required this.phoneNumber,
      this.address,
      required this.createdAt,
      required this.updatedAt});

  factory _$OrderCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCustomerImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String phoneNumber;
  @override
  final String? address;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'OrderCustomer(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, address: $address, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, email, phoneNumber, address, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCustomerImplCopyWith<_$OrderCustomerImpl> get copyWith =>
      __$$OrderCustomerImplCopyWithImpl<_$OrderCustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCustomerImplToJson(
      this,
    );
  }
}

abstract class _OrderCustomer implements OrderCustomer {
  const factory _OrderCustomer(
      {required final String id,
      required final String name,
      final String? email,
      required final String phoneNumber,
      final String? address,
      required final String createdAt,
      required final String updatedAt}) = _$OrderCustomerImpl;

  factory _OrderCustomer.fromJson(Map<String, dynamic> json) =
      _$OrderCustomerImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  String get phoneNumber;
  @override
  String? get address;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderCustomerImplCopyWith<_$OrderCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderTable _$OrderTableFromJson(Map<String, dynamic> json) {
  return _OrderTable.fromJson(json);
}

/// @nodoc
mixin _$OrderTable {
  String get id => throw _privateConstructorUsedError;
  String get no => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get outletRoomId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTableCopyWith<OrderTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTableCopyWith<$Res> {
  factory $OrderTableCopyWith(
          OrderTable value, $Res Function(OrderTable) then) =
      _$OrderTableCopyWithImpl<$Res, OrderTable>;
  @useResult
  $Res call(
      {String id,
      String no,
      int capacity,
      String outletId,
      String outletRoomId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$OrderTableCopyWithImpl<$Res, $Val extends OrderTable>
    implements $OrderTableCopyWith<$Res> {
  _$OrderTableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? capacity = null,
    Object? outletId = null,
    Object? outletRoomId = null,
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
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      outletRoomId: null == outletRoomId
          ? _value.outletRoomId
          : outletRoomId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$OrderTableImplCopyWith<$Res>
    implements $OrderTableCopyWith<$Res> {
  factory _$$OrderTableImplCopyWith(
          _$OrderTableImpl value, $Res Function(_$OrderTableImpl) then) =
      __$$OrderTableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String no,
      int capacity,
      String outletId,
      String outletRoomId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$OrderTableImplCopyWithImpl<$Res>
    extends _$OrderTableCopyWithImpl<$Res, _$OrderTableImpl>
    implements _$$OrderTableImplCopyWith<$Res> {
  __$$OrderTableImplCopyWithImpl(
      _$OrderTableImpl _value, $Res Function(_$OrderTableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? capacity = null,
    Object? outletId = null,
    Object? outletRoomId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OrderTableImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      outletRoomId: null == outletRoomId
          ? _value.outletRoomId
          : outletRoomId // ignore: cast_nullable_to_non_nullable
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
class _$OrderTableImpl implements _OrderTable {
  const _$OrderTableImpl(
      {required this.id,
      required this.no,
      required this.capacity,
      required this.outletId,
      required this.outletRoomId,
      required this.createdAt,
      required this.updatedAt});

  factory _$OrderTableImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTableImplFromJson(json);

  @override
  final String id;
  @override
  final String no;
  @override
  final int capacity;
  @override
  final String outletId;
  @override
  final String outletRoomId;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'OrderTable(id: $id, no: $no, capacity: $capacity, outletId: $outletId, outletRoomId: $outletRoomId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTableImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.outletRoomId, outletRoomId) ||
                other.outletRoomId == outletRoomId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, no, capacity, outletId,
      outletRoomId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTableImplCopyWith<_$OrderTableImpl> get copyWith =>
      __$$OrderTableImplCopyWithImpl<_$OrderTableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTableImplToJson(
      this,
    );
  }
}

abstract class _OrderTable implements OrderTable {
  const factory _OrderTable(
      {required final String id,
      required final String no,
      required final int capacity,
      required final String outletId,
      required final String outletRoomId,
      required final String createdAt,
      required final String updatedAt}) = _$OrderTableImpl;

  factory _OrderTable.fromJson(Map<String, dynamic> json) =
      _$OrderTableImpl.fromJson;

  @override
  String get id;
  @override
  String get no;
  @override
  int get capacity;
  @override
  String get outletId;
  @override
  String get outletRoomId;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderTableImplCopyWith<_$OrderTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
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
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  OrderCustomer? get customer => throw _privateConstructorUsedError;
  List<OrderCharge> get charges => throw _privateConstructorUsedError;
  OrderTable? get table => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
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
      String createdAt,
      String updatedAt,
      OrderCustomer? customer,
      List<OrderCharge> charges,
      OrderTable? table,
      List<OrderItem> items});

  $OrderCustomerCopyWith<$Res>? get customer;
  $OrderTableCopyWith<$Res>? get table;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

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
    Object? cashierId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? customer = freezed,
    Object? charges = null,
    Object? table = freezed,
    Object? items = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as OrderCustomer?,
      charges: null == charges
          ? _value.charges
          : charges // ignore: cast_nullable_to_non_nullable
              as List<OrderCharge>,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as OrderTable?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $OrderCustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderTableCopyWith<$Res>? get table {
    if (_value.table == null) {
      return null;
    }

    return $OrderTableCopyWith<$Res>(_value.table!, (value) {
      return _then(_value.copyWith(table: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
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
      String createdAt,
      String updatedAt,
      OrderCustomer? customer,
      List<OrderCharge> charges,
      OrderTable? table,
      List<OrderItem> items});

  @override
  $OrderCustomerCopyWith<$Res>? get customer;
  @override
  $OrderTableCopyWith<$Res>? get table;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
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
    Object? cashierId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? customer = freezed,
    Object? charges = null,
    Object? table = freezed,
    Object? items = null,
  }) {
    return _then(_$OrderModelImpl(
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as OrderCustomer?,
      charges: null == charges
          ? _value._charges
          : charges // ignore: cast_nullable_to_non_nullable
              as List<OrderCharge>,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as OrderTable?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl(
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
      required this.createdAt,
      required this.updatedAt,
      this.customer,
      required final List<OrderCharge> charges,
      this.table,
      required final List<OrderItem> items})
      : _charges = charges,
        _items = items;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

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
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final OrderCustomer? customer;
  final List<OrderCharge> _charges;
  @override
  List<OrderCharge> get charges {
    if (_charges is EqualUnmodifiableListView) return _charges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charges);
  }

  @override
  final OrderTable? table;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, no: $no, status: $status, price: $price, customerId: $customerId, paymentStatus: $paymentStatus, customerType: $customerType, type: $type, source: $source, outletId: $outletId, tableId: $tableId, cashierId: $cashierId, createdAt: $createdAt, updatedAt: $updatedAt, customer: $customer, charges: $charges, table: $table, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
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
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            const DeepCollectionEquality().equals(other._charges, _charges) &&
            (identical(other.table, table) || other.table == table) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
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
      createdAt,
      updatedAt,
      customer,
      const DeepCollectionEquality().hash(_charges),
      table,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
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
      required final String createdAt,
      required final String updatedAt,
      final OrderCustomer? customer,
      required final List<OrderCharge> charges,
      final OrderTable? table,
      required final List<OrderItem> items}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

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
  String get createdAt;
  @override
  String get updatedAt;
  @override
  OrderCustomer? get customer;
  @override
  List<OrderCharge> get charges;
  @override
  OrderTable? get table;
  @override
  List<OrderItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
  String get name => throw _privateConstructorUsedError;
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
  $Res call({String name, String type, String amount});
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
    Object? name = null,
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String name, String type, String amount});
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
    Object? name = null,
    Object? type = null,
    Object? amount = null,
  }) {
    return _then(_$PreviewOrderChargeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
  const _$PreviewOrderChargeImpl(
      {required this.name, required this.type, required this.amount});

  factory _$PreviewOrderChargeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewOrderChargeImplFromJson(json);

  @override
  final String name;
  @override
  final String type;
  @override
  final String amount;

  @override
  String toString() {
    return 'PreviewOrderCharge(name: $name, type: $type, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewOrderChargeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, type, amount);

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
      {required final String name,
      required final String type,
      required final String amount}) = _$PreviewOrderChargeImpl;

  factory _PreviewOrderCharge.fromJson(Map<String, dynamic> json) =
      _$PreviewOrderChargeImpl.fromJson;

  @override
  String get name;
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
  String get orderItemTotal => throw _privateConstructorUsedError;

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
      List<PreviewOrderCharge> charges,
      String orderItemTotal});
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
    Object? orderItemTotal = null,
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
      orderItemTotal: null == orderItemTotal
          ? _value.orderItemTotal
          : orderItemTotal // ignore: cast_nullable_to_non_nullable
              as String,
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
      List<PreviewOrderCharge> charges,
      String orderItemTotal});
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
    Object? orderItemTotal = null,
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
      orderItemTotal: null == orderItemTotal
          ? _value.orderItemTotal
          : orderItemTotal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreviewOrderPriceResponseImpl implements _PreviewOrderPriceResponse {
  const _$PreviewOrderPriceResponseImpl(
      {required this.total,
      required final List<PreviewOrderItem> orderItems,
      required final List<PreviewOrderCharge> charges,
      required this.orderItemTotal})
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
  final String orderItemTotal;

  @override
  String toString() {
    return 'PreviewOrderPriceResponse(total: $total, orderItems: $orderItems, charges: $charges, orderItemTotal: $orderItemTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewOrderPriceResponseImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems) &&
            const DeepCollectionEquality().equals(other._charges, _charges) &&
            (identical(other.orderItemTotal, orderItemTotal) ||
                other.orderItemTotal == orderItemTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      total,
      const DeepCollectionEquality().hash(_orderItems),
      const DeepCollectionEquality().hash(_charges),
      orderItemTotal);

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
      required final List<PreviewOrderCharge> charges,
      required final String orderItemTotal}) = _$PreviewOrderPriceResponseImpl;

  factory _PreviewOrderPriceResponse.fromJson(Map<String, dynamic> json) =
      _$PreviewOrderPriceResponseImpl.fromJson;

  @override
  String get total;
  @override
  List<PreviewOrderItem> get orderItems;
  @override
  List<PreviewOrderCharge> get charges;
  @override
  String get orderItemTotal;
  @override
  @JsonKey(ignore: true)
  _$$PreviewOrderPriceResponseImplCopyWith<_$PreviewOrderPriceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderModelWithoutInclude _$OrderModelWithoutIncludeFromJson(
    Map<String, dynamic> json) {
  return _OrderModelWithoutInclude.fromJson(json);
}

/// @nodoc
mixin _$OrderModelWithoutInclude {
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
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelWithoutIncludeCopyWith<OrderModelWithoutInclude> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelWithoutIncludeCopyWith<$Res> {
  factory $OrderModelWithoutIncludeCopyWith(OrderModelWithoutInclude value,
          $Res Function(OrderModelWithoutInclude) then) =
      _$OrderModelWithoutIncludeCopyWithImpl<$Res, OrderModelWithoutInclude>;
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
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$OrderModelWithoutIncludeCopyWithImpl<$Res,
        $Val extends OrderModelWithoutInclude>
    implements $OrderModelWithoutIncludeCopyWith<$Res> {
  _$OrderModelWithoutIncludeCopyWithImpl(this._value, this._then);

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
    Object? cashierId = null,
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
abstract class _$$OrderModelWithoutIncludeImplCopyWith<$Res>
    implements $OrderModelWithoutIncludeCopyWith<$Res> {
  factory _$$OrderModelWithoutIncludeImplCopyWith(
          _$OrderModelWithoutIncludeImpl value,
          $Res Function(_$OrderModelWithoutIncludeImpl) then) =
      __$$OrderModelWithoutIncludeImplCopyWithImpl<$Res>;
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
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$OrderModelWithoutIncludeImplCopyWithImpl<$Res>
    extends _$OrderModelWithoutIncludeCopyWithImpl<$Res,
        _$OrderModelWithoutIncludeImpl>
    implements _$$OrderModelWithoutIncludeImplCopyWith<$Res> {
  __$$OrderModelWithoutIncludeImplCopyWithImpl(
      _$OrderModelWithoutIncludeImpl _value,
      $Res Function(_$OrderModelWithoutIncludeImpl) _then)
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
    Object? cashierId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$OrderModelWithoutIncludeImpl(
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
class _$OrderModelWithoutIncludeImpl implements _OrderModelWithoutInclude {
  const _$OrderModelWithoutIncludeImpl(
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
      required this.createdAt,
      required this.updatedAt});

  factory _$OrderModelWithoutIncludeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelWithoutIncludeImplFromJson(json);

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
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'OrderModelWithoutInclude(id: $id, no: $no, status: $status, price: $price, customerId: $customerId, paymentStatus: $paymentStatus, customerType: $customerType, type: $type, source: $source, outletId: $outletId, tableId: $tableId, cashierId: $cashierId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelWithoutIncludeImpl &&
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
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
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
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelWithoutIncludeImplCopyWith<_$OrderModelWithoutIncludeImpl>
      get copyWith => __$$OrderModelWithoutIncludeImplCopyWithImpl<
          _$OrderModelWithoutIncludeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelWithoutIncludeImplToJson(
      this,
    );
  }
}

abstract class _OrderModelWithoutInclude implements OrderModelWithoutInclude {
  const factory _OrderModelWithoutInclude(
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
      required final String createdAt,
      required final String updatedAt}) = _$OrderModelWithoutIncludeImpl;

  factory _OrderModelWithoutInclude.fromJson(Map<String, dynamic> json) =
      _$OrderModelWithoutIncludeImpl.fromJson;

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
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelWithoutIncludeImplCopyWith<_$OrderModelWithoutIncludeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
