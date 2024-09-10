// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OutletModel _$OutletModelFromJson(Map<String, dynamic> json) {
  return _OutletModel.fromJson(json);
}

/// @nodoc
mixin _$OutletModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutletModelCopyWith<OutletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletModelCopyWith<$Res> {
  factory $OutletModelCopyWith(
          OutletModel value, $Res Function(OutletModel) then) =
      _$OutletModelCopyWithImpl<$Res, OutletModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$OutletModelCopyWithImpl<$Res, $Val extends OutletModel>
    implements $OutletModelCopyWith<$Res> {
  _$OutletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutletModelImplCopyWith<$Res>
    implements $OutletModelCopyWith<$Res> {
  factory _$$OutletModelImplCopyWith(
          _$OutletModelImpl value, $Res Function(_$OutletModelImpl) then) =
      __$$OutletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$OutletModelImplCopyWithImpl<$Res>
    extends _$OutletModelCopyWithImpl<$Res, _$OutletModelImpl>
    implements _$$OutletModelImplCopyWith<$Res> {
  __$$OutletModelImplCopyWithImpl(
      _$OutletModelImpl _value, $Res Function(_$OutletModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$OutletModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutletModelImpl implements _OutletModel {
  const _$OutletModelImpl({required this.id, required this.name});

  factory _$OutletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutletModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'OutletModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletModelImplCopyWith<_$OutletModelImpl> get copyWith =>
      __$$OutletModelImplCopyWithImpl<_$OutletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletModelImplToJson(
      this,
    );
  }
}

abstract class _OutletModel implements OutletModel {
  const factory _OutletModel(
      {required final String id,
      required final String name}) = _$OutletModelImpl;

  factory _OutletModel.fromJson(Map<String, dynamic> json) =
      _$OutletModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$OutletModelImplCopyWith<_$OutletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailCustomerCount _$DetailCustomerCountFromJson(Map<String, dynamic> json) {
  return _DetailCustomerCount.fromJson(json);
}

/// @nodoc
mixin _$DetailCustomerCount {
  int get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCustomerCountCopyWith<DetailCustomerCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCustomerCountCopyWith<$Res> {
  factory $DetailCustomerCountCopyWith(
          DetailCustomerCount value, $Res Function(DetailCustomerCount) then) =
      _$DetailCustomerCountCopyWithImpl<$Res, DetailCustomerCount>;
  @useResult
  $Res call({int orders});
}

/// @nodoc
class _$DetailCustomerCountCopyWithImpl<$Res, $Val extends DetailCustomerCount>
    implements $DetailCustomerCountCopyWith<$Res> {
  _$DetailCustomerCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_value.copyWith(
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailCustomerCountImplCopyWith<$Res>
    implements $DetailCustomerCountCopyWith<$Res> {
  factory _$$DetailCustomerCountImplCopyWith(_$DetailCustomerCountImpl value,
          $Res Function(_$DetailCustomerCountImpl) then) =
      __$$DetailCustomerCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int orders});
}

/// @nodoc
class __$$DetailCustomerCountImplCopyWithImpl<$Res>
    extends _$DetailCustomerCountCopyWithImpl<$Res, _$DetailCustomerCountImpl>
    implements _$$DetailCustomerCountImplCopyWith<$Res> {
  __$$DetailCustomerCountImplCopyWithImpl(_$DetailCustomerCountImpl _value,
      $Res Function(_$DetailCustomerCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_$DetailCustomerCountImpl(
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCustomerCountImpl implements _DetailCustomerCount {
  const _$DetailCustomerCountImpl({required this.orders});

  factory _$DetailCustomerCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCustomerCountImplFromJson(json);

  @override
  final int orders;

  @override
  String toString() {
    return 'DetailCustomerCount(orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCustomerCountImpl &&
            (identical(other.orders, orders) || other.orders == orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orders);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCustomerCountImplCopyWith<_$DetailCustomerCountImpl> get copyWith =>
      __$$DetailCustomerCountImplCopyWithImpl<_$DetailCustomerCountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCustomerCountImplToJson(
      this,
    );
  }
}

abstract class _DetailCustomerCount implements DetailCustomerCount {
  const factory _DetailCustomerCount({required final int orders}) =
      _$DetailCustomerCountImpl;

  factory _DetailCustomerCount.fromJson(Map<String, dynamic> json) =
      _$DetailCustomerCountImpl.fromJson;

  @override
  int get orders;
  @override
  @JsonKey(ignore: true)
  _$$DetailCustomerCountImplCopyWith<_$DetailCustomerCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailCustomerOwner _$DetailCustomerOwnerFromJson(Map<String, dynamic> json) {
  return _DetailCustomerOwner.fromJson(json);
}

/// @nodoc
mixin _$DetailCustomerOwner {
  int get coin => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCustomerOwnerCopyWith<DetailCustomerOwner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCustomerOwnerCopyWith<$Res> {
  factory $DetailCustomerOwnerCopyWith(
          DetailCustomerOwner value, $Res Function(DetailCustomerOwner) then) =
      _$DetailCustomerOwnerCopyWithImpl<$Res, DetailCustomerOwner>;
  @useResult
  $Res call({int coin, String ownerId});
}

/// @nodoc
class _$DetailCustomerOwnerCopyWithImpl<$Res, $Val extends DetailCustomerOwner>
    implements $DetailCustomerOwnerCopyWith<$Res> {
  _$DetailCustomerOwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coin = null,
    Object? ownerId = null,
  }) {
    return _then(_value.copyWith(
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailCustomerOwnerImplCopyWith<$Res>
    implements $DetailCustomerOwnerCopyWith<$Res> {
  factory _$$DetailCustomerOwnerImplCopyWith(_$DetailCustomerOwnerImpl value,
          $Res Function(_$DetailCustomerOwnerImpl) then) =
      __$$DetailCustomerOwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int coin, String ownerId});
}

/// @nodoc
class __$$DetailCustomerOwnerImplCopyWithImpl<$Res>
    extends _$DetailCustomerOwnerCopyWithImpl<$Res, _$DetailCustomerOwnerImpl>
    implements _$$DetailCustomerOwnerImplCopyWith<$Res> {
  __$$DetailCustomerOwnerImplCopyWithImpl(_$DetailCustomerOwnerImpl _value,
      $Res Function(_$DetailCustomerOwnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coin = null,
    Object? ownerId = null,
  }) {
    return _then(_$DetailCustomerOwnerImpl(
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCustomerOwnerImpl implements _DetailCustomerOwner {
  const _$DetailCustomerOwnerImpl({required this.coin, required this.ownerId});

  factory _$DetailCustomerOwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCustomerOwnerImplFromJson(json);

  @override
  final int coin;
  @override
  final String ownerId;

  @override
  String toString() {
    return 'DetailCustomerOwner(coin: $coin, ownerId: $ownerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCustomerOwnerImpl &&
            (identical(other.coin, coin) || other.coin == coin) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, coin, ownerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCustomerOwnerImplCopyWith<_$DetailCustomerOwnerImpl> get copyWith =>
      __$$DetailCustomerOwnerImplCopyWithImpl<_$DetailCustomerOwnerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCustomerOwnerImplToJson(
      this,
    );
  }
}

abstract class _DetailCustomerOwner implements DetailCustomerOwner {
  const factory _DetailCustomerOwner(
      {required final int coin,
      required final String ownerId}) = _$DetailCustomerOwnerImpl;

  factory _DetailCustomerOwner.fromJson(Map<String, dynamic> json) =
      _$DetailCustomerOwnerImpl.fromJson;

  @override
  int get coin;
  @override
  String get ownerId;
  @override
  @JsonKey(ignore: true)
  _$$DetailCustomerOwnerImplCopyWith<_$DetailCustomerOwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailCustomerOrderCount _$DetailCustomerOrderCountFromJson(
    Map<String, dynamic> json) {
  return _DetailCustomerOrderCount.fromJson(json);
}

/// @nodoc
mixin _$DetailCustomerOrderCount {
  int get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCustomerOrderCountCopyWith<DetailCustomerOrderCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCustomerOrderCountCopyWith<$Res> {
  factory $DetailCustomerOrderCountCopyWith(DetailCustomerOrderCount value,
          $Res Function(DetailCustomerOrderCount) then) =
      _$DetailCustomerOrderCountCopyWithImpl<$Res, DetailCustomerOrderCount>;
  @useResult
  $Res call({int items});
}

/// @nodoc
class _$DetailCustomerOrderCountCopyWithImpl<$Res,
        $Val extends DetailCustomerOrderCount>
    implements $DetailCustomerOrderCountCopyWith<$Res> {
  _$DetailCustomerOrderCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailCustomerOrderCountImplCopyWith<$Res>
    implements $DetailCustomerOrderCountCopyWith<$Res> {
  factory _$$DetailCustomerOrderCountImplCopyWith(
          _$DetailCustomerOrderCountImpl value,
          $Res Function(_$DetailCustomerOrderCountImpl) then) =
      __$$DetailCustomerOrderCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int items});
}

/// @nodoc
class __$$DetailCustomerOrderCountImplCopyWithImpl<$Res>
    extends _$DetailCustomerOrderCountCopyWithImpl<$Res,
        _$DetailCustomerOrderCountImpl>
    implements _$$DetailCustomerOrderCountImplCopyWith<$Res> {
  __$$DetailCustomerOrderCountImplCopyWithImpl(
      _$DetailCustomerOrderCountImpl _value,
      $Res Function(_$DetailCustomerOrderCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$DetailCustomerOrderCountImpl(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCustomerOrderCountImpl implements _DetailCustomerOrderCount {
  const _$DetailCustomerOrderCountImpl({required this.items});

  factory _$DetailCustomerOrderCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCustomerOrderCountImplFromJson(json);

  @override
  final int items;

  @override
  String toString() {
    return 'DetailCustomerOrderCount(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCustomerOrderCountImpl &&
            (identical(other.items, items) || other.items == items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, items);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCustomerOrderCountImplCopyWith<_$DetailCustomerOrderCountImpl>
      get copyWith => __$$DetailCustomerOrderCountImplCopyWithImpl<
          _$DetailCustomerOrderCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCustomerOrderCountImplToJson(
      this,
    );
  }
}

abstract class _DetailCustomerOrderCount implements DetailCustomerOrderCount {
  const factory _DetailCustomerOrderCount({required final int items}) =
      _$DetailCustomerOrderCountImpl;

  factory _DetailCustomerOrderCount.fromJson(Map<String, dynamic> json) =
      _$DetailCustomerOrderCountImpl.fromJson;

  @override
  int get items;
  @override
  @JsonKey(ignore: true)
  _$$DetailCustomerOrderCountImplCopyWith<_$DetailCustomerOrderCountImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailCustomerOrderTransaction _$DetailCustomerOrderTransactionFromJson(
    Map<String, dynamic> json) {
  return _DetailCustomerOrderTransaction.fromJson(json);
}

/// @nodoc
mixin _$DetailCustomerOrderTransaction {
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
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCustomerOrderTransactionCopyWith<DetailCustomerOrderTransaction>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCustomerOrderTransactionCopyWith<$Res> {
  factory $DetailCustomerOrderTransactionCopyWith(
          DetailCustomerOrderTransaction value,
          $Res Function(DetailCustomerOrderTransaction) then) =
      _$DetailCustomerOrderTransactionCopyWithImpl<$Res,
          DetailCustomerOrderTransaction>;
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
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$DetailCustomerOrderTransactionCopyWithImpl<$Res,
        $Val extends DetailCustomerOrderTransaction>
    implements $DetailCustomerOrderTransactionCopyWith<$Res> {
  _$DetailCustomerOrderTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$DetailCustomerOrderTransactionImplCopyWith<$Res>
    implements $DetailCustomerOrderTransactionCopyWith<$Res> {
  factory _$$DetailCustomerOrderTransactionImplCopyWith(
          _$DetailCustomerOrderTransactionImpl value,
          $Res Function(_$DetailCustomerOrderTransactionImpl) then) =
      __$$DetailCustomerOrderTransactionImplCopyWithImpl<$Res>;
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
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$DetailCustomerOrderTransactionImplCopyWithImpl<$Res>
    extends _$DetailCustomerOrderTransactionCopyWithImpl<$Res,
        _$DetailCustomerOrderTransactionImpl>
    implements _$$DetailCustomerOrderTransactionImplCopyWith<$Res> {
  __$$DetailCustomerOrderTransactionImplCopyWithImpl(
      _$DetailCustomerOrderTransactionImpl _value,
      $Res Function(_$DetailCustomerOrderTransactionImpl) _then)
      : super(_value, _then);

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
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DetailCustomerOrderTransactionImpl(
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
class _$DetailCustomerOrderTransactionImpl
    implements _DetailCustomerOrderTransaction {
  const _$DetailCustomerOrderTransactionImpl(
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
      required this.createdAt,
      required this.updatedAt});

  factory _$DetailCustomerOrderTransactionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DetailCustomerOrderTransactionImplFromJson(json);

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
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'DetailCustomerOrderTransaction(id: $id, no: $no, paymentMethod: $paymentMethod, status: $status, paidAmount: $paidAmount, paidFrom: $paidFrom, amount: $amount, change: $change, accountNumber: $accountNumber, photo: $photo, orderId: $orderId, outletId: $outletId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCustomerOrderTransactionImpl &&
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
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCustomerOrderTransactionImplCopyWith<
          _$DetailCustomerOrderTransactionImpl>
      get copyWith => __$$DetailCustomerOrderTransactionImplCopyWithImpl<
          _$DetailCustomerOrderTransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCustomerOrderTransactionImplToJson(
      this,
    );
  }
}

abstract class _DetailCustomerOrderTransaction
    implements DetailCustomerOrderTransaction {
  const factory _DetailCustomerOrderTransaction(
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
      required final String createdAt,
      required final String updatedAt}) = _$DetailCustomerOrderTransactionImpl;

  factory _DetailCustomerOrderTransaction.fromJson(Map<String, dynamic> json) =
      _$DetailCustomerOrderTransactionImpl.fromJson;

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
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DetailCustomerOrderTransactionImplCopyWith<
          _$DetailCustomerOrderTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailCustomerOrder _$DetailCustomerOrderFromJson(Map<String, dynamic> json) {
  return _DetailCustomerOrder.fromJson(json);
}

/// @nodoc
mixin _$DetailCustomerOrder {
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
  List<DetailCustomerOrderTransaction> get transactions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "_count")
  DetailCustomerOrderCount get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCustomerOrderCopyWith<DetailCustomerOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCustomerOrderCopyWith<$Res> {
  factory $DetailCustomerOrderCopyWith(
          DetailCustomerOrder value, $Res Function(DetailCustomerOrder) then) =
      _$DetailCustomerOrderCopyWithImpl<$Res, DetailCustomerOrder>;
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
      List<DetailCustomerOrderTransaction> transactions,
      @JsonKey(name: "_count") DetailCustomerOrderCount count});

  $DetailCustomerOrderCountCopyWith<$Res> get count;
}

/// @nodoc
class _$DetailCustomerOrderCopyWithImpl<$Res, $Val extends DetailCustomerOrder>
    implements $DetailCustomerOrderCopyWith<$Res> {
  _$DetailCustomerOrderCopyWithImpl(this._value, this._then);

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
    Object? transactions = null,
    Object? count = null,
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
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<DetailCustomerOrderTransaction>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as DetailCustomerOrderCount,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailCustomerOrderCountCopyWith<$Res> get count {
    return $DetailCustomerOrderCountCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailCustomerOrderImplCopyWith<$Res>
    implements $DetailCustomerOrderCopyWith<$Res> {
  factory _$$DetailCustomerOrderImplCopyWith(_$DetailCustomerOrderImpl value,
          $Res Function(_$DetailCustomerOrderImpl) then) =
      __$$DetailCustomerOrderImplCopyWithImpl<$Res>;
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
      List<DetailCustomerOrderTransaction> transactions,
      @JsonKey(name: "_count") DetailCustomerOrderCount count});

  @override
  $DetailCustomerOrderCountCopyWith<$Res> get count;
}

/// @nodoc
class __$$DetailCustomerOrderImplCopyWithImpl<$Res>
    extends _$DetailCustomerOrderCopyWithImpl<$Res, _$DetailCustomerOrderImpl>
    implements _$$DetailCustomerOrderImplCopyWith<$Res> {
  __$$DetailCustomerOrderImplCopyWithImpl(_$DetailCustomerOrderImpl _value,
      $Res Function(_$DetailCustomerOrderImpl) _then)
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
    Object? transactions = null,
    Object? count = null,
  }) {
    return _then(_$DetailCustomerOrderImpl(
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
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<DetailCustomerOrderTransaction>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as DetailCustomerOrderCount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCustomerOrderImpl implements _DetailCustomerOrder {
  const _$DetailCustomerOrderImpl(
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
      required final List<DetailCustomerOrderTransaction> transactions,
      @JsonKey(name: "_count") required this.count})
      : _transactions = transactions;

  factory _$DetailCustomerOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCustomerOrderImplFromJson(json);

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
  final List<DetailCustomerOrderTransaction> _transactions;
  @override
  List<DetailCustomerOrderTransaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  @JsonKey(name: "_count")
  final DetailCustomerOrderCount count;

  @override
  String toString() {
    return 'DetailCustomerOrder(id: $id, no: $no, status: $status, price: $price, customerId: $customerId, paymentStatus: $paymentStatus, customerType: $customerType, type: $type, source: $source, outletId: $outletId, tableId: $tableId, cashierId: $cashierId, createdAt: $createdAt, updatedAt: $updatedAt, transactions: $transactions, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCustomerOrderImpl &&
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
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.count, count) || other.count == count));
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
      const DeepCollectionEquality().hash(_transactions),
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCustomerOrderImplCopyWith<_$DetailCustomerOrderImpl> get copyWith =>
      __$$DetailCustomerOrderImplCopyWithImpl<_$DetailCustomerOrderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCustomerOrderImplToJson(
      this,
    );
  }
}

abstract class _DetailCustomerOrder implements DetailCustomerOrder {
  const factory _DetailCustomerOrder(
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
          required final List<DetailCustomerOrderTransaction> transactions,
          @JsonKey(name: "_count")
          required final DetailCustomerOrderCount count}) =
      _$DetailCustomerOrderImpl;

  factory _DetailCustomerOrder.fromJson(Map<String, dynamic> json) =
      _$DetailCustomerOrderImpl.fromJson;

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
  List<DetailCustomerOrderTransaction> get transactions;
  @override
  @JsonKey(name: "_count")
  DetailCustomerOrderCount get count;
  @override
  @JsonKey(ignore: true)
  _$$DetailCustomerOrderImplCopyWith<_$DetailCustomerOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailCustomer _$DetailCustomerFromJson(Map<String, dynamic> json) {
  return _DetailCustomer.fromJson(json);
}

/// @nodoc
mixin _$DetailCustomer {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  List<DetailCustomerOrder> get orders => throw _privateConstructorUsedError;
  List<DetailCustomerOwner> get owners => throw _privateConstructorUsedError;
  @JsonKey(name: "_count")
  DetailCustomerCount get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCustomerCopyWith<DetailCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCustomerCopyWith<$Res> {
  factory $DetailCustomerCopyWith(
          DetailCustomer value, $Res Function(DetailCustomer) then) =
      _$DetailCustomerCopyWithImpl<$Res, DetailCustomer>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? email,
      String? address,
      String phoneNumber,
      String createdAt,
      String updatedAt,
      List<DetailCustomerOrder> orders,
      List<DetailCustomerOwner> owners,
      @JsonKey(name: "_count") DetailCustomerCount count});

  $DetailCustomerCountCopyWith<$Res> get count;
}

/// @nodoc
class _$DetailCustomerCopyWithImpl<$Res, $Val extends DetailCustomer>
    implements $DetailCustomerCopyWith<$Res> {
  _$DetailCustomerCopyWithImpl(this._value, this._then);

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
    Object? address = freezed,
    Object? phoneNumber = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? orders = null,
    Object? owners = null,
    Object? count = null,
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
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<DetailCustomerOrder>,
      owners: null == owners
          ? _value.owners
          : owners // ignore: cast_nullable_to_non_nullable
              as List<DetailCustomerOwner>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as DetailCustomerCount,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailCustomerCountCopyWith<$Res> get count {
    return $DetailCustomerCountCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailCustomerImplCopyWith<$Res>
    implements $DetailCustomerCopyWith<$Res> {
  factory _$$DetailCustomerImplCopyWith(_$DetailCustomerImpl value,
          $Res Function(_$DetailCustomerImpl) then) =
      __$$DetailCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? email,
      String? address,
      String phoneNumber,
      String createdAt,
      String updatedAt,
      List<DetailCustomerOrder> orders,
      List<DetailCustomerOwner> owners,
      @JsonKey(name: "_count") DetailCustomerCount count});

  @override
  $DetailCustomerCountCopyWith<$Res> get count;
}

/// @nodoc
class __$$DetailCustomerImplCopyWithImpl<$Res>
    extends _$DetailCustomerCopyWithImpl<$Res, _$DetailCustomerImpl>
    implements _$$DetailCustomerImplCopyWith<$Res> {
  __$$DetailCustomerImplCopyWithImpl(
      _$DetailCustomerImpl _value, $Res Function(_$DetailCustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? address = freezed,
    Object? phoneNumber = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? orders = null,
    Object? owners = null,
    Object? count = null,
  }) {
    return _then(_$DetailCustomerImpl(
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
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<DetailCustomerOrder>,
      owners: null == owners
          ? _value._owners
          : owners // ignore: cast_nullable_to_non_nullable
              as List<DetailCustomerOwner>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as DetailCustomerCount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCustomerImpl implements _DetailCustomer {
  const _$DetailCustomerImpl(
      {required this.id,
      required this.name,
      this.email,
      this.address,
      required this.phoneNumber,
      required this.createdAt,
      required this.updatedAt,
      required final List<DetailCustomerOrder> orders,
      required final List<DetailCustomerOwner> owners,
      @JsonKey(name: "_count") required this.count})
      : _orders = orders,
        _owners = owners;

  factory _$DetailCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCustomerImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String phoneNumber;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  final List<DetailCustomerOrder> _orders;
  @override
  List<DetailCustomerOrder> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  final List<DetailCustomerOwner> _owners;
  @override
  List<DetailCustomerOwner> get owners {
    if (_owners is EqualUnmodifiableListView) return _owners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_owners);
  }

  @override
  @JsonKey(name: "_count")
  final DetailCustomerCount count;

  @override
  String toString() {
    return 'DetailCustomer(id: $id, name: $name, email: $email, address: $address, phoneNumber: $phoneNumber, createdAt: $createdAt, updatedAt: $updatedAt, orders: $orders, owners: $owners, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality().equals(other._owners, _owners) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      address,
      phoneNumber,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_orders),
      const DeepCollectionEquality().hash(_owners),
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCustomerImplCopyWith<_$DetailCustomerImpl> get copyWith =>
      __$$DetailCustomerImplCopyWithImpl<_$DetailCustomerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCustomerImplToJson(
      this,
    );
  }
}

abstract class _DetailCustomer implements DetailCustomer {
  const factory _DetailCustomer(
          {required final String id,
          required final String name,
          final String? email,
          final String? address,
          required final String phoneNumber,
          required final String createdAt,
          required final String updatedAt,
          required final List<DetailCustomerOrder> orders,
          required final List<DetailCustomerOwner> owners,
          @JsonKey(name: "_count") required final DetailCustomerCount count}) =
      _$DetailCustomerImpl;

  factory _DetailCustomer.fromJson(Map<String, dynamic> json) =
      _$DetailCustomerImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String get phoneNumber;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  List<DetailCustomerOrder> get orders;
  @override
  List<DetailCustomerOwner> get owners;
  @override
  @JsonKey(name: "_count")
  DetailCustomerCount get count;
  @override
  @JsonKey(ignore: true)
  _$$DetailCustomerImplCopyWith<_$DetailCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailSummary _$DetailSummaryFromJson(Map<String, dynamic> json) {
  return _DetailSummary.fromJson(json);
}

/// @nodoc
mixin _$DetailSummary {
  String get totalPrice => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get favorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailSummaryCopyWith<DetailSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailSummaryCopyWith<$Res> {
  factory $DetailSummaryCopyWith(
          DetailSummary value, $Res Function(DetailSummary) then) =
      _$DetailSummaryCopyWithImpl<$Res, DetailSummary>;
  @useResult
  $Res call({String totalPrice, int count, String favorite});
}

/// @nodoc
class _$DetailSummaryCopyWithImpl<$Res, $Val extends DetailSummary>
    implements $DetailSummaryCopyWith<$Res> {
  _$DetailSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPrice = null,
    Object? count = null,
    Object? favorite = null,
  }) {
    return _then(_value.copyWith(
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailSummaryImplCopyWith<$Res>
    implements $DetailSummaryCopyWith<$Res> {
  factory _$$DetailSummaryImplCopyWith(
          _$DetailSummaryImpl value, $Res Function(_$DetailSummaryImpl) then) =
      __$$DetailSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String totalPrice, int count, String favorite});
}

/// @nodoc
class __$$DetailSummaryImplCopyWithImpl<$Res>
    extends _$DetailSummaryCopyWithImpl<$Res, _$DetailSummaryImpl>
    implements _$$DetailSummaryImplCopyWith<$Res> {
  __$$DetailSummaryImplCopyWithImpl(
      _$DetailSummaryImpl _value, $Res Function(_$DetailSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPrice = null,
    Object? count = null,
    Object? favorite = null,
  }) {
    return _then(_$DetailSummaryImpl(
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailSummaryImpl implements _DetailSummary {
  const _$DetailSummaryImpl(
      {required this.totalPrice, required this.count, required this.favorite});

  factory _$DetailSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailSummaryImplFromJson(json);

  @override
  final String totalPrice;
  @override
  final int count;
  @override
  final String favorite;

  @override
  String toString() {
    return 'DetailSummary(totalPrice: $totalPrice, count: $count, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailSummaryImpl &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalPrice, count, favorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailSummaryImplCopyWith<_$DetailSummaryImpl> get copyWith =>
      __$$DetailSummaryImplCopyWithImpl<_$DetailSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailSummaryImplToJson(
      this,
    );
  }
}

abstract class _DetailSummary implements DetailSummary {
  const factory _DetailSummary(
      {required final String totalPrice,
      required final int count,
      required final String favorite}) = _$DetailSummaryImpl;

  factory _DetailSummary.fromJson(Map<String, dynamic> json) =
      _$DetailSummaryImpl.fromJson;

  @override
  String get totalPrice;
  @override
  int get count;
  @override
  String get favorite;
  @override
  @JsonKey(ignore: true)
  _$$DetailSummaryImplCopyWith<_$DetailSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailCustomerOutletResponse _$DetailCustomerOutletResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailCustomerOutletResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailCustomerOutletResponse {
  DetailCustomer get customer => throw _privateConstructorUsedError;
  DetailSummary get summary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCustomerOutletResponseCopyWith<DetailCustomerOutletResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCustomerOutletResponseCopyWith<$Res> {
  factory $DetailCustomerOutletResponseCopyWith(
          DetailCustomerOutletResponse value,
          $Res Function(DetailCustomerOutletResponse) then) =
      _$DetailCustomerOutletResponseCopyWithImpl<$Res,
          DetailCustomerOutletResponse>;
  @useResult
  $Res call({DetailCustomer customer, DetailSummary summary});

  $DetailCustomerCopyWith<$Res> get customer;
  $DetailSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$DetailCustomerOutletResponseCopyWithImpl<$Res,
        $Val extends DetailCustomerOutletResponse>
    implements $DetailCustomerOutletResponseCopyWith<$Res> {
  _$DetailCustomerOutletResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as DetailCustomer,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as DetailSummary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailCustomerCopyWith<$Res> get customer {
    return $DetailCustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailSummaryCopyWith<$Res> get summary {
    return $DetailSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailCustomerOutletResponseImplCopyWith<$Res>
    implements $DetailCustomerOutletResponseCopyWith<$Res> {
  factory _$$DetailCustomerOutletResponseImplCopyWith(
          _$DetailCustomerOutletResponseImpl value,
          $Res Function(_$DetailCustomerOutletResponseImpl) then) =
      __$$DetailCustomerOutletResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DetailCustomer customer, DetailSummary summary});

  @override
  $DetailCustomerCopyWith<$Res> get customer;
  @override
  $DetailSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$DetailCustomerOutletResponseImplCopyWithImpl<$Res>
    extends _$DetailCustomerOutletResponseCopyWithImpl<$Res,
        _$DetailCustomerOutletResponseImpl>
    implements _$$DetailCustomerOutletResponseImplCopyWith<$Res> {
  __$$DetailCustomerOutletResponseImplCopyWithImpl(
      _$DetailCustomerOutletResponseImpl _value,
      $Res Function(_$DetailCustomerOutletResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? summary = null,
  }) {
    return _then(_$DetailCustomerOutletResponseImpl(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as DetailCustomer,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as DetailSummary,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCustomerOutletResponseImpl
    implements _DetailCustomerOutletResponse {
  const _$DetailCustomerOutletResponseImpl(
      {required this.customer, required this.summary});

  factory _$DetailCustomerOutletResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DetailCustomerOutletResponseImplFromJson(json);

  @override
  final DetailCustomer customer;
  @override
  final DetailSummary summary;

  @override
  String toString() {
    return 'DetailCustomerOutletResponse(customer: $customer, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCustomerOutletResponseImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customer, summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCustomerOutletResponseImplCopyWith<
          _$DetailCustomerOutletResponseImpl>
      get copyWith => __$$DetailCustomerOutletResponseImplCopyWithImpl<
          _$DetailCustomerOutletResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCustomerOutletResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailCustomerOutletResponse
    implements DetailCustomerOutletResponse {
  const factory _DetailCustomerOutletResponse(
          {required final DetailCustomer customer,
          required final DetailSummary summary}) =
      _$DetailCustomerOutletResponseImpl;

  factory _DetailCustomerOutletResponse.fromJson(Map<String, dynamic> json) =
      _$DetailCustomerOutletResponseImpl.fromJson;

  @override
  DetailCustomer get customer;
  @override
  DetailSummary get summary;
  @override
  @JsonKey(ignore: true)
  _$$DetailCustomerOutletResponseImplCopyWith<
          _$DetailCustomerOutletResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OutletReportModel _$OutletReportModelFromJson(Map<String, dynamic> json) {
  return _OutletReportModel.fromJson(json);
}

/// @nodoc
mixin _$OutletReportModel {
  OutletReportTotalSaleModel get total_sales =>
      throw _privateConstructorUsedError;
  OutletReportTotalTransactionModel get total_transactions =>
      throw _privateConstructorUsedError;
  OutletReportTimeWindow get timeWindow => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutletReportModelCopyWith<OutletReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletReportModelCopyWith<$Res> {
  factory $OutletReportModelCopyWith(
          OutletReportModel value, $Res Function(OutletReportModel) then) =
      _$OutletReportModelCopyWithImpl<$Res, OutletReportModel>;
  @useResult
  $Res call(
      {OutletReportTotalSaleModel total_sales,
      OutletReportTotalTransactionModel total_transactions,
      OutletReportTimeWindow timeWindow});

  $OutletReportTotalSaleModelCopyWith<$Res> get total_sales;
  $OutletReportTotalTransactionModelCopyWith<$Res> get total_transactions;
  $OutletReportTimeWindowCopyWith<$Res> get timeWindow;
}

/// @nodoc
class _$OutletReportModelCopyWithImpl<$Res, $Val extends OutletReportModel>
    implements $OutletReportModelCopyWith<$Res> {
  _$OutletReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_sales = null,
    Object? total_transactions = null,
    Object? timeWindow = null,
  }) {
    return _then(_value.copyWith(
      total_sales: null == total_sales
          ? _value.total_sales
          : total_sales // ignore: cast_nullable_to_non_nullable
              as OutletReportTotalSaleModel,
      total_transactions: null == total_transactions
          ? _value.total_transactions
          : total_transactions // ignore: cast_nullable_to_non_nullable
              as OutletReportTotalTransactionModel,
      timeWindow: null == timeWindow
          ? _value.timeWindow
          : timeWindow // ignore: cast_nullable_to_non_nullable
              as OutletReportTimeWindow,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OutletReportTotalSaleModelCopyWith<$Res> get total_sales {
    return $OutletReportTotalSaleModelCopyWith<$Res>(_value.total_sales,
        (value) {
      return _then(_value.copyWith(total_sales: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OutletReportTotalTransactionModelCopyWith<$Res> get total_transactions {
    return $OutletReportTotalTransactionModelCopyWith<$Res>(
        _value.total_transactions, (value) {
      return _then(_value.copyWith(total_transactions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OutletReportTimeWindowCopyWith<$Res> get timeWindow {
    return $OutletReportTimeWindowCopyWith<$Res>(_value.timeWindow, (value) {
      return _then(_value.copyWith(timeWindow: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OutletReportModelImplCopyWith<$Res>
    implements $OutletReportModelCopyWith<$Res> {
  factory _$$OutletReportModelImplCopyWith(_$OutletReportModelImpl value,
          $Res Function(_$OutletReportModelImpl) then) =
      __$$OutletReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OutletReportTotalSaleModel total_sales,
      OutletReportTotalTransactionModel total_transactions,
      OutletReportTimeWindow timeWindow});

  @override
  $OutletReportTotalSaleModelCopyWith<$Res> get total_sales;
  @override
  $OutletReportTotalTransactionModelCopyWith<$Res> get total_transactions;
  @override
  $OutletReportTimeWindowCopyWith<$Res> get timeWindow;
}

/// @nodoc
class __$$OutletReportModelImplCopyWithImpl<$Res>
    extends _$OutletReportModelCopyWithImpl<$Res, _$OutletReportModelImpl>
    implements _$$OutletReportModelImplCopyWith<$Res> {
  __$$OutletReportModelImplCopyWithImpl(_$OutletReportModelImpl _value,
      $Res Function(_$OutletReportModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_sales = null,
    Object? total_transactions = null,
    Object? timeWindow = null,
  }) {
    return _then(_$OutletReportModelImpl(
      total_sales: null == total_sales
          ? _value.total_sales
          : total_sales // ignore: cast_nullable_to_non_nullable
              as OutletReportTotalSaleModel,
      total_transactions: null == total_transactions
          ? _value.total_transactions
          : total_transactions // ignore: cast_nullable_to_non_nullable
              as OutletReportTotalTransactionModel,
      timeWindow: null == timeWindow
          ? _value.timeWindow
          : timeWindow // ignore: cast_nullable_to_non_nullable
              as OutletReportTimeWindow,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutletReportModelImpl implements _OutletReportModel {
  const _$OutletReportModelImpl(
      {required this.total_sales,
      required this.total_transactions,
      required this.timeWindow});

  factory _$OutletReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutletReportModelImplFromJson(json);

  @override
  final OutletReportTotalSaleModel total_sales;
  @override
  final OutletReportTotalTransactionModel total_transactions;
  @override
  final OutletReportTimeWindow timeWindow;

  @override
  String toString() {
    return 'OutletReportModel(total_sales: $total_sales, total_transactions: $total_transactions, timeWindow: $timeWindow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletReportModelImpl &&
            (identical(other.total_sales, total_sales) ||
                other.total_sales == total_sales) &&
            (identical(other.total_transactions, total_transactions) ||
                other.total_transactions == total_transactions) &&
            (identical(other.timeWindow, timeWindow) ||
                other.timeWindow == timeWindow));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total_sales, total_transactions, timeWindow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletReportModelImplCopyWith<_$OutletReportModelImpl> get copyWith =>
      __$$OutletReportModelImplCopyWithImpl<_$OutletReportModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletReportModelImplToJson(
      this,
    );
  }
}

abstract class _OutletReportModel implements OutletReportModel {
  const factory _OutletReportModel(
          {required final OutletReportTotalSaleModel total_sales,
          required final OutletReportTotalTransactionModel total_transactions,
          required final OutletReportTimeWindow timeWindow}) =
      _$OutletReportModelImpl;

  factory _OutletReportModel.fromJson(Map<String, dynamic> json) =
      _$OutletReportModelImpl.fromJson;

  @override
  OutletReportTotalSaleModel get total_sales;
  @override
  OutletReportTotalTransactionModel get total_transactions;
  @override
  OutletReportTimeWindow get timeWindow;
  @override
  @JsonKey(ignore: true)
  _$$OutletReportModelImplCopyWith<_$OutletReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OutletReportTotalSaleModel _$OutletReportTotalSaleModelFromJson(
    Map<String, dynamic> json) {
  return _OutletReportTotalSaleModel.fromJson(json);
}

/// @nodoc
mixin _$OutletReportTotalSaleModel {
  String get current => throw _privateConstructorUsedError;
  String get past => throw _privateConstructorUsedError;
  int? get diff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutletReportTotalSaleModelCopyWith<OutletReportTotalSaleModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletReportTotalSaleModelCopyWith<$Res> {
  factory $OutletReportTotalSaleModelCopyWith(OutletReportTotalSaleModel value,
          $Res Function(OutletReportTotalSaleModel) then) =
      _$OutletReportTotalSaleModelCopyWithImpl<$Res,
          OutletReportTotalSaleModel>;
  @useResult
  $Res call({String current, String past, int? diff});
}

/// @nodoc
class _$OutletReportTotalSaleModelCopyWithImpl<$Res,
        $Val extends OutletReportTotalSaleModel>
    implements $OutletReportTotalSaleModelCopyWith<$Res> {
  _$OutletReportTotalSaleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? past = null,
    Object? diff = freezed,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as String,
      past: null == past
          ? _value.past
          : past // ignore: cast_nullable_to_non_nullable
              as String,
      diff: freezed == diff
          ? _value.diff
          : diff // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutletReportTotalSaleModelImplCopyWith<$Res>
    implements $OutletReportTotalSaleModelCopyWith<$Res> {
  factory _$$OutletReportTotalSaleModelImplCopyWith(
          _$OutletReportTotalSaleModelImpl value,
          $Res Function(_$OutletReportTotalSaleModelImpl) then) =
      __$$OutletReportTotalSaleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String current, String past, int? diff});
}

/// @nodoc
class __$$OutletReportTotalSaleModelImplCopyWithImpl<$Res>
    extends _$OutletReportTotalSaleModelCopyWithImpl<$Res,
        _$OutletReportTotalSaleModelImpl>
    implements _$$OutletReportTotalSaleModelImplCopyWith<$Res> {
  __$$OutletReportTotalSaleModelImplCopyWithImpl(
      _$OutletReportTotalSaleModelImpl _value,
      $Res Function(_$OutletReportTotalSaleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? past = null,
    Object? diff = freezed,
  }) {
    return _then(_$OutletReportTotalSaleModelImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as String,
      past: null == past
          ? _value.past
          : past // ignore: cast_nullable_to_non_nullable
              as String,
      diff: freezed == diff
          ? _value.diff
          : diff // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutletReportTotalSaleModelImpl implements _OutletReportTotalSaleModel {
  const _$OutletReportTotalSaleModelImpl(
      {required this.current, required this.past, this.diff});

  factory _$OutletReportTotalSaleModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OutletReportTotalSaleModelImplFromJson(json);

  @override
  final String current;
  @override
  final String past;
  @override
  final int? diff;

  @override
  String toString() {
    return 'OutletReportTotalSaleModel(current: $current, past: $past, diff: $diff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletReportTotalSaleModelImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.past, past) || other.past == past) &&
            (identical(other.diff, diff) || other.diff == diff));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, current, past, diff);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletReportTotalSaleModelImplCopyWith<_$OutletReportTotalSaleModelImpl>
      get copyWith => __$$OutletReportTotalSaleModelImplCopyWithImpl<
          _$OutletReportTotalSaleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletReportTotalSaleModelImplToJson(
      this,
    );
  }
}

abstract class _OutletReportTotalSaleModel
    implements OutletReportTotalSaleModel {
  const factory _OutletReportTotalSaleModel(
      {required final String current,
      required final String past,
      final int? diff}) = _$OutletReportTotalSaleModelImpl;

  factory _OutletReportTotalSaleModel.fromJson(Map<String, dynamic> json) =
      _$OutletReportTotalSaleModelImpl.fromJson;

  @override
  String get current;
  @override
  String get past;
  @override
  int? get diff;
  @override
  @JsonKey(ignore: true)
  _$$OutletReportTotalSaleModelImplCopyWith<_$OutletReportTotalSaleModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OutletReportTotalTransactionModel _$OutletReportTotalTransactionModelFromJson(
    Map<String, dynamic> json) {
  return _OutletReportTotalTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$OutletReportTotalTransactionModel {
  int get current => throw _privateConstructorUsedError;
  int get past => throw _privateConstructorUsedError;
  int? get diff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutletReportTotalTransactionModelCopyWith<OutletReportTotalTransactionModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletReportTotalTransactionModelCopyWith<$Res> {
  factory $OutletReportTotalTransactionModelCopyWith(
          OutletReportTotalTransactionModel value,
          $Res Function(OutletReportTotalTransactionModel) then) =
      _$OutletReportTotalTransactionModelCopyWithImpl<$Res,
          OutletReportTotalTransactionModel>;
  @useResult
  $Res call({int current, int past, int? diff});
}

/// @nodoc
class _$OutletReportTotalTransactionModelCopyWithImpl<$Res,
        $Val extends OutletReportTotalTransactionModel>
    implements $OutletReportTotalTransactionModelCopyWith<$Res> {
  _$OutletReportTotalTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? past = null,
    Object? diff = freezed,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      past: null == past
          ? _value.past
          : past // ignore: cast_nullable_to_non_nullable
              as int,
      diff: freezed == diff
          ? _value.diff
          : diff // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutletReportTotalTransactionModelImplCopyWith<$Res>
    implements $OutletReportTotalTransactionModelCopyWith<$Res> {
  factory _$$OutletReportTotalTransactionModelImplCopyWith(
          _$OutletReportTotalTransactionModelImpl value,
          $Res Function(_$OutletReportTotalTransactionModelImpl) then) =
      __$$OutletReportTotalTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int current, int past, int? diff});
}

/// @nodoc
class __$$OutletReportTotalTransactionModelImplCopyWithImpl<$Res>
    extends _$OutletReportTotalTransactionModelCopyWithImpl<$Res,
        _$OutletReportTotalTransactionModelImpl>
    implements _$$OutletReportTotalTransactionModelImplCopyWith<$Res> {
  __$$OutletReportTotalTransactionModelImplCopyWithImpl(
      _$OutletReportTotalTransactionModelImpl _value,
      $Res Function(_$OutletReportTotalTransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? past = null,
    Object? diff = freezed,
  }) {
    return _then(_$OutletReportTotalTransactionModelImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      past: null == past
          ? _value.past
          : past // ignore: cast_nullable_to_non_nullable
              as int,
      diff: freezed == diff
          ? _value.diff
          : diff // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutletReportTotalTransactionModelImpl
    implements _OutletReportTotalTransactionModel {
  const _$OutletReportTotalTransactionModelImpl(
      {required this.current, required this.past, this.diff});

  factory _$OutletReportTotalTransactionModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OutletReportTotalTransactionModelImplFromJson(json);

  @override
  final int current;
  @override
  final int past;
  @override
  final int? diff;

  @override
  String toString() {
    return 'OutletReportTotalTransactionModel(current: $current, past: $past, diff: $diff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletReportTotalTransactionModelImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.past, past) || other.past == past) &&
            (identical(other.diff, diff) || other.diff == diff));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, current, past, diff);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletReportTotalTransactionModelImplCopyWith<
          _$OutletReportTotalTransactionModelImpl>
      get copyWith => __$$OutletReportTotalTransactionModelImplCopyWithImpl<
          _$OutletReportTotalTransactionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletReportTotalTransactionModelImplToJson(
      this,
    );
  }
}

abstract class _OutletReportTotalTransactionModel
    implements OutletReportTotalTransactionModel {
  const factory _OutletReportTotalTransactionModel(
      {required final int current,
      required final int past,
      final int? diff}) = _$OutletReportTotalTransactionModelImpl;

  factory _OutletReportTotalTransactionModel.fromJson(
          Map<String, dynamic> json) =
      _$OutletReportTotalTransactionModelImpl.fromJson;

  @override
  int get current;
  @override
  int get past;
  @override
  int? get diff;
  @override
  @JsonKey(ignore: true)
  _$$OutletReportTotalTransactionModelImplCopyWith<
          _$OutletReportTotalTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OutletReportTimeWindow _$OutletReportTimeWindowFromJson(
    Map<String, dynamic> json) {
  return _OutletReportTimeWindow.fromJson(json);
}

/// @nodoc
mixin _$OutletReportTimeWindow {
  TimeRange get current => throw _privateConstructorUsedError;
  TimeRange get past => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutletReportTimeWindowCopyWith<OutletReportTimeWindow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletReportTimeWindowCopyWith<$Res> {
  factory $OutletReportTimeWindowCopyWith(OutletReportTimeWindow value,
          $Res Function(OutletReportTimeWindow) then) =
      _$OutletReportTimeWindowCopyWithImpl<$Res, OutletReportTimeWindow>;
  @useResult
  $Res call({TimeRange current, TimeRange past});

  $TimeRangeCopyWith<$Res> get current;
  $TimeRangeCopyWith<$Res> get past;
}

/// @nodoc
class _$OutletReportTimeWindowCopyWithImpl<$Res,
        $Val extends OutletReportTimeWindow>
    implements $OutletReportTimeWindowCopyWith<$Res> {
  _$OutletReportTimeWindowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? past = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      past: null == past
          ? _value.past
          : past // ignore: cast_nullable_to_non_nullable
              as TimeRange,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeRangeCopyWith<$Res> get current {
    return $TimeRangeCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeRangeCopyWith<$Res> get past {
    return $TimeRangeCopyWith<$Res>(_value.past, (value) {
      return _then(_value.copyWith(past: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OutletReportTimeWindowImplCopyWith<$Res>
    implements $OutletReportTimeWindowCopyWith<$Res> {
  factory _$$OutletReportTimeWindowImplCopyWith(
          _$OutletReportTimeWindowImpl value,
          $Res Function(_$OutletReportTimeWindowImpl) then) =
      __$$OutletReportTimeWindowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimeRange current, TimeRange past});

  @override
  $TimeRangeCopyWith<$Res> get current;
  @override
  $TimeRangeCopyWith<$Res> get past;
}

/// @nodoc
class __$$OutletReportTimeWindowImplCopyWithImpl<$Res>
    extends _$OutletReportTimeWindowCopyWithImpl<$Res,
        _$OutletReportTimeWindowImpl>
    implements _$$OutletReportTimeWindowImplCopyWith<$Res> {
  __$$OutletReportTimeWindowImplCopyWithImpl(
      _$OutletReportTimeWindowImpl _value,
      $Res Function(_$OutletReportTimeWindowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? past = null,
  }) {
    return _then(_$OutletReportTimeWindowImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      past: null == past
          ? _value.past
          : past // ignore: cast_nullable_to_non_nullable
              as TimeRange,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutletReportTimeWindowImpl implements _OutletReportTimeWindow {
  const _$OutletReportTimeWindowImpl(
      {required this.current, required this.past});

  factory _$OutletReportTimeWindowImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutletReportTimeWindowImplFromJson(json);

  @override
  final TimeRange current;
  @override
  final TimeRange past;

  @override
  String toString() {
    return 'OutletReportTimeWindow(current: $current, past: $past)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletReportTimeWindowImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.past, past) || other.past == past));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, current, past);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletReportTimeWindowImplCopyWith<_$OutletReportTimeWindowImpl>
      get copyWith => __$$OutletReportTimeWindowImplCopyWithImpl<
          _$OutletReportTimeWindowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletReportTimeWindowImplToJson(
      this,
    );
  }
}

abstract class _OutletReportTimeWindow implements OutletReportTimeWindow {
  const factory _OutletReportTimeWindow(
      {required final TimeRange current,
      required final TimeRange past}) = _$OutletReportTimeWindowImpl;

  factory _OutletReportTimeWindow.fromJson(Map<String, dynamic> json) =
      _$OutletReportTimeWindowImpl.fromJson;

  @override
  TimeRange get current;
  @override
  TimeRange get past;
  @override
  @JsonKey(ignore: true)
  _$$OutletReportTimeWindowImplCopyWith<_$OutletReportTimeWindowImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TimeRange _$TimeRangeFromJson(Map<String, dynamic> json) {
  return _TimeRange.fromJson(json);
}

/// @nodoc
mixin _$TimeRange {
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeRangeCopyWith<TimeRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeRangeCopyWith<$Res> {
  factory $TimeRangeCopyWith(TimeRange value, $Res Function(TimeRange) then) =
      _$TimeRangeCopyWithImpl<$Res, TimeRange>;
  @useResult
  $Res call({String start, String end});
}

/// @nodoc
class _$TimeRangeCopyWithImpl<$Res, $Val extends TimeRange>
    implements $TimeRangeCopyWith<$Res> {
  _$TimeRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeRangeImplCopyWith<$Res>
    implements $TimeRangeCopyWith<$Res> {
  factory _$$TimeRangeImplCopyWith(
          _$TimeRangeImpl value, $Res Function(_$TimeRangeImpl) then) =
      __$$TimeRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String start, String end});
}

/// @nodoc
class __$$TimeRangeImplCopyWithImpl<$Res>
    extends _$TimeRangeCopyWithImpl<$Res, _$TimeRangeImpl>
    implements _$$TimeRangeImplCopyWith<$Res> {
  __$$TimeRangeImplCopyWithImpl(
      _$TimeRangeImpl _value, $Res Function(_$TimeRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$TimeRangeImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeRangeImpl implements _TimeRange {
  const _$TimeRangeImpl({required this.start, required this.end});

  factory _$TimeRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeRangeImplFromJson(json);

  @override
  final String start;
  @override
  final String end;

  @override
  String toString() {
    return 'TimeRange(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeRangeImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeRangeImplCopyWith<_$TimeRangeImpl> get copyWith =>
      __$$TimeRangeImplCopyWithImpl<_$TimeRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeRangeImplToJson(
      this,
    );
  }
}

abstract class _TimeRange implements TimeRange {
  const factory _TimeRange(
      {required final String start,
      required final String end}) = _$TimeRangeImpl;

  factory _TimeRange.fromJson(Map<String, dynamic> json) =
      _$TimeRangeImpl.fromJson;

  @override
  String get start;
  @override
  String get end;
  @override
  @JsonKey(ignore: true)
  _$$TimeRangeImplCopyWith<_$TimeRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
