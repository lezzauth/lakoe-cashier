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
  int get employees => throw _privateConstructorUsedError;
  int? get customers => throw _privateConstructorUsedError;
  int get tables => throw _privateConstructorUsedError;
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
      int employees,
      int? customers,
      int tables,
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
    Object? employees = null,
    Object? customers = freezed,
    Object? tables = null,
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
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int,
      customers: freezed == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as int?,
      tables: null == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as int,
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
      int employees,
      int? customers,
      int tables,
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
    Object? employees = null,
    Object? customers = freezed,
    Object? tables = null,
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
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as int,
      customers: freezed == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as int?,
      tables: null == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as int,
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
      required this.employees,
      this.customers,
      required this.tables,
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
  final int employees;
  @override
  final int? customers;
  @override
  final int tables;
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
      required final int employees,
      final int? customers,
      required final int tables,
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
  int get employees;
  @override
  int? get customers;
  @override
  int get tables;
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
