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

PackageActive _$PackageActiveFromJson(Map<String, dynamic> json) {
  return _PackageActive.fromJson(json);
}

/// @nodoc
mixin _$PackageActive {
  String get name => throw _privateConstructorUsedError;
  int? get orders => throw _privateConstructorUsedError;
  int? get products => throw _privateConstructorUsedError;
  int? get employees => throw _privateConstructorUsedError;
  int? get customers => throw _privateConstructorUsedError;
  int? get tables => throw _privateConstructorUsedError;
  int? get hardwareIntegration => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  Purchase? get purchase => throw _privateConstructorUsedError;
  String? get endPeriod => throw _privateConstructorUsedError;
  ActivePeriod get activePeriod => throw _privateConstructorUsedError;

  /// Serializes this PackageActive to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackageActive
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageActiveCopyWith<PackageActive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageActiveCopyWith<$Res> {
  factory $PackageActiveCopyWith(
          PackageActive value, $Res Function(PackageActive) then) =
      _$PackageActiveCopyWithImpl<$Res, PackageActive>;
  @useResult
  $Res call(
      {String name,
      int? orders,
      int? products,
      int? employees,
      int? customers,
      int? tables,
      int? hardwareIntegration,
      int price,
      Purchase? purchase,
      String? endPeriod,
      ActivePeriod activePeriod});

  $PurchaseCopyWith<$Res>? get purchase;
  $ActivePeriodCopyWith<$Res> get activePeriod;
}

/// @nodoc
class _$PackageActiveCopyWithImpl<$Res, $Val extends PackageActive>
    implements $PackageActiveCopyWith<$Res> {
  _$PackageActiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageActive
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
    Object? hardwareIntegration = freezed,
    Object? price = null,
    Object? purchase = freezed,
    Object? endPeriod = freezed,
    Object? activePeriod = null,
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
      hardwareIntegration: freezed == hardwareIntegration
          ? _value.hardwareIntegration
          : hardwareIntegration // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      purchase: freezed == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as Purchase?,
      endPeriod: freezed == endPeriod
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      activePeriod: null == activePeriod
          ? _value.activePeriod
          : activePeriod // ignore: cast_nullable_to_non_nullable
              as ActivePeriod,
    ) as $Val);
  }

  /// Create a copy of PackageActive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseCopyWith<$Res>? get purchase {
    if (_value.purchase == null) {
      return null;
    }

    return $PurchaseCopyWith<$Res>(_value.purchase!, (value) {
      return _then(_value.copyWith(purchase: value) as $Val);
    });
  }

  /// Create a copy of PackageActive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivePeriodCopyWith<$Res> get activePeriod {
    return $ActivePeriodCopyWith<$Res>(_value.activePeriod, (value) {
      return _then(_value.copyWith(activePeriod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PackageActiveImplCopyWith<$Res>
    implements $PackageActiveCopyWith<$Res> {
  factory _$$PackageActiveImplCopyWith(
          _$PackageActiveImpl value, $Res Function(_$PackageActiveImpl) then) =
      __$$PackageActiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int? orders,
      int? products,
      int? employees,
      int? customers,
      int? tables,
      int? hardwareIntegration,
      int price,
      Purchase? purchase,
      String? endPeriod,
      ActivePeriod activePeriod});

  @override
  $PurchaseCopyWith<$Res>? get purchase;
  @override
  $ActivePeriodCopyWith<$Res> get activePeriod;
}

/// @nodoc
class __$$PackageActiveImplCopyWithImpl<$Res>
    extends _$PackageActiveCopyWithImpl<$Res, _$PackageActiveImpl>
    implements _$$PackageActiveImplCopyWith<$Res> {
  __$$PackageActiveImplCopyWithImpl(
      _$PackageActiveImpl _value, $Res Function(_$PackageActiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageActive
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
    Object? hardwareIntegration = freezed,
    Object? price = null,
    Object? purchase = freezed,
    Object? endPeriod = freezed,
    Object? activePeriod = null,
  }) {
    return _then(_$PackageActiveImpl(
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
      hardwareIntegration: freezed == hardwareIntegration
          ? _value.hardwareIntegration
          : hardwareIntegration // ignore: cast_nullable_to_non_nullable
              as int?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      purchase: freezed == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as Purchase?,
      endPeriod: freezed == endPeriod
          ? _value.endPeriod
          : endPeriod // ignore: cast_nullable_to_non_nullable
              as String?,
      activePeriod: null == activePeriod
          ? _value.activePeriod
          : activePeriod // ignore: cast_nullable_to_non_nullable
              as ActivePeriod,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageActiveImpl implements _PackageActive {
  const _$PackageActiveImpl(
      {required this.name,
      this.orders,
      this.products,
      this.employees,
      this.customers,
      this.tables,
      this.hardwareIntegration,
      required this.price,
      this.purchase,
      this.endPeriod,
      required this.activePeriod});

  factory _$PackageActiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageActiveImplFromJson(json);

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
  final int? hardwareIntegration;
  @override
  final int price;
  @override
  final Purchase? purchase;
  @override
  final String? endPeriod;
  @override
  final ActivePeriod activePeriod;

  @override
  String toString() {
    return 'PackageActive(name: $name, orders: $orders, products: $products, employees: $employees, customers: $customers, tables: $tables, hardwareIntegration: $hardwareIntegration, price: $price, purchase: $purchase, endPeriod: $endPeriod, activePeriod: $activePeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageActiveImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.orders, orders) || other.orders == orders) &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.employees, employees) ||
                other.employees == employees) &&
            (identical(other.customers, customers) ||
                other.customers == customers) &&
            (identical(other.tables, tables) || other.tables == tables) &&
            (identical(other.hardwareIntegration, hardwareIntegration) ||
                other.hardwareIntegration == hardwareIntegration) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase) &&
            (identical(other.endPeriod, endPeriod) ||
                other.endPeriod == endPeriod) &&
            (identical(other.activePeriod, activePeriod) ||
                other.activePeriod == activePeriod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      orders,
      products,
      employees,
      customers,
      tables,
      hardwareIntegration,
      price,
      purchase,
      endPeriod,
      activePeriod);

  /// Create a copy of PackageActive
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageActiveImplCopyWith<_$PackageActiveImpl> get copyWith =>
      __$$PackageActiveImplCopyWithImpl<_$PackageActiveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageActiveImplToJson(
      this,
    );
  }
}

abstract class _PackageActive implements PackageActive {
  const factory _PackageActive(
      {required final String name,
      final int? orders,
      final int? products,
      final int? employees,
      final int? customers,
      final int? tables,
      final int? hardwareIntegration,
      required final int price,
      final Purchase? purchase,
      final String? endPeriod,
      required final ActivePeriod activePeriod}) = _$PackageActiveImpl;

  factory _PackageActive.fromJson(Map<String, dynamic> json) =
      _$PackageActiveImpl.fromJson;

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
  int? get hardwareIntegration;
  @override
  int get price;
  @override
  Purchase? get purchase;
  @override
  String? get endPeriod;
  @override
  ActivePeriod get activePeriod;

  /// Create a copy of PackageActive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageActiveImplCopyWith<_$PackageActiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Purchase _$PurchaseFromJson(Map<String, dynamic> json) {
  return _Purchase.fromJson(json);
}

/// @nodoc
mixin _$Purchase {
  String get id => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get paidAmount => throw _privateConstructorUsedError;
  int get period => throw _privateConstructorUsedError;
  DateTime get startPeriod => throw _privateConstructorUsedError;
  DateTime get endPeriod => throw _privateConstructorUsedError;

  /// Serializes this Purchase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Purchase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseCopyWith<Purchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseCopyWith<$Res> {
  factory $PurchaseCopyWith(Purchase value, $Res Function(Purchase) then) =
      _$PurchaseCopyWithImpl<$Res, Purchase>;
  @useResult
  $Res call(
      {String id,
      String paymentMethod,
      String paidAmount,
      int period,
      DateTime startPeriod,
      DateTime endPeriod});
}

/// @nodoc
class _$PurchaseCopyWithImpl<$Res, $Val extends Purchase>
    implements $PurchaseCopyWith<$Res> {
  _$PurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Purchase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethod = null,
    Object? paidAmount = null,
    Object? period = null,
    Object? startPeriod = null,
    Object? endPeriod = null,
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
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseImplCopyWith<$Res>
    implements $PurchaseCopyWith<$Res> {
  factory _$$PurchaseImplCopyWith(
          _$PurchaseImpl value, $Res Function(_$PurchaseImpl) then) =
      __$$PurchaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String paymentMethod,
      String paidAmount,
      int period,
      DateTime startPeriod,
      DateTime endPeriod});
}

/// @nodoc
class __$$PurchaseImplCopyWithImpl<$Res>
    extends _$PurchaseCopyWithImpl<$Res, _$PurchaseImpl>
    implements _$$PurchaseImplCopyWith<$Res> {
  __$$PurchaseImplCopyWithImpl(
      _$PurchaseImpl _value, $Res Function(_$PurchaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Purchase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentMethod = null,
    Object? paidAmount = null,
    Object? period = null,
    Object? startPeriod = null,
    Object? endPeriod = null,
  }) {
    return _then(_$PurchaseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseImpl implements _Purchase {
  const _$PurchaseImpl(
      {required this.id,
      required this.paymentMethod,
      required this.paidAmount,
      required this.period,
      required this.startPeriod,
      required this.endPeriod});

  factory _$PurchaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseImplFromJson(json);

  @override
  final String id;
  @override
  final String paymentMethod;
  @override
  final String paidAmount;
  @override
  final int period;
  @override
  final DateTime startPeriod;
  @override
  final DateTime endPeriod;

  @override
  String toString() {
    return 'Purchase(id: $id, paymentMethod: $paymentMethod, paidAmount: $paidAmount, period: $period, startPeriod: $startPeriod, endPeriod: $endPeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.startPeriod, startPeriod) ||
                other.startPeriod == startPeriod) &&
            (identical(other.endPeriod, endPeriod) ||
                other.endPeriod == endPeriod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, paymentMethod, paidAmount,
      period, startPeriod, endPeriod);

  /// Create a copy of Purchase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseImplCopyWith<_$PurchaseImpl> get copyWith =>
      __$$PurchaseImplCopyWithImpl<_$PurchaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseImplToJson(
      this,
    );
  }
}

abstract class _Purchase implements Purchase {
  const factory _Purchase(
      {required final String id,
      required final String paymentMethod,
      required final String paidAmount,
      required final int period,
      required final DateTime startPeriod,
      required final DateTime endPeriod}) = _$PurchaseImpl;

  factory _Purchase.fromJson(Map<String, dynamic> json) =
      _$PurchaseImpl.fromJson;

  @override
  String get id;
  @override
  String get paymentMethod;
  @override
  String get paidAmount;
  @override
  int get period;
  @override
  DateTime get startPeriod;
  @override
  DateTime get endPeriod;

  /// Create a copy of Purchase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseImplCopyWith<_$PurchaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ActivePeriod _$ActivePeriodFromJson(Map<String, dynamic> json) {
  return _ActivePeriod.fromJson(json);
}

/// @nodoc
mixin _$ActivePeriod {
  int? get months => throw _privateConstructorUsedError;
  int? get days => throw _privateConstructorUsedError;

  /// Serializes this ActivePeriod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivePeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivePeriodCopyWith<ActivePeriod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivePeriodCopyWith<$Res> {
  factory $ActivePeriodCopyWith(
          ActivePeriod value, $Res Function(ActivePeriod) then) =
      _$ActivePeriodCopyWithImpl<$Res, ActivePeriod>;
  @useResult
  $Res call({int? months, int? days});
}

/// @nodoc
class _$ActivePeriodCopyWithImpl<$Res, $Val extends ActivePeriod>
    implements $ActivePeriodCopyWith<$Res> {
  _$ActivePeriodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivePeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = freezed,
    Object? days = freezed,
  }) {
    return _then(_value.copyWith(
      months: freezed == months
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as int?,
      days: freezed == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivePeriodImplCopyWith<$Res>
    implements $ActivePeriodCopyWith<$Res> {
  factory _$$ActivePeriodImplCopyWith(
          _$ActivePeriodImpl value, $Res Function(_$ActivePeriodImpl) then) =
      __$$ActivePeriodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? months, int? days});
}

/// @nodoc
class __$$ActivePeriodImplCopyWithImpl<$Res>
    extends _$ActivePeriodCopyWithImpl<$Res, _$ActivePeriodImpl>
    implements _$$ActivePeriodImplCopyWith<$Res> {
  __$$ActivePeriodImplCopyWithImpl(
      _$ActivePeriodImpl _value, $Res Function(_$ActivePeriodImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivePeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = freezed,
    Object? days = freezed,
  }) {
    return _then(_$ActivePeriodImpl(
      months: freezed == months
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as int?,
      days: freezed == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivePeriodImpl implements _ActivePeriod {
  const _$ActivePeriodImpl({this.months, this.days});

  factory _$ActivePeriodImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivePeriodImplFromJson(json);

  @override
  final int? months;
  @override
  final int? days;

  @override
  String toString() {
    return 'ActivePeriod(months: $months, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivePeriodImpl &&
            (identical(other.months, months) || other.months == months) &&
            (identical(other.days, days) || other.days == days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, months, days);

  /// Create a copy of ActivePeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivePeriodImplCopyWith<_$ActivePeriodImpl> get copyWith =>
      __$$ActivePeriodImplCopyWithImpl<_$ActivePeriodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivePeriodImplToJson(
      this,
    );
  }
}

abstract class _ActivePeriod implements ActivePeriod {
  const factory _ActivePeriod({final int? months, final int? days}) =
      _$ActivePeriodImpl;

  factory _ActivePeriod.fromJson(Map<String, dynamic> json) =
      _$ActivePeriodImpl.fromJson;

  @override
  int? get months;
  @override
  int? get days;

  /// Create a copy of ActivePeriod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivePeriodImplCopyWith<_$ActivePeriodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
