// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateOrderDto _$CreateOrderDtoFromJson(Map<String, dynamic> json) {
  return _CreateOrderDto.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderDto {
  @JsonKey(name: "customer_name")
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_phone_number")
  String get customerPhoneNumber => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_method")
  String get paymentMethod => throw _privateConstructorUsedError;
  List<CreateOrderProductDto> get products =>
      throw _privateConstructorUsedError;

  /// Serializes this CreateOrderDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateOrderDtoCopyWith<CreateOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderDtoCopyWith<$Res> {
  factory $CreateOrderDtoCopyWith(
          CreateOrderDto value, $Res Function(CreateOrderDto) then) =
      _$CreateOrderDtoCopyWithImpl<$Res, CreateOrderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "customer_name") String customerName,
      @JsonKey(name: "customer_phone_number") String customerPhoneNumber,
      String address,
      double latitude,
      double longitude,
      @JsonKey(name: "payment_method") String paymentMethod,
      List<CreateOrderProductDto> products});
}

/// @nodoc
class _$CreateOrderDtoCopyWithImpl<$Res, $Val extends CreateOrderDto>
    implements $CreateOrderDtoCopyWith<$Res> {
  _$CreateOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? customerPhoneNumber = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? paymentMethod = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhoneNumber: null == customerPhoneNumber
          ? _value.customerPhoneNumber
          : customerPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CreateOrderProductDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOrderDtoImplCopyWith<$Res>
    implements $CreateOrderDtoCopyWith<$Res> {
  factory _$$CreateOrderDtoImplCopyWith(_$CreateOrderDtoImpl value,
          $Res Function(_$CreateOrderDtoImpl) then) =
      __$$CreateOrderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "customer_name") String customerName,
      @JsonKey(name: "customer_phone_number") String customerPhoneNumber,
      String address,
      double latitude,
      double longitude,
      @JsonKey(name: "payment_method") String paymentMethod,
      List<CreateOrderProductDto> products});
}

