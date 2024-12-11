// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) {
  return _PackageModel.fromJson(json);
}

/// @nodoc
mixin _$PackageModel {
  String get name => throw _privateConstructorUsedError;
  int? get orders => throw _privateConstructorUsedError;
  int? get products => throw _privateConstructorUsedError;
  int? get employees => throw _privateConstructorUsedError;
  int? get customers => throw _privateConstructorUsedError;
  int? get tables => throw _privateConstructorUsedError;
  int? get hardwareIntergation => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  /// Serializes this PackageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageModelCopyWith<PackageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageModelCopyWith<$Res> {
  factory $PackageModelCopyWith(
          PackageModel value, $Res Function(PackageModel) then) =
      _$PackageModelCopyWithImpl<$Res, PackageModel>;
  @useResult
  $Res call(
      {String name,
      int? orders,
      int? products,
      int? employees,
      int? customers,
      int? tables,
      int? hardwareIntergation,
      int price});
}

/// @nodoc
class _$PackageModelCopyWithImpl<$Res, $Val extends PackageModel>
    implements $PackageModelCopyWith<$Res> {
  _$PackageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? orders = freezed,
    Object? products = freezed,
    Object? employees = freezed,
    Object? customers = freezed,
    Object? tables = freezed,
    Object? hardwareIntergation = freezed,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as int?,
      employees: freezed == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int?,
      customers: freezed == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as int?,
      tables: freezed == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as int?,
      hardwareIntergation: freezed == hardwareIntergation
          ? _value.hardwareIntergation
          : hardwareIntergation // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageModelImplCopyWith<$Res>
    implements $PackageModelCopyWith<$Res> {
  factory _$$PackageModelImplCopyWith(
          _$PackageModelImpl value, $Res Function(_$PackageModelImpl) then) =
      __$$PackageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int? orders,
      int? products,
      int? employees,
      int? customers,
      int? tables,
      int? hardwareIntergation,
      int price});
}

/// @nodoc
class __$$PackageModelImplCopyWithImpl<$Res>
    extends _$PackageModelCopyWithImpl<$Res, _$PackageModelImpl>
    implements _$$PackageModelImplCopyWith<$Res> {
  __$$PackageModelImplCopyWithImpl(
      _$PackageModelImpl _value, $Res Function(_$PackageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? orders = freezed,
    Object? products = freezed,
    Object? employees = freezed,
    Object? customers = freezed,
    Object? tables = freezed,
    Object? hardwareIntergation = freezed,
    Object? price = null,
  }) {
    return _then(_$PackageModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as int?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as int?,
      employees: freezed == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int?,
      customers: freezed == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as int?,
      tables: freezed == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as int?,
      hardwareIntergation: freezed == hardwareIntergation
          ? _value.hardwareIntergation
          : hardwareIntergation // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageModelImpl implements _PackageModel {
  const _$PackageModelImpl(
      {required this.name,
      this.orders,
      this.products,
      this.employees,
      this.customers,
      this.tables,
      this.hardwareIntergation,
      required this.price});

  factory _$PackageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageModelImplFromJson(json);

  @override
  final String name;
  @override
  final int? orders;
  @override
  final int? products;
  @override
  final int? employees;
  @override
  final int? customers;
  @override
  final int? tables;
  @override
  final int? hardwareIntergation;
  @override
  final int price;

  @override
  String toString() {
    return 'PackageModel(name: $name, orders: $orders, products: $products, employees: $employees, customers: $customers, tables: $tables, hardwareIntergation: $hardwareIntergation, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.employees, employees) ||
                other.employees == employees) &&
            (identical(other.customers, customers) ||
                other.customers == customers) &&
            (identical(other.tables, tables) || other.tables == tables) &&
            (identical(other.hardwareIntergation, hardwareIntergation) ||
                other.hardwareIntergation == hardwareIntergation) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, orders, products,
      employees, customers, tables, hardwareIntergation, price);

  /// Create a copy of PackageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageModelImplCopyWith<_$PackageModelImpl> get copyWith =>
      __$$PackageModelImplCopyWithImpl<_$PackageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageModelImplToJson(
      this,
    );
  }
}

abstract class _PackageModel implements PackageModel {
  const factory _PackageModel(
      {required final String name,
      final int? orders,
      final int? products,
      final int? employees,
      final int? customers,
      final int? tables,
      final int? hardwareIntergation,
      required final int price}) = _$PackageModelImpl;

  factory _PackageModel.fromJson(Map<String, dynamic> json) =
      _$PackageModelImpl.fromJson;

  @override
  String get name;
  @override
  int? get orders;
  @override
  int? get products;
  @override
  int? get employees;
  @override
  int? get customers;
  @override
  int? get tables;
  @override
  int? get hardwareIntergation;
  @override
  int get price;

  /// Create a copy of PackageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageModelImplCopyWith<_$PackageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PackagePriceModel _$PackagePriceModelFromJson(Map<String, dynamic> json) {
  return _PackagePriceModel.fromJson(json);
}

/// @nodoc
mixin _$PackagePriceModel {
  String get name => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  int get period => throw _privateConstructorUsedError;
  int get save => throw _privateConstructorUsedError;
  int get originPrice => throw _privateConstructorUsedError;
  int get pricePerMonth => throw _privateConstructorUsedError;
  int get savePerMonth => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  DateTime get startPeriod => throw _privateConstructorUsedError;
  DateTime get endPeriod => throw _privateConstructorUsedError;

  /// Serializes this PackagePriceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackagePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackagePriceModelCopyWith<PackagePriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagePriceModelCopyWith<$Res> {
  factory $PackagePriceModelCopyWith(
          PackagePriceModel value, $Res Function(PackagePriceModel) then) =
      _$PackagePriceModelCopyWithImpl<$Res, PackagePriceModel>;
  @useResult
  $Res call(
      {String name,
      int discount,
      int period,
      int save,
      int originPrice,
      int pricePerMonth,
      int savePerMonth,
      int price,
      DateTime startPeriod,
      DateTime endPeriod});
}

/// @nodoc
class _$PackagePriceModelCopyWithImpl<$Res, $Val extends PackagePriceModel>
    implements $PackagePriceModelCopyWith<$Res> {
  _$PackagePriceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackagePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? discount = null,
    Object? period = null,
    Object? save = null,
    Object? originPrice = null,
    Object? pricePerMonth = null,
    Object? savePerMonth = null,
    Object? price = null,
    Object? startPeriod = null,
    Object? endPeriod = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      save: null == save
          ? _value.save
          : save // ignore: cast_nullable_to_non_nullable
              as int,
      originPrice: null == originPrice
          ? _value.originPrice
          : originPrice // ignore: cast_nullable_to_non_nullable
              as int,
      pricePerMonth: null == pricePerMonth
          ? _value.pricePerMonth
          : pricePerMonth // ignore: cast_nullable_to_non_nullable
              as int,
      savePerMonth: null == savePerMonth
          ? _value.savePerMonth
          : savePerMonth // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      startPeriod: null == startPeriod
          ? _value.startPeriod
          : startPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endPeriod: null == endPeriod
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackagePriceModelImplCopyWith<$Res>
    implements $PackagePriceModelCopyWith<$Res> {
  factory _$$PackagePriceModelImplCopyWith(_$PackagePriceModelImpl value,
          $Res Function(_$PackagePriceModelImpl) then) =
      __$$PackagePriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int discount,
      int period,
      int save,
      int originPrice,
      int pricePerMonth,
      int savePerMonth,
      int price,
      DateTime startPeriod,
      DateTime endPeriod});
}