/// @nodoc
class __$$CreateOrderDtoImplCopyWithImpl<$Res>
    extends _$CreateOrderDtoCopyWithImpl<$Res, _$CreateOrderDtoImpl>
    implements _$$CreateOrderDtoImplCopyWith<$Res> {
  __$$CreateOrderDtoImplCopyWithImpl(
      _$CreateOrderDtoImpl _value, $Res Function(_$CreateOrderDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? customerPhoneNumber = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? paymentMethod = null,
    Object? products = null,
  }) {
    return _then(_$CreateOrderDtoImpl(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhoneNumber: null == customerPhoneNumber
          ? _value.customerPhoneNumber
          : customerPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CreateOrderProductDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderDtoImpl implements _CreateOrderDto {
  const _$CreateOrderDtoImpl(
      {@JsonKey(name: "customer_name") required this.customerName,
      @JsonKey(name: "customer_phone_number") required this.customerPhoneNumber,
      required this.address,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: "payment_method") required this.paymentMethod,
      required final List<CreateOrderProductDto> products})
      : _products = products;

  factory _$CreateOrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderDtoImplFromJson(json);

  @override
  @JsonKey(name: "customer_name")
  final String customerName;
  @override
  @JsonKey(name: "customer_phone_number")
  final String customerPhoneNumber;
  @override
  final String address;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: "payment_method")
  final String paymentMethod;
  final List<CreateOrderProductDto> _products;
  @override
  List<CreateOrderProductDto> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CreateOrderDto(customerName: $customerName, customerPhoneNumber: $customerPhoneNumber, address: $address, latitude: $latitude, longitude: $longitude, paymentMethod: $paymentMethod, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderDtoImpl &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhoneNumber, customerPhoneNumber) ||
                other.customerPhoneNumber == customerPhoneNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerName,
      customerPhoneNumber,
      address,
      latitude,
      longitude,
      paymentMethod,
      const DeepCollectionEquality().hash(_products));

  /// Create a copy of CreateOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderDtoImplCopyWith<_$CreateOrderDtoImpl> get copyWith =>
      __$$CreateOrderDtoImplCopyWithImpl<_$CreateOrderDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateOrderDto implements CreateOrderDto {
  const factory _CreateOrderDto(
          {@JsonKey(name: "customer_name") required final String customerName,
          @JsonKey(name: "customer_phone_number")
          required final String customerPhoneNumber,
          required final String address,
          required final double latitude,
          required final double longitude,
          @JsonKey(name: "payment_method") required final String paymentMethod,
          required final List<CreateOrderProductDto> products}) =
      _$CreateOrderDtoImpl;

  factory _CreateOrderDto.fromJson(Map<String, dynamic> json) =
      _$CreateOrderDtoImpl.fromJson;

  @override
  @JsonKey(name: "customer_name")
  String get customerName;
  @override
  @JsonKey(name: "customer_phone_number")
  String get customerPhoneNumber;
  @override
  String get address;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: "payment_method")
  String get paymentMethod;
  @override
  List<CreateOrderProductDto> get products;

  /// Create a copy of CreateOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOrderDtoImplCopyWith<_$CreateOrderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateOrderProductDto _$CreateOrderProductDtoFromJson(
    Map<String, dynamic> json) {
  return _CreateOrderProductDto.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderProductDto {
  String get id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this CreateOrderProductDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateOrderProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateOrderProductDtoCopyWith<CreateOrderProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderProductDtoCopyWith<$Res> {
  factory $CreateOrderProductDtoCopyWith(CreateOrderProductDto value,
          $Res Function(CreateOrderProductDto) then) =
      _$CreateOrderProductDtoCopyWithImpl<$Res, CreateOrderProductDto>;
  @useResult
  $Res call({String id, int quantity});
}

/// @nodoc
class _$CreateOrderProductDtoCopyWithImpl<$Res,
        $Val extends CreateOrderProductDto>
    implements $CreateOrderProductDtoCopyWith<$Res> {
  _$CreateOrderProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateOrderProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOrderProductDtoImplCopyWith<$Res>
    implements $CreateOrderProductDtoCopyWith<$Res> {
  factory _$$CreateOrderProductDtoImplCopyWith(
          _$CreateOrderProductDtoImpl value,
          $Res Function(_$CreateOrderProductDtoImpl) then) =
      __$$CreateOrderProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int quantity});
}

/// @nodoc
class __$$CreateOrderProductDtoImplCopyWithImpl<$Res>
    extends _$CreateOrderProductDtoCopyWithImpl<$Res,
        _$CreateOrderProductDtoImpl>
    implements _$$CreateOrderProductDtoImplCopyWith<$Res> {
  __$$CreateOrderProductDtoImplCopyWithImpl(_$CreateOrderProductDtoImpl _value,
      $Res Function(_$CreateOrderProductDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateOrderProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
  }) {
    return _then(_$CreateOrderProductDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderProductDtoImpl implements _CreateOrderProductDto {
  const _$CreateOrderProductDtoImpl({required this.id, required this.quantity});

  factory _$CreateOrderProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderProductDtoImplFromJson(json);

  @override
  final String id;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CreateOrderProductDto(id: $id, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderProductDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity);

  /// Create a copy of CreateOrderProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderProductDtoImplCopyWith<_$CreateOrderProductDtoImpl>
      get copyWith => __$$CreateOrderProductDtoImplCopyWithImpl<
          _$CreateOrderProductDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderProductDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateOrderProductDto implements CreateOrderProductDto {
  const factory _CreateOrderProductDto(
      {required final String id,
      required final int quantity}) = _$CreateOrderProductDtoImpl;

  factory _CreateOrderProductDto.fromJson(Map<String, dynamic> json) =
      _$CreateOrderProductDtoImpl.fromJson;

  @override
  String get id;
  @override
  int get quantity;

  /// Create a copy of CreateOrderProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOrderProductDtoImplCopyWith<_$CreateOrderProductDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