/// @nodoc
class __$$PackagePriceModelImplCopyWithImpl<$Res>
    extends _$PackagePriceModelCopyWithImpl<$Res, _$PackagePriceModelImpl>
    implements _$$PackagePriceModelImplCopyWith<$Res> {
  __$$PackagePriceModelImplCopyWithImpl(_$PackagePriceModelImpl _value,
      $Res Function(_$PackagePriceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackagePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? discount = null,
    Object? period = null,
    Object? save = null,
    Object? originPrice = null,
    Object? pricePerMonth = null,
    Object? savePerMonth = null,
    Object? price = null,
    Object? startPeriod = null,
    Object? endPeriod = null,
  }) {
    return _then(_$PackagePriceModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      save: null == save
          ? _value.save
          : save // ignore: cast_nullable_to_non_nullable
              as int,
      originPrice: null == originPrice
          ? _value.originPrice
          : originPrice // ignore: cast_nullable_to_non_nullable
              as int,
      pricePerMonth: null == pricePerMonth
          ? _value.pricePerMonth
          : pricePerMonth // ignore: cast_nullable_to_non_nullable
              as int,
      savePerMonth: null == savePerMonth
          ? _value.savePerMonth
          : savePerMonth // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      startPeriod: null == startPeriod
          ? _value.startPeriod
          : startPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endPeriod: null == endPeriod
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackagePriceModelImpl implements _PackagePriceModel {
  const _$PackagePriceModelImpl(
      {required this.name,
      required this.discount,
      required this.period,
      required this.save,
      required this.originPrice,
      required this.pricePerMonth,
      required this.savePerMonth,
      required this.price,
      required this.startPeriod,
      required this.endPeriod});

  factory _$PackagePriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagePriceModelImplFromJson(json);

  @override
  final String name;
  @override
  final int discount;
  @override
  final int period;
  @override
  final int save;
  @override
  final int originPrice;
  @override
  final int pricePerMonth;
  @override
  final int savePerMonth;
  @override
  final int price;
  @override
  final DateTime startPeriod;
  @override
  final DateTime endPeriod;

  @override
  String toString() {
    return 'PackagePriceModel(name: $name, discount: $discount, period: $period, save: $save, originPrice: $originPrice, pricePerMonth: $pricePerMonth, savePerMonth: $savePerMonth, price: $price, startPeriod: $startPeriod, endPeriod: $endPeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackagePriceModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.save, save) || other.save == save) &&
            (identical(other.originPrice, originPrice) ||
                other.originPrice == originPrice) &&
            (identical(other.pricePerMonth, pricePerMonth) ||
                other.pricePerMonth == pricePerMonth) &&
            (identical(other.savePerMonth, savePerMonth) ||
                other.savePerMonth == savePerMonth) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.startPeriod, startPeriod) ||
                other.startPeriod == startPeriod) &&
            (identical(other.endPeriod, endPeriod) ||
                other.endPeriod == endPeriod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, discount, period, save,
      originPrice, pricePerMonth, savePerMonth, price, startPeriod, endPeriod);

  /// Create a copy of PackagePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagePriceModelImplCopyWith<_$PackagePriceModelImpl> get copyWith =>
      __$$PackagePriceModelImplCopyWithImpl<_$PackagePriceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagePriceModelImplToJson(
      this,
    );
  }
}

abstract class _PackagePriceModel implements PackagePriceModel {
  const factory _PackagePriceModel(
      {required final String name,
      required final int discount,
      required final int period,
      required final int save,
      required final int originPrice,
      required final int pricePerMonth,
      required final int savePerMonth,
      required final int price,
      required final DateTime startPeriod,
      required final DateTime endPeriod}) = _$PackagePriceModelImpl;

  factory _PackagePriceModel.fromJson(Map<String, dynamic> json) =
      _$PackagePriceModelImpl.fromJson;

  @override
  String get name;
  @override
  int get discount;
  @override
  int get period;
  @override
  int get save;
  @override
  int get originPrice;
  @override
  int get pricePerMonth;
  @override
  int get savePerMonth;
  @override
  int get price;
  @override
  DateTime get startPeriod;
  @override
  DateTime get endPeriod;

  /// Create a copy of PackagePriceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackagePriceModelImplCopyWith<_$PackagePriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurchaseResponseModel _$PurchaseResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PurchaseResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PurchaseResponseModel {
  PurchaseModel get purchase => throw _privateConstructorUsedError;
  PaymentRequestModel get paymentRequest => throw _privateConstructorUsedError;

  /// Serializes this PurchaseResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseResponseModelCopyWith<PurchaseResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseResponseModelCopyWith<$Res> {
  factory $PurchaseResponseModelCopyWith(PurchaseResponseModel value,
          $Res Function(PurchaseResponseModel) then) =
      _$PurchaseResponseModelCopyWithImpl<$Res, PurchaseResponseModel>;
  @useResult
  $Res call({PurchaseModel purchase, PaymentRequestModel paymentRequest});

  $PurchaseModelCopyWith<$Res> get purchase;
  $PaymentRequestModelCopyWith<$Res> get paymentRequest;
}

/// @nodoc
class _$PurchaseResponseModelCopyWithImpl<$Res,
        $Val extends PurchaseResponseModel>
    implements $PurchaseResponseModelCopyWith<$Res> {
  _$PurchaseResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
    Object? paymentRequest = null,
  }) {
    return _then(_value.copyWith(
      purchase: null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as PurchaseModel,
      paymentRequest: null == paymentRequest
          ? _value.paymentRequest
          : paymentRequest // ignore: cast_nullable_to_non_nullable
              as PaymentRequestModel,
    ) as $Val);
  }

  /// Create a copy of PurchaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseModelCopyWith<$Res> get purchase {
    return $PurchaseModelCopyWith<$Res>(_value.purchase, (value) {
      return _then(_value.copyWith(purchase: value) as $Val);
    });
  }

  /// Create a copy of PurchaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentRequestModelCopyWith<$Res> get paymentRequest {
    return $PaymentRequestModelCopyWith<$Res>(_value.paymentRequest, (value) {
      return _then(_value.copyWith(paymentRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseResponseModelImplCopyWith<$Res>
    implements $PurchaseResponseModelCopyWith<$Res> {
  factory _$$PurchaseResponseModelImplCopyWith(
          _$PurchaseResponseModelImpl value,
          $Res Function(_$PurchaseResponseModelImpl) then) =
      __$$PurchaseResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PurchaseModel purchase, PaymentRequestModel paymentRequest});

  @override
  $PurchaseModelCopyWith<$Res> get purchase;
  @override
  $PaymentRequestModelCopyWith<$Res> get paymentRequest;
}

/// @nodoc
class __$$PurchaseResponseModelImplCopyWithImpl<$Res>
    extends _$PurchaseResponseModelCopyWithImpl<$Res,
        _$PurchaseResponseModelImpl>
    implements _$$PurchaseResponseModelImplCopyWith<$Res> {
  __$$PurchaseResponseModelImplCopyWithImpl(_$PurchaseResponseModelImpl _value,
      $Res Function(_$PurchaseResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
    Object? paymentRequest = null,
  }) {
    return _then(_$PurchaseResponseModelImpl(
      purchase: null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as PurchaseModel,
      paymentRequest: null == paymentRequest
          ? _value.paymentRequest
          : paymentRequest // ignore: cast_nullable_to_non_nullable
              as PaymentRequestModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseResponseModelImpl implements _PurchaseResponseModel {
  const _$PurchaseResponseModelImpl(
      {required this.purchase, required this.paymentRequest});

  factory _$PurchaseResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseResponseModelImplFromJson(json);

  @override
  final PurchaseModel purchase;
  @override
  final PaymentRequestModel paymentRequest;

  @override
  String toString() {
    return 'PurchaseResponseModel(purchase: $purchase, paymentRequest: $paymentRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseResponseModelImpl &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase) &&
            (identical(other.paymentRequest, paymentRequest) ||
                other.paymentRequest == paymentRequest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, purchase, paymentRequest);

  /// Create a copy of PurchaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseResponseModelImplCopyWith<_$PurchaseResponseModelImpl>
      get copyWith => __$$PurchaseResponseModelImplCopyWithImpl<
          _$PurchaseResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PurchaseResponseModel implements PurchaseResponseModel {
  const factory _PurchaseResponseModel(
          {required final PurchaseModel purchase,
          required final PaymentRequestModel paymentRequest}) =
      _$PurchaseResponseModelImpl;

  factory _PurchaseResponseModel.fromJson(Map<String, dynamic> json) =
      _$PurchaseResponseModelImpl.fromJson;

  @override
  PurchaseModel get purchase;
  @override
  PaymentRequestModel get paymentRequest;

  /// Create a copy of PurchaseResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseResponseModelImplCopyWith<_$PurchaseResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
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
  DateTime get startPeriod => throw _privateConstructorUsedError;
  DateTime get endPeriod => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  String? get externalId => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

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
      DateTime startPeriod,
      DateTime endPeriod,
      String ownerId,
      String? externalId,
      String packageName,
      DateTime createdAt,
      DateTime updatedAt});
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
              as DateTime,
      endPeriod: null == endPeriod
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      DateTime startPeriod,
      DateTime endPeriod,
      String ownerId,
      String? externalId,
      String packageName,
      DateTime createdAt,
      DateTime updatedAt});
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
              as DateTime,
      endPeriod: null == endPeriod
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
  final DateTime startPeriod;
  @override
  final DateTime endPeriod;
  @override
  final String ownerId;
  @override
  final String? externalId;
  @override
  final String packageName;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

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
      required final DateTime startPeriod,
      required final DateTime endPeriod,
      required final String ownerId,
      final String? externalId,
      required final String packageName,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$PurchaseModelImpl;

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
  DateTime get startPeriod;
  @override
  DateTime get endPeriod;
  @override
  String get ownerId;
  @override
  String? get externalId;
  @override
  String get packageName;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of PurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseModelImplCopyWith<_$PurchaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentRequestModel _$PaymentRequestModelFromJson(Map<String, dynamic> json) {
  return _PaymentRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentRequestModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get updated => throw _privateConstructorUsedError;
  String get referenceId => throw _privateConstructorUsedError;
  String get businessId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  PaymentMethodModel get paymentMethod => throw _privateConstructorUsedError;
  String get captureMethod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<PaymentActionModel> get actions => throw _privateConstructorUsedError;

  /// Serializes this PaymentRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentRequestModelCopyWith<PaymentRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRequestModelCopyWith<$Res> {
  factory $PaymentRequestModelCopyWith(
          PaymentRequestModel value, $Res Function(PaymentRequestModel) then) =
      _$PaymentRequestModelCopyWithImpl<$Res, PaymentRequestModel>;
  @useResult
  $Res call(
      {String id,
      DateTime created,
      DateTime updated,
      String referenceId,
      String businessId,
      int amount,
      String country,
      String currency,
      PaymentMethodModel paymentMethod,
      String captureMethod,
      String status,
      List<PaymentActionModel> actions});

  $PaymentMethodModelCopyWith<$Res> get paymentMethod;
}

/// @nodoc
class _$PaymentRequestModelCopyWithImpl<$Res, $Val extends PaymentRequestModel>
    implements $PaymentRequestModelCopyWith<$Res> {
  _$PaymentRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentRequestModel
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
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as PaymentMethodModel,
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
              as List<PaymentActionModel>,
    ) as $Val);
  }

  /// Create a copy of PaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodModelCopyWith<$Res> get paymentMethod {
    return $PaymentMethodModelCopyWith<$Res>(_value.paymentMethod, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentRequestModelImplCopyWith<$Res>
    implements $PaymentRequestModelCopyWith<$Res> {
  factory _$$PaymentRequestModelImplCopyWith(_$PaymentRequestModelImpl value,
          $Res Function(_$PaymentRequestModelImpl) then) =
      __$$PaymentRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime created,
      DateTime updated,
      String referenceId,
      String businessId,
      int amount,
      String country,
      String currency,
      PaymentMethodModel paymentMethod,
      String captureMethod,
      String status,
      List<PaymentActionModel> actions});

  @override
  $PaymentMethodModelCopyWith<$Res> get paymentMethod;
}

/// @nodoc
class __$$PaymentRequestModelImplCopyWithImpl<$Res>
    extends _$PaymentRequestModelCopyWithImpl<$Res, _$PaymentRequestModelImpl>
    implements _$$PaymentRequestModelImplCopyWith<$Res> {
  __$$PaymentRequestModelImplCopyWithImpl(_$PaymentRequestModelImpl _value,
      $Res Function(_$PaymentRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentRequestModel
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
  }) {
    return _then(_$PaymentRequestModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as PaymentMethodModel,
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
              as List<PaymentActionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentRequestModelImpl implements _PaymentRequestModel {
  const _$PaymentRequestModelImpl(
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
      required final List<PaymentActionModel> actions})
      : _actions = actions;

  factory _$PaymentRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentRequestModelImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime created;
  @override
  final DateTime updated;
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
  final PaymentMethodModel paymentMethod;
  @override
  final String captureMethod;
  @override
  final String status;
  final List<PaymentActionModel> _actions;
  @override
  List<PaymentActionModel> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'PaymentRequestModel(id: $id, created: $created, updated: $updated, referenceId: $referenceId, businessId: $businessId, amount: $amount, country: $country, currency: $currency, paymentMethod: $paymentMethod, captureMethod: $captureMethod, status: $status, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentRequestModelImpl &&
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
            const DeepCollectionEquality().equals(other._actions, _actions));
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
      const DeepCollectionEquality().hash(_actions));

  /// Create a copy of PaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentRequestModelImplCopyWith<_$PaymentRequestModelImpl> get copyWith =>
      __$$PaymentRequestModelImplCopyWithImpl<_$PaymentRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentRequestModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentRequestModel implements PaymentRequestModel {
  const factory _PaymentRequestModel(
          {required final String id,
          required final DateTime created,
          required final DateTime updated,
          required final String referenceId,
          required final String businessId,
          required final int amount,
          required final String country,
          required final String currency,
          required final PaymentMethodModel paymentMethod,
          required final String captureMethod,
          required final String status,
          required final List<PaymentActionModel> actions}) =
      _$PaymentRequestModelImpl;

  factory _PaymentRequestModel.fromJson(Map<String, dynamic> json) =
      _$PaymentRequestModelImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get created;
  @override
  DateTime get updated;
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
  PaymentMethodModel get paymentMethod;
  @override
  String get captureMethod;
  @override
  String get status;
  @override
  List<PaymentActionModel> get actions;

  /// Create a copy of PaymentRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentRequestModelImplCopyWith<_$PaymentRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) {
  return _PaymentMethodModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodModel {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get updated => throw _privateConstructorUsedError;
  String get referenceId => throw _privateConstructorUsedError;
  EWalletModel? get ewallet => throw _privateConstructorUsedError;
  VirtualAccountModel? get virtualAccount => throw _privateConstructorUsedError;
  String get reusability => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodModelCopyWith<PaymentMethodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodModelCopyWith<$Res> {
  factory $PaymentMethodModelCopyWith(
          PaymentMethodModel value, $Res Function(PaymentMethodModel) then) =
      _$PaymentMethodModelCopyWithImpl<$Res, PaymentMethodModel>;
  @useResult
  $Res call(
      {String id,
      String type,
      DateTime created,
      DateTime updated,
      String referenceId,
      EWalletModel? ewallet,
      VirtualAccountModel? virtualAccount,
      String reusability,
      String status});

  $EWalletModelCopyWith<$Res>? get ewallet;
  $VirtualAccountModelCopyWith<$Res>? get virtualAccount;
}

/// @nodoc
class _$PaymentMethodModelCopyWithImpl<$Res, $Val extends PaymentMethodModel>
    implements $PaymentMethodModelCopyWith<$Res> {
  _$PaymentMethodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodModel
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
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      ewallet: freezed == ewallet
          ? _value.ewallet
          : ewallet // ignore: cast_nullable_to_non_nullable
              as EWalletModel?,
      virtualAccount: freezed == virtualAccount
          ? _value.virtualAccount
          : virtualAccount // ignore: cast_nullable_to_non_nullable
              as VirtualAccountModel?,
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

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EWalletModelCopyWith<$Res>? get ewallet {
    if (_value.ewallet == null) {
      return null;
    }

    return $EWalletModelCopyWith<$Res>(_value.ewallet!, (value) {
      return _then(_value.copyWith(ewallet: value) as $Val);
    });
  }

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VirtualAccountModelCopyWith<$Res>? get virtualAccount {
    if (_value.virtualAccount == null) {
      return null;
    }

    return $VirtualAccountModelCopyWith<$Res>(_value.virtualAccount!, (value) {
      return _then(_value.copyWith(virtualAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentMethodModelImplCopyWith<$Res>
    implements $PaymentMethodModelCopyWith<$Res> {
  factory _$$PaymentMethodModelImplCopyWith(_$PaymentMethodModelImpl value,
          $Res Function(_$PaymentMethodModelImpl) then) =
      __$$PaymentMethodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      DateTime created,
      DateTime updated,
      String referenceId,
      EWalletModel? ewallet,
      VirtualAccountModel? virtualAccount,
      String reusability,
      String status});

  @override
  $EWalletModelCopyWith<$Res>? get ewallet;
  @override
  $VirtualAccountModelCopyWith<$Res>? get virtualAccount;
}

/// @nodoc
class __$$PaymentMethodModelImplCopyWithImpl<$Res>
    extends _$PaymentMethodModelCopyWithImpl<$Res, _$PaymentMethodModelImpl>
    implements _$$PaymentMethodModelImplCopyWith<$Res> {
  __$$PaymentMethodModelImplCopyWithImpl(_$PaymentMethodModelImpl _value,
      $Res Function(_$PaymentMethodModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodModel
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
    return _then(_$PaymentMethodModelImpl(
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
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      ewallet: freezed == ewallet
          ? _value.ewallet
          : ewallet // ignore: cast_nullable_to_non_nullable
              as EWalletModel?,
      virtualAccount: freezed == virtualAccount
          ? _value.virtualAccount
          : virtualAccount // ignore: cast_nullable_to_non_nullable
              as VirtualAccountModel?,
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
class _$PaymentMethodModelImpl implements _PaymentMethodModel {
  const _$PaymentMethodModelImpl(
      {required this.id,
      required this.type,
      required this.created,
      required this.updated,
      required this.referenceId,
      this.ewallet,
      this.virtualAccount,
      required this.reusability,
      required this.status});

  factory _$PaymentMethodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodModelImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final DateTime created;
  @override
  final DateTime updated;
  @override
  final String referenceId;
  @override
  final EWalletModel? ewallet;
  @override
  final VirtualAccountModel? virtualAccount;
  @override
  final String reusability;
  @override
  final String status;

  @override
  String toString() {
    return 'PaymentMethodModel(id: $id, type: $type, created: $created, updated: $updated, referenceId: $referenceId, ewallet: $ewallet, virtualAccount: $virtualAccount, reusability: $reusability, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodModelImpl &&
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

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      __$$PaymentMethodModelImplCopyWithImpl<_$PaymentMethodModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodModel implements PaymentMethodModel {
  const factory _PaymentMethodModel(
      {required final String id,
      required final String type,
      required final DateTime created,
      required final DateTime updated,
      required final String referenceId,
      final EWalletModel? ewallet,
      final VirtualAccountModel? virtualAccount,
      required final String reusability,
      required final String status}) = _$PaymentMethodModelImpl;

  factory _PaymentMethodModel.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodModelImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  DateTime get created;
  @override
  DateTime get updated;
  @override
  String get referenceId;
  @override
  EWalletModel? get ewallet;
  @override
  VirtualAccountModel? get virtualAccount;
  @override
  String get reusability;
  @override
  String get status;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EWalletModel _$EWalletModelFromJson(Map<String, dynamic> json) {
  return _EWalletModel.fromJson(json);
}

/// @nodoc
mixin _$EWalletModel {
  String get channelCode => throw _privateConstructorUsedError;
  ChannelPropertiesModel get channelProperties =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get account => throw _privateConstructorUsedError;

  /// Serializes this EWalletModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EWalletModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EWalletModelCopyWith<EWalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EWalletModelCopyWith<$Res> {
  factory $EWalletModelCopyWith(
          EWalletModel value, $Res Function(EWalletModel) then) =
      _$EWalletModelCopyWithImpl<$Res, EWalletModel>;
  @useResult
  $Res call(
      {String channelCode,
      ChannelPropertiesModel channelProperties,
      Map<String, dynamic>? account});

  $ChannelPropertiesModelCopyWith<$Res> get channelProperties;
}

/// @nodoc
class _$EWalletModelCopyWithImpl<$Res, $Val extends EWalletModel>
    implements $EWalletModelCopyWith<$Res> {
  _$EWalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EWalletModel
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
              as ChannelPropertiesModel,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  /// Create a copy of EWalletModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelPropertiesModelCopyWith<$Res> get channelProperties {
    return $ChannelPropertiesModelCopyWith<$Res>(_value.channelProperties,
        (value) {
      return _then(_value.copyWith(channelProperties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EWalletModelImplCopyWith<$Res>
    implements $EWalletModelCopyWith<$Res> {
  factory _$$EWalletModelImplCopyWith(
          _$EWalletModelImpl value, $Res Function(_$EWalletModelImpl) then) =
      __$$EWalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String channelCode,
      ChannelPropertiesModel channelProperties,
      Map<String, dynamic>? account});

  @override
  $ChannelPropertiesModelCopyWith<$Res> get channelProperties;
}

/// @nodoc
class __$$EWalletModelImplCopyWithImpl<$Res>
    extends _$EWalletModelCopyWithImpl<$Res, _$EWalletModelImpl>
    implements _$$EWalletModelImplCopyWith<$Res> {
  __$$EWalletModelImplCopyWithImpl(
      _$EWalletModelImpl _value, $Res Function(_$EWalletModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EWalletModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelCode = null,
    Object? channelProperties = null,
    Object? account = freezed,
  }) {
    return _then(_$EWalletModelImpl(
      channelCode: null == channelCode
          ? _value.channelCode
          : channelCode // ignore: cast_nullable_to_non_nullable
              as String,
      channelProperties: null == channelProperties
          ? _value.channelProperties
          : channelProperties // ignore: cast_nullable_to_non_nullable
              as ChannelPropertiesModel,
      account: freezed == account
          ? _value._account
          : account // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EWalletModelImpl implements _EWalletModel {
  const _$EWalletModelImpl(
      {required this.channelCode,
      required this.channelProperties,
      final Map<String, dynamic>? account})
      : _account = account;

  factory _$EWalletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EWalletModelImplFromJson(json);

  @override
  final String channelCode;
  @override
  final ChannelPropertiesModel channelProperties;
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
    return 'EWalletModel(channelCode: $channelCode, channelProperties: $channelProperties, account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EWalletModelImpl &&
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

  /// Create a copy of EWalletModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EWalletModelImplCopyWith<_$EWalletModelImpl> get copyWith =>
      __$$EWalletModelImplCopyWithImpl<_$EWalletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EWalletModelImplToJson(
      this,
    );
  }
}

abstract class _EWalletModel implements EWalletModel {
  const factory _EWalletModel(
      {required final String channelCode,
      required final ChannelPropertiesModel channelProperties,
      final Map<String, dynamic>? account}) = _$EWalletModelImpl;

  factory _EWalletModel.fromJson(Map<String, dynamic> json) =
      _$EWalletModelImpl.fromJson;

  @override
  String get channelCode;
  @override
  ChannelPropertiesModel get channelProperties;
  @override
  Map<String, dynamic>? get account;

  /// Create a copy of EWalletModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EWalletModelImplCopyWith<_$EWalletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VirtualAccountModel _$VirtualAccountModelFromJson(Map<String, dynamic> json) {
  return _VirtualAccountModel.fromJson(json);
}

/// @nodoc
mixin _$VirtualAccountModel {
  int get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get channelCode => throw _privateConstructorUsedError;
  VirtualAccountPropertiesModel get channelProperties =>
      throw _privateConstructorUsedError;

  /// Serializes this VirtualAccountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VirtualAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VirtualAccountModelCopyWith<VirtualAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VirtualAccountModelCopyWith<$Res> {
  factory $VirtualAccountModelCopyWith(
          VirtualAccountModel value, $Res Function(VirtualAccountModel) then) =
      _$VirtualAccountModelCopyWithImpl<$Res, VirtualAccountModel>;
  @useResult
  $Res call(
      {int amount,
      String currency,
      String channelCode,
      VirtualAccountPropertiesModel channelProperties});

  $VirtualAccountPropertiesModelCopyWith<$Res> get channelProperties;
}

/// @nodoc
class _$VirtualAccountModelCopyWithImpl<$Res, $Val extends VirtualAccountModel>
    implements $VirtualAccountModelCopyWith<$Res> {
  _$VirtualAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VirtualAccountModel
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
              as VirtualAccountPropertiesModel,
    ) as $Val);
  }

  /// Create a copy of VirtualAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VirtualAccountPropertiesModelCopyWith<$Res> get channelProperties {
    return $VirtualAccountPropertiesModelCopyWith<$Res>(
        _value.channelProperties, (value) {
      return _then(_value.copyWith(channelProperties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VirtualAccountModelImplCopyWith<$Res>
    implements $VirtualAccountModelCopyWith<$Res> {
  factory _$$VirtualAccountModelImplCopyWith(_$VirtualAccountModelImpl value,
          $Res Function(_$VirtualAccountModelImpl) then) =
      __$$VirtualAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int amount,
      String currency,
      String channelCode,
      VirtualAccountPropertiesModel channelProperties});

  @override
  $VirtualAccountPropertiesModelCopyWith<$Res> get channelProperties;
}

/// @nodoc
class __$$VirtualAccountModelImplCopyWithImpl<$Res>
    extends _$VirtualAccountModelCopyWithImpl<$Res, _$VirtualAccountModelImpl>
    implements _$$VirtualAccountModelImplCopyWith<$Res> {
  __$$VirtualAccountModelImplCopyWithImpl(_$VirtualAccountModelImpl _value,
      $Res Function(_$VirtualAccountModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VirtualAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
    Object? channelCode = null,
    Object? channelProperties = null,
  }) {
    return _then(_$VirtualAccountModelImpl(
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
              as VirtualAccountPropertiesModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VirtualAccountModelImpl implements _VirtualAccountModel {
  const _$VirtualAccountModelImpl(
      {required this.amount,
      required this.currency,
      required this.channelCode,
      required this.channelProperties});

  factory _$VirtualAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VirtualAccountModelImplFromJson(json);

  @override
  final int amount;
  @override
  final String currency;
  @override
  final String channelCode;
  @override
  final VirtualAccountPropertiesModel channelProperties;

  @override
  String toString() {
    return 'VirtualAccountModel(amount: $amount, currency: $currency, channelCode: $channelCode, channelProperties: $channelProperties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VirtualAccountModelImpl &&
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

  /// Create a copy of VirtualAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VirtualAccountModelImplCopyWith<_$VirtualAccountModelImpl> get copyWith =>
      __$$VirtualAccountModelImplCopyWithImpl<_$VirtualAccountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VirtualAccountModelImplToJson(
      this,
    );
  }
}

abstract class _VirtualAccountModel implements VirtualAccountModel {
  const factory _VirtualAccountModel(
          {required final int amount,
          required final String currency,
          required final String channelCode,
          required final VirtualAccountPropertiesModel channelProperties}) =
      _$VirtualAccountModelImpl;

  factory _VirtualAccountModel.fromJson(Map<String, dynamic> json) =
      _$VirtualAccountModelImpl.fromJson;

  @override
  int get amount;
  @override
  String get currency;
  @override
  String get channelCode;
  @override
  VirtualAccountPropertiesModel get channelProperties;

  /// Create a copy of VirtualAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VirtualAccountModelImplCopyWith<_$VirtualAccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VirtualAccountPropertiesModel _$VirtualAccountPropertiesModelFromJson(
    Map<String, dynamic> json) {
  return _VirtualAccountPropertiesModel.fromJson(json);
}

/// @nodoc
mixin _$VirtualAccountPropertiesModel {
  String get customerName => throw _privateConstructorUsedError;
  String get virtualAccountNumber => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this VirtualAccountPropertiesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VirtualAccountPropertiesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VirtualAccountPropertiesModelCopyWith<VirtualAccountPropertiesModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VirtualAccountPropertiesModelCopyWith<$Res> {
  factory $VirtualAccountPropertiesModelCopyWith(
          VirtualAccountPropertiesModel value,
          $Res Function(VirtualAccountPropertiesModel) then) =
      _$VirtualAccountPropertiesModelCopyWithImpl<$Res,
          VirtualAccountPropertiesModel>;
  @useResult
  $Res call(
      {String customerName, String virtualAccountNumber, DateTime expiresAt});
}

/// @nodoc
class _$VirtualAccountPropertiesModelCopyWithImpl<$Res,
        $Val extends VirtualAccountPropertiesModel>
    implements $VirtualAccountPropertiesModelCopyWith<$Res> {
  _$VirtualAccountPropertiesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VirtualAccountPropertiesModel
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
abstract class _$$VirtualAccountPropertiesModelImplCopyWith<$Res>
    implements $VirtualAccountPropertiesModelCopyWith<$Res> {
  factory _$$VirtualAccountPropertiesModelImplCopyWith(
          _$VirtualAccountPropertiesModelImpl value,
          $Res Function(_$VirtualAccountPropertiesModelImpl) then) =
      __$$VirtualAccountPropertiesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerName, String virtualAccountNumber, DateTime expiresAt});
}

/// @nodoc
class __$$VirtualAccountPropertiesModelImplCopyWithImpl<$Res>
    extends _$VirtualAccountPropertiesModelCopyWithImpl<$Res,
        _$VirtualAccountPropertiesModelImpl>
    implements _$$VirtualAccountPropertiesModelImplCopyWith<$Res> {
  __$$VirtualAccountPropertiesModelImplCopyWithImpl(
      _$VirtualAccountPropertiesModelImpl _value,
      $Res Function(_$VirtualAccountPropertiesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VirtualAccountPropertiesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? virtualAccountNumber = null,
    Object? expiresAt = null,
  }) {
    return _then(_$VirtualAccountPropertiesModelImpl(
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
class _$VirtualAccountPropertiesModelImpl
    implements _VirtualAccountPropertiesModel {
  const _$VirtualAccountPropertiesModelImpl(
      {required this.customerName,
      required this.virtualAccountNumber,
      required this.expiresAt});

  factory _$VirtualAccountPropertiesModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VirtualAccountPropertiesModelImplFromJson(json);

  @override
  final String customerName;
  @override
  final String virtualAccountNumber;
  @override
  final DateTime expiresAt;

  @override
  String toString() {
    return 'VirtualAccountPropertiesModel(customerName: $customerName, virtualAccountNumber: $virtualAccountNumber, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VirtualAccountPropertiesModelImpl &&
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

  /// Create a copy of VirtualAccountPropertiesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VirtualAccountPropertiesModelImplCopyWith<
          _$VirtualAccountPropertiesModelImpl>
      get copyWith => __$$VirtualAccountPropertiesModelImplCopyWithImpl<
          _$VirtualAccountPropertiesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VirtualAccountPropertiesModelImplToJson(
      this,
    );
  }
}

abstract class _VirtualAccountPropertiesModel
    implements VirtualAccountPropertiesModel {
  const factory _VirtualAccountPropertiesModel(
      {required final String customerName,
      required final String virtualAccountNumber,
      required final DateTime expiresAt}) = _$VirtualAccountPropertiesModelImpl;

  factory _VirtualAccountPropertiesModel.fromJson(Map<String, dynamic> json) =
      _$VirtualAccountPropertiesModelImpl.fromJson;

  @override
  String get customerName;
  @override
  String get virtualAccountNumber;
  @override
  DateTime get expiresAt;

  /// Create a copy of VirtualAccountPropertiesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VirtualAccountPropertiesModelImplCopyWith<
          _$VirtualAccountPropertiesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChannelPropertiesModel _$ChannelPropertiesModelFromJson(
    Map<String, dynamic> json) {
  return _ChannelPropertiesModel.fromJson(json);
}

/// @nodoc
mixin _$ChannelPropertiesModel {
  String get successReturnUrl => throw _privateConstructorUsedError;

  /// Serializes this ChannelPropertiesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelPropertiesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelPropertiesModelCopyWith<ChannelPropertiesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelPropertiesModelCopyWith<$Res> {
  factory $ChannelPropertiesModelCopyWith(ChannelPropertiesModel value,
          $Res Function(ChannelPropertiesModel) then) =
      _$ChannelPropertiesModelCopyWithImpl<$Res, ChannelPropertiesModel>;
  @useResult
  $Res call({String successReturnUrl});
}

/// @nodoc
class _$ChannelPropertiesModelCopyWithImpl<$Res,
        $Val extends ChannelPropertiesModel>
    implements $ChannelPropertiesModelCopyWith<$Res> {
  _$ChannelPropertiesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelPropertiesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successReturnUrl = null,
  }) {
    return _then(_value.copyWith(
      successReturnUrl: null == successReturnUrl
          ? _value.successReturnUrl
          : successReturnUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelPropertiesModelImplCopyWith<$Res>
    implements $ChannelPropertiesModelCopyWith<$Res> {
  factory _$$ChannelPropertiesModelImplCopyWith(
          _$ChannelPropertiesModelImpl value,
          $Res Function(_$ChannelPropertiesModelImpl) then) =
      __$$ChannelPropertiesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String successReturnUrl});
}

/// @nodoc
class __$$ChannelPropertiesModelImplCopyWithImpl<$Res>
    extends _$ChannelPropertiesModelCopyWithImpl<$Res,
        _$ChannelPropertiesModelImpl>
    implements _$$ChannelPropertiesModelImplCopyWith<$Res> {
  __$$ChannelPropertiesModelImplCopyWithImpl(
      _$ChannelPropertiesModelImpl _value,
      $Res Function(_$ChannelPropertiesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelPropertiesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successReturnUrl = null,
  }) {
    return _then(_$ChannelPropertiesModelImpl(
      successReturnUrl: null == successReturnUrl
          ? _value.successReturnUrl
          : successReturnUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelPropertiesModelImpl implements _ChannelPropertiesModel {
  const _$ChannelPropertiesModelImpl({required this.successReturnUrl});

  factory _$ChannelPropertiesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelPropertiesModelImplFromJson(json);

  @override
  final String successReturnUrl;

  @override
  String toString() {
    return 'ChannelPropertiesModel(successReturnUrl: $successReturnUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelPropertiesModelImpl &&
            (identical(other.successReturnUrl, successReturnUrl) ||
                other.successReturnUrl == successReturnUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, successReturnUrl);

  /// Create a copy of ChannelPropertiesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelPropertiesModelImplCopyWith<_$ChannelPropertiesModelImpl>
      get copyWith => __$$ChannelPropertiesModelImplCopyWithImpl<
          _$ChannelPropertiesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelPropertiesModelImplToJson(
      this,
    );
  }
}

abstract class _ChannelPropertiesModel implements ChannelPropertiesModel {
  const factory _ChannelPropertiesModel(
      {required final String successReturnUrl}) = _$ChannelPropertiesModelImpl;

  factory _ChannelPropertiesModel.fromJson(Map<String, dynamic> json) =
      _$ChannelPropertiesModelImpl.fromJson;

  @override
  String get successReturnUrl;

  /// Create a copy of ChannelPropertiesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelPropertiesModelImplCopyWith<_$ChannelPropertiesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentActionModel _$PaymentActionModelFromJson(Map<String, dynamic> json) {
  return _PaymentActionModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentActionModel {
  String? get action => throw _privateConstructorUsedError;
  String? get urlType => throw _privateConstructorUsedError;
  String? get method => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get qrCode => throw _privateConstructorUsedError;

  /// Serializes this PaymentActionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentActionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentActionModelCopyWith<PaymentActionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentActionModelCopyWith<$Res> {
  factory $PaymentActionModelCopyWith(
          PaymentActionModel value, $Res Function(PaymentActionModel) then) =
      _$PaymentActionModelCopyWithImpl<$Res, PaymentActionModel>;
  @useResult
  $Res call(
      {String? action,
      String? urlType,
      String? method,
      String? url,
      String? qrCode});
}

/// @nodoc
class _$PaymentActionModelCopyWithImpl<$Res, $Val extends PaymentActionModel>
    implements $PaymentActionModelCopyWith<$Res> {
  _$PaymentActionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentActionModel
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
abstract class _$$PaymentActionModelImplCopyWith<$Res>
    implements $PaymentActionModelCopyWith<$Res> {
  factory _$$PaymentActionModelImplCopyWith(_$PaymentActionModelImpl value,
          $Res Function(_$PaymentActionModelImpl) then) =
      __$$PaymentActionModelImplCopyWithImpl<$Res>;
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
class __$$PaymentActionModelImplCopyWithImpl<$Res>
    extends _$PaymentActionModelCopyWithImpl<$Res, _$PaymentActionModelImpl>
    implements _$$PaymentActionModelImplCopyWith<$Res> {
  __$$PaymentActionModelImplCopyWithImpl(_$PaymentActionModelImpl _value,
      $Res Function(_$PaymentActionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentActionModel
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
    return _then(_$PaymentActionModelImpl(
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
class _$PaymentActionModelImpl implements _PaymentActionModel {
  const _$PaymentActionModelImpl(
      {required this.action,
      required this.urlType,
      required this.method,
      required this.url,
      this.qrCode});

  factory _$PaymentActionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentActionModelImplFromJson(json);

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
    return 'PaymentActionModel(action: $action, urlType: $urlType, method: $method, url: $url, qrCode: $qrCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentActionModelImpl &&
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

  /// Create a copy of PaymentActionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentActionModelImplCopyWith<_$PaymentActionModelImpl> get copyWith =>
      __$$PaymentActionModelImplCopyWithImpl<_$PaymentActionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentActionModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentActionModel implements PaymentActionModel {
  const factory _PaymentActionModel(
      {required final String? action,
      required final String? urlType,
      required final String? method,
      required final String? url,
      final String? qrCode}) = _$PaymentActionModelImpl;

  factory _PaymentActionModel.fromJson(Map<String, dynamic> json) =
      _$PaymentActionModelImpl.fromJson;

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

  /// Create a copy of PaymentActionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentActionModelImplCopyWith<_$PaymentActionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListHistoryPurchaseModel _$ListHistoryPurchaseModelFromJson(
    Map<String, dynamic> json) {
  return _ListHistoryPurchaseModel.fromJson(json);
}

/// @nodoc
mixin _$ListHistoryPurchaseModel {
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

  /// Serializes this ListHistoryPurchaseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListHistoryPurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListHistoryPurchaseModelCopyWith<ListHistoryPurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListHistoryPurchaseModelCopyWith<$Res> {
  factory $ListHistoryPurchaseModelCopyWith(ListHistoryPurchaseModel value,
          $Res Function(ListHistoryPurchaseModel) then) =
      _$ListHistoryPurchaseModelCopyWithImpl<$Res, ListHistoryPurchaseModel>;
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
class _$ListHistoryPurchaseModelCopyWithImpl<$Res,
        $Val extends ListHistoryPurchaseModel>
    implements $ListHistoryPurchaseModelCopyWith<$Res> {
  _$ListHistoryPurchaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListHistoryPurchaseModel
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
abstract class _$$ListHistoryPurchaseModelImplCopyWith<$Res>
    implements $ListHistoryPurchaseModelCopyWith<$Res> {
  factory _$$ListHistoryPurchaseModelImplCopyWith(
          _$ListHistoryPurchaseModelImpl value,
          $Res Function(_$ListHistoryPurchaseModelImpl) then) =
      __$$ListHistoryPurchaseModelImplCopyWithImpl<$Res>;
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
class __$$ListHistoryPurchaseModelImplCopyWithImpl<$Res>
    extends _$ListHistoryPurchaseModelCopyWithImpl<$Res,
        _$ListHistoryPurchaseModelImpl>
    implements _$$ListHistoryPurchaseModelImplCopyWith<$Res> {
  __$$ListHistoryPurchaseModelImplCopyWithImpl(
      _$ListHistoryPurchaseModelImpl _value,
      $Res Function(_$ListHistoryPurchaseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListHistoryPurchaseModel
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
    return _then(_$ListHistoryPurchaseModelImpl(
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
class _$ListHistoryPurchaseModelImpl implements _ListHistoryPurchaseModel {
  const _$ListHistoryPurchaseModelImpl(
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

  factory _$ListHistoryPurchaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListHistoryPurchaseModelImplFromJson(json);

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
    return 'ListHistoryPurchaseModel(id: $id, paymentMethod: $paymentMethod, status: $status, paidAmount: $paidAmount, amount: $amount, period: $period, startPeriod: $startPeriod, endPeriod: $endPeriod, ownerId: $ownerId, externalId: $externalId, packageName: $packageName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListHistoryPurchaseModelImpl &&
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

  /// Create a copy of ListHistoryPurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListHistoryPurchaseModelImplCopyWith<_$ListHistoryPurchaseModelImpl>
      get copyWith => __$$ListHistoryPurchaseModelImplCopyWithImpl<
          _$ListHistoryPurchaseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListHistoryPurchaseModelImplToJson(
      this,
    );
  }
}

abstract class _ListHistoryPurchaseModel implements ListHistoryPurchaseModel {
  const factory _ListHistoryPurchaseModel(
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
      required final String updatedAt}) = _$ListHistoryPurchaseModelImpl;

  factory _ListHistoryPurchaseModel.fromJson(Map<String, dynamic> json) =
      _$ListHistoryPurchaseModelImpl.fromJson;

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

  /// Create a copy of ListHistoryPurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListHistoryPurchaseModelImplCopyWith<_$ListHistoryPurchaseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailPurchaseModel _$DetailPurchaseModelFromJson(Map<String, dynamic> json) {
  return _DetailPurchaseModel.fromJson(json);
}

/// @nodoc
mixin _$DetailPurchaseModel {
  PurchaseModel get purchase => throw _privateConstructorUsedError;
  PaymentRequestModel get paymentRequest => throw _privateConstructorUsedError;

  /// Serializes this DetailPurchaseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailPurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailPurchaseModelCopyWith<DetailPurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailPurchaseModelCopyWith<$Res> {
  factory $DetailPurchaseModelCopyWith(
          DetailPurchaseModel value, $Res Function(DetailPurchaseModel) then) =
      _$DetailPurchaseModelCopyWithImpl<$Res, DetailPurchaseModel>;
  @useResult
  $Res call({PurchaseModel purchase, PaymentRequestModel paymentRequest});

  $PurchaseModelCopyWith<$Res> get purchase;
  $PaymentRequestModelCopyWith<$Res> get paymentRequest;
}

/// @nodoc
class _$DetailPurchaseModelCopyWithImpl<$Res, $Val extends DetailPurchaseModel>
    implements $DetailPurchaseModelCopyWith<$Res> {
  _$DetailPurchaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailPurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
    Object? paymentRequest = null,
  }) {
    return _then(_value.copyWith(
      purchase: null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as PurchaseModel,
      paymentRequest: null == paymentRequest
          ? _value.paymentRequest
          : paymentRequest // ignore: cast_nullable_to_non_nullable
              as PaymentRequestModel,
    ) as $Val);
  }

  /// Create a copy of DetailPurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseModelCopyWith<$Res> get purchase {
    return $PurchaseModelCopyWith<$Res>(_value.purchase, (value) {
      return _then(_value.copyWith(purchase: value) as $Val);
    });
  }

  /// Create a copy of DetailPurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentRequestModelCopyWith<$Res> get paymentRequest {
    return $PaymentRequestModelCopyWith<$Res>(_value.paymentRequest, (value) {
      return _then(_value.copyWith(paymentRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailPurchaseModelImplCopyWith<$Res>
    implements $DetailPurchaseModelCopyWith<$Res> {
  factory _$$DetailPurchaseModelImplCopyWith(_$DetailPurchaseModelImpl value,
          $Res Function(_$DetailPurchaseModelImpl) then) =
      __$$DetailPurchaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PurchaseModel purchase, PaymentRequestModel paymentRequest});

  @override
  $PurchaseModelCopyWith<$Res> get purchase;
  @override
  $PaymentRequestModelCopyWith<$Res> get paymentRequest;
}

/// @nodoc
class __$$DetailPurchaseModelImplCopyWithImpl<$Res>
    extends _$DetailPurchaseModelCopyWithImpl<$Res, _$DetailPurchaseModelImpl>
    implements _$$DetailPurchaseModelImplCopyWith<$Res> {
  __$$DetailPurchaseModelImplCopyWithImpl(_$DetailPurchaseModelImpl _value,
      $Res Function(_$DetailPurchaseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailPurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
    Object? paymentRequest = null,
  }) {
    return _then(_$DetailPurchaseModelImpl(
      purchase: null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as PurchaseModel,
      paymentRequest: null == paymentRequest
          ? _value.paymentRequest
          : paymentRequest // ignore: cast_nullable_to_non_nullable
              as PaymentRequestModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailPurchaseModelImpl implements _DetailPurchaseModel {
  const _$DetailPurchaseModelImpl(
      {required this.purchase, required this.paymentRequest});

  factory _$DetailPurchaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailPurchaseModelImplFromJson(json);

  @override
  final PurchaseModel purchase;
  @override
  final PaymentRequestModel paymentRequest;

  @override
  String toString() {
    return 'DetailPurchaseModel(purchase: $purchase, paymentRequest: $paymentRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailPurchaseModelImpl &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase) &&
            (identical(other.paymentRequest, paymentRequest) ||
                other.paymentRequest == paymentRequest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, purchase, paymentRequest);

  /// Create a copy of DetailPurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailPurchaseModelImplCopyWith<_$DetailPurchaseModelImpl> get copyWith =>
      __$$DetailPurchaseModelImplCopyWithImpl<_$DetailPurchaseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailPurchaseModelImplToJson(
      this,
    );
  }
}

abstract class _DetailPurchaseModel implements DetailPurchaseModel {
  const factory _DetailPurchaseModel(
          {required final PurchaseModel purchase,
          required final PaymentRequestModel paymentRequest}) =
      _$DetailPurchaseModelImpl;

  factory _DetailPurchaseModel.fromJson(Map<String, dynamic> json) =
      _$DetailPurchaseModelImpl.fromJson;

  @override
  PurchaseModel get purchase;
  @override
  PaymentRequestModel get paymentRequest;

  /// Create a copy of DetailPurchaseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailPurchaseModelImplCopyWith<_$DetailPurchaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
