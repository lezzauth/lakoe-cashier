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

OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) {
  return _OrderItemDto.fromJson(json);
}

/// @nodoc
mixin _$OrderItemDto {
  String get notes => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemDtoCopyWith<OrderItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemDtoCopyWith<$Res> {
  factory $OrderItemDtoCopyWith(
          OrderItemDto value, $Res Function(OrderItemDto) then) =
      _$OrderItemDtoCopyWithImpl<$Res, OrderItemDto>;
  @useResult
  $Res call({String notes, int quantity, String productId});
}

/// @nodoc
class _$OrderItemDtoCopyWithImpl<$Res, $Val extends OrderItemDto>
    implements $OrderItemDtoCopyWith<$Res> {
  _$OrderItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? quantity = null,
    Object? productId = null,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemDtoImplCopyWith<$Res>
    implements $OrderItemDtoCopyWith<$Res> {
  factory _$$OrderItemDtoImplCopyWith(
          _$OrderItemDtoImpl value, $Res Function(_$OrderItemDtoImpl) then) =
      __$$OrderItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String notes, int quantity, String productId});
}

/// @nodoc
class __$$OrderItemDtoImplCopyWithImpl<$Res>
    extends _$OrderItemDtoCopyWithImpl<$Res, _$OrderItemDtoImpl>
    implements _$$OrderItemDtoImplCopyWith<$Res> {
  __$$OrderItemDtoImplCopyWithImpl(
      _$OrderItemDtoImpl _value, $Res Function(_$OrderItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? quantity = null,
    Object? productId = null,
  }) {
    return _then(_$OrderItemDtoImpl(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemDtoImpl implements _OrderItemDto {
  const _$OrderItemDtoImpl(
      {this.notes = "", required this.quantity, required this.productId});

  factory _$OrderItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemDtoImplFromJson(json);

  @override
  @JsonKey()
  final String notes;
  @override
  final int quantity;
  @override
  final String productId;

  @override
  String toString() {
    return 'OrderItemDto(notes: $notes, quantity: $quantity, productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemDtoImpl &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notes, quantity, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemDtoImplCopyWith<_$OrderItemDtoImpl> get copyWith =>
      __$$OrderItemDtoImplCopyWithImpl<_$OrderItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderItemDto implements OrderItemDto {
  const factory _OrderItemDto(
      {final String notes,
      required final int quantity,
      required final String productId}) = _$OrderItemDtoImpl;

  factory _OrderItemDto.fromJson(Map<String, dynamic> json) =
      _$OrderItemDtoImpl.fromJson;

  @override
  String get notes;
  @override
  int get quantity;
  @override
  String get productId;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemDtoImplCopyWith<_$OrderItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaveOrderDto _$SaveOrderDtoFromJson(Map<String, dynamic> json) {
  return _SaveOrderDto.fromJson(json);
}

/// @nodoc
mixin _$SaveOrderDto {
  String get outletId => throw _privateConstructorUsedError;
  List<OrderItemDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaveOrderDtoCopyWith<SaveOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveOrderDtoCopyWith<$Res> {
  factory $SaveOrderDtoCopyWith(
          SaveOrderDto value, $Res Function(SaveOrderDto) then) =
      _$SaveOrderDtoCopyWithImpl<$Res, SaveOrderDto>;
  @useResult
  $Res call({String outletId, List<OrderItemDto> items});
}

/// @nodoc
class _$SaveOrderDtoCopyWithImpl<$Res, $Val extends SaveOrderDto>
    implements $SaveOrderDtoCopyWith<$Res> {
  _$SaveOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaveOrderDtoImplCopyWith<$Res>
    implements $SaveOrderDtoCopyWith<$Res> {
  factory _$$SaveOrderDtoImplCopyWith(
          _$SaveOrderDtoImpl value, $Res Function(_$SaveOrderDtoImpl) then) =
      __$$SaveOrderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String outletId, List<OrderItemDto> items});
}

/// @nodoc
class __$$SaveOrderDtoImplCopyWithImpl<$Res>
    extends _$SaveOrderDtoCopyWithImpl<$Res, _$SaveOrderDtoImpl>
    implements _$$SaveOrderDtoImplCopyWith<$Res> {
  __$$SaveOrderDtoImplCopyWithImpl(
      _$SaveOrderDtoImpl _value, $Res Function(_$SaveOrderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
    Object? items = null,
  }) {
    return _then(_$SaveOrderDtoImpl(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaveOrderDtoImpl implements _SaveOrderDto {
  const _$SaveOrderDtoImpl(
      {required this.outletId, required final List<OrderItemDto> items})
      : _items = items;

  factory _$SaveOrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveOrderDtoImplFromJson(json);

  @override
  final String outletId;
  final List<OrderItemDto> _items;
  @override
  List<OrderItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'SaveOrderDto(outletId: $outletId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveOrderDtoImpl &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, outletId, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveOrderDtoImplCopyWith<_$SaveOrderDtoImpl> get copyWith =>
      __$$SaveOrderDtoImplCopyWithImpl<_$SaveOrderDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveOrderDtoImplToJson(
      this,
    );
  }
}

abstract class _SaveOrderDto implements SaveOrderDto {
  const factory _SaveOrderDto(
      {required final String outletId,
      required final List<OrderItemDto> items}) = _$SaveOrderDtoImpl;

  factory _SaveOrderDto.fromJson(Map<String, dynamic> json) =
      _$SaveOrderDtoImpl.fromJson;

  @override
  String get outletId;
  @override
  List<OrderItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$SaveOrderDtoImplCopyWith<_$SaveOrderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CompleteOrderDto _$CompleteOrderDtoFromJson(Map<String, dynamic> json) {
  return _CompleteOrderDto.fromJson(json);
}

/// @nodoc
mixin _$CompleteOrderDto {
  String get paymentMethod => throw _privateConstructorUsedError;
  int get paidAmount => throw _privateConstructorUsedError;
  int get change => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompleteOrderDtoCopyWith<CompleteOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteOrderDtoCopyWith<$Res> {
  factory $CompleteOrderDtoCopyWith(
          CompleteOrderDto value, $Res Function(CompleteOrderDto) then) =
      _$CompleteOrderDtoCopyWithImpl<$Res, CompleteOrderDto>;
  @useResult
  $Res call({String paymentMethod, int paidAmount, int change});
}

/// @nodoc
class _$CompleteOrderDtoCopyWithImpl<$Res, $Val extends CompleteOrderDto>
    implements $CompleteOrderDtoCopyWith<$Res> {
  _$CompleteOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = null,
    Object? paidAmount = null,
    Object? change = null,
  }) {
    return _then(_value.copyWith(
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as int,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompleteOrderDtoImplCopyWith<$Res>
    implements $CompleteOrderDtoCopyWith<$Res> {
  factory _$$CompleteOrderDtoImplCopyWith(_$CompleteOrderDtoImpl value,
          $Res Function(_$CompleteOrderDtoImpl) then) =
      __$$CompleteOrderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String paymentMethod, int paidAmount, int change});
}

/// @nodoc
class __$$CompleteOrderDtoImplCopyWithImpl<$Res>
    extends _$CompleteOrderDtoCopyWithImpl<$Res, _$CompleteOrderDtoImpl>
    implements _$$CompleteOrderDtoImplCopyWith<$Res> {
  __$$CompleteOrderDtoImplCopyWithImpl(_$CompleteOrderDtoImpl _value,
      $Res Function(_$CompleteOrderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = null,
    Object? paidAmount = null,
    Object? change = null,
  }) {
    return _then(_$CompleteOrderDtoImpl(
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as int,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompleteOrderDtoImpl implements _CompleteOrderDto {
  const _$CompleteOrderDtoImpl(
      {required this.paymentMethod,
      required this.paidAmount,
      required this.change});

  factory _$CompleteOrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompleteOrderDtoImplFromJson(json);

  @override
  final String paymentMethod;
  @override
  final int paidAmount;
  @override
  final int change;

  @override
  String toString() {
    return 'CompleteOrderDto(paymentMethod: $paymentMethod, paidAmount: $paidAmount, change: $change)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteOrderDtoImpl &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.change, change) || other.change == change));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentMethod, paidAmount, change);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteOrderDtoImplCopyWith<_$CompleteOrderDtoImpl> get copyWith =>
      __$$CompleteOrderDtoImplCopyWithImpl<_$CompleteOrderDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompleteOrderDtoImplToJson(
      this,
    );
  }
}

abstract class _CompleteOrderDto implements CompleteOrderDto {
  const factory _CompleteOrderDto(
      {required final String paymentMethod,
      required final int paidAmount,
      required final int change}) = _$CompleteOrderDtoImpl;

  factory _CompleteOrderDto.fromJson(Map<String, dynamic> json) =
      _$CompleteOrderDtoImpl.fromJson;

  @override
  String get paymentMethod;
  @override
  int get paidAmount;
  @override
  int get change;
  @override
  @JsonKey(ignore: true)
  _$$CompleteOrderDtoImplCopyWith<_$CompleteOrderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenCashierDto _$OpenCashierDtoFromJson(Map<String, dynamic> json) {
  return _OpenCashierDto.fromJson(json);
}

/// @nodoc
mixin _$OpenCashierDto {
  int get initialBalance => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenCashierDtoCopyWith<OpenCashierDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenCashierDtoCopyWith<$Res> {
  factory $OpenCashierDtoCopyWith(
          OpenCashierDto value, $Res Function(OpenCashierDto) then) =
      _$OpenCashierDtoCopyWithImpl<$Res, OpenCashierDto>;
  @useResult
  $Res call({int initialBalance, String outletId, String pin});
}

/// @nodoc
class _$OpenCashierDtoCopyWithImpl<$Res, $Val extends OpenCashierDto>
    implements $OpenCashierDtoCopyWith<$Res> {
  _$OpenCashierDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialBalance = null,
    Object? outletId = null,
    Object? pin = null,
  }) {
    return _then(_value.copyWith(
      initialBalance: null == initialBalance
          ? _value.initialBalance
          : initialBalance // ignore: cast_nullable_to_non_nullable
              as int,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenCashierDtoImplCopyWith<$Res>
    implements $OpenCashierDtoCopyWith<$Res> {
  factory _$$OpenCashierDtoImplCopyWith(_$OpenCashierDtoImpl value,
          $Res Function(_$OpenCashierDtoImpl) then) =
      __$$OpenCashierDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int initialBalance, String outletId, String pin});
}

/// @nodoc
class __$$OpenCashierDtoImplCopyWithImpl<$Res>
    extends _$OpenCashierDtoCopyWithImpl<$Res, _$OpenCashierDtoImpl>
    implements _$$OpenCashierDtoImplCopyWith<$Res> {
  __$$OpenCashierDtoImplCopyWithImpl(
      _$OpenCashierDtoImpl _value, $Res Function(_$OpenCashierDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialBalance = null,
    Object? outletId = null,
    Object? pin = null,
  }) {
    return _then(_$OpenCashierDtoImpl(
      initialBalance: null == initialBalance
          ? _value.initialBalance
          : initialBalance // ignore: cast_nullable_to_non_nullable
              as int,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenCashierDtoImpl implements _OpenCashierDto {
  const _$OpenCashierDtoImpl(
      {required this.initialBalance,
      required this.outletId,
      required this.pin});

  factory _$OpenCashierDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenCashierDtoImplFromJson(json);

  @override
  final int initialBalance;
  @override
  final String outletId;
  @override
  final String pin;

  @override
  String toString() {
    return 'OpenCashierDto(initialBalance: $initialBalance, outletId: $outletId, pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenCashierDtoImpl &&
            (identical(other.initialBalance, initialBalance) ||
                other.initialBalance == initialBalance) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, initialBalance, outletId, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenCashierDtoImplCopyWith<_$OpenCashierDtoImpl> get copyWith =>
      __$$OpenCashierDtoImplCopyWithImpl<_$OpenCashierDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenCashierDtoImplToJson(
      this,
    );
  }
}

abstract class _OpenCashierDto implements OpenCashierDto {
  const factory _OpenCashierDto(
      {required final int initialBalance,
      required final String outletId,
      required final String pin}) = _$OpenCashierDtoImpl;

  factory _OpenCashierDto.fromJson(Map<String, dynamic> json) =
      _$OpenCashierDtoImpl.fromJson;

  @override
  int get initialBalance;
  @override
  String get outletId;
  @override
  String get pin;
  @override
  @JsonKey(ignore: true)
  _$$OpenCashierDtoImplCopyWith<_$OpenCashierDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenerateTokenDto _$GenerateTokenDtoFromJson(Map<String, dynamic> json) {
  return _GenerateTokenDto.fromJson(json);
}

/// @nodoc
mixin _$GenerateTokenDto {
  String get outletId => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateTokenDtoCopyWith<GenerateTokenDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateTokenDtoCopyWith<$Res> {
  factory $GenerateTokenDtoCopyWith(
          GenerateTokenDto value, $Res Function(GenerateTokenDto) then) =
      _$GenerateTokenDtoCopyWithImpl<$Res, GenerateTokenDto>;
  @useResult
  $Res call({String outletId, String pin});
}

/// @nodoc
class _$GenerateTokenDtoCopyWithImpl<$Res, $Val extends GenerateTokenDto>
    implements $GenerateTokenDtoCopyWith<$Res> {
  _$GenerateTokenDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
    Object? pin = null,
  }) {
    return _then(_value.copyWith(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateTokenDtoImplCopyWith<$Res>
    implements $GenerateTokenDtoCopyWith<$Res> {
  factory _$$GenerateTokenDtoImplCopyWith(_$GenerateTokenDtoImpl value,
          $Res Function(_$GenerateTokenDtoImpl) then) =
      __$$GenerateTokenDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String outletId, String pin});
}

/// @nodoc
class __$$GenerateTokenDtoImplCopyWithImpl<$Res>
    extends _$GenerateTokenDtoCopyWithImpl<$Res, _$GenerateTokenDtoImpl>
    implements _$$GenerateTokenDtoImplCopyWith<$Res> {
  __$$GenerateTokenDtoImplCopyWithImpl(_$GenerateTokenDtoImpl _value,
      $Res Function(_$GenerateTokenDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
    Object? pin = null,
  }) {
    return _then(_$GenerateTokenDtoImpl(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateTokenDtoImpl implements _GenerateTokenDto {
  const _$GenerateTokenDtoImpl({required this.outletId, required this.pin});

  factory _$GenerateTokenDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateTokenDtoImplFromJson(json);

  @override
  final String outletId;
  @override
  final String pin;

  @override
  String toString() {
    return 'GenerateTokenDto(outletId: $outletId, pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateTokenDtoImpl &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, outletId, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateTokenDtoImplCopyWith<_$GenerateTokenDtoImpl> get copyWith =>
      __$$GenerateTokenDtoImplCopyWithImpl<_$GenerateTokenDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateTokenDtoImplToJson(
      this,
    );
  }
}

abstract class _GenerateTokenDto implements GenerateTokenDto {
  const factory _GenerateTokenDto(
      {required final String outletId,
      required final String pin}) = _$GenerateTokenDtoImpl;

  factory _GenerateTokenDto.fromJson(Map<String, dynamic> json) =
      _$GenerateTokenDtoImpl.fromJson;

  @override
  String get outletId;
  @override
  String get pin;
  @override
  @JsonKey(ignore: true)
  _$$GenerateTokenDtoImplCopyWith<_$GenerateTokenDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CloseCashierDto _$CloseCashierDtoFromJson(Map<String, dynamic> json) {
  return _CloseCashierDto.fromJson(json);
}

/// @nodoc
mixin _$CloseCashierDto {
  int get finalBalance => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloseCashierDtoCopyWith<CloseCashierDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloseCashierDtoCopyWith<$Res> {
  factory $CloseCashierDtoCopyWith(
          CloseCashierDto value, $Res Function(CloseCashierDto) then) =
      _$CloseCashierDtoCopyWithImpl<$Res, CloseCashierDto>;
  @useResult
  $Res call({int finalBalance, String outletId});
}

/// @nodoc
class _$CloseCashierDtoCopyWithImpl<$Res, $Val extends CloseCashierDto>
    implements $CloseCashierDtoCopyWith<$Res> {
  _$CloseCashierDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finalBalance = null,
    Object? outletId = null,
  }) {
    return _then(_value.copyWith(
      finalBalance: null == finalBalance
          ? _value.finalBalance
          : finalBalance // ignore: cast_nullable_to_non_nullable
              as int,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloseCashierDtoImplCopyWith<$Res>
    implements $CloseCashierDtoCopyWith<$Res> {
  factory _$$CloseCashierDtoImplCopyWith(_$CloseCashierDtoImpl value,
          $Res Function(_$CloseCashierDtoImpl) then) =
      __$$CloseCashierDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int finalBalance, String outletId});
}

/// @nodoc
class __$$CloseCashierDtoImplCopyWithImpl<$Res>
    extends _$CloseCashierDtoCopyWithImpl<$Res, _$CloseCashierDtoImpl>
    implements _$$CloseCashierDtoImplCopyWith<$Res> {
  __$$CloseCashierDtoImplCopyWithImpl(
      _$CloseCashierDtoImpl _value, $Res Function(_$CloseCashierDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finalBalance = null,
    Object? outletId = null,
  }) {
    return _then(_$CloseCashierDtoImpl(
      finalBalance: null == finalBalance
          ? _value.finalBalance
          : finalBalance // ignore: cast_nullable_to_non_nullable
              as int,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CloseCashierDtoImpl implements _CloseCashierDto {
  const _$CloseCashierDtoImpl(
      {required this.finalBalance, required this.outletId});

  factory _$CloseCashierDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CloseCashierDtoImplFromJson(json);

  @override
  final int finalBalance;
  @override
  final String outletId;

  @override
  String toString() {
    return 'CloseCashierDto(finalBalance: $finalBalance, outletId: $outletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloseCashierDtoImpl &&
            (identical(other.finalBalance, finalBalance) ||
                other.finalBalance == finalBalance) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, finalBalance, outletId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloseCashierDtoImplCopyWith<_$CloseCashierDtoImpl> get copyWith =>
      __$$CloseCashierDtoImplCopyWithImpl<_$CloseCashierDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CloseCashierDtoImplToJson(
      this,
    );
  }
}

abstract class _CloseCashierDto implements CloseCashierDto {
  const factory _CloseCashierDto(
      {required final int finalBalance,
      required final String outletId}) = _$CloseCashierDtoImpl;

  factory _CloseCashierDto.fromJson(Map<String, dynamic> json) =
      _$CloseCashierDtoImpl.fromJson;

  @override
  int get finalBalance;
  @override
  String get outletId;
  @override
  @JsonKey(ignore: true)
  _$$CloseCashierDtoImplCopyWith<_$CloseCashierDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PreviewOrderPriceDto _$PreviewOrderPriceDtoFromJson(Map<String, dynamic> json) {
  return _PreviewOrderPriceDto.fromJson(json);
}

/// @nodoc
mixin _$PreviewOrderPriceDto {
  String get outletId => throw _privateConstructorUsedError;
  List<OrderItemDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreviewOrderPriceDtoCopyWith<PreviewOrderPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewOrderPriceDtoCopyWith<$Res> {
  factory $PreviewOrderPriceDtoCopyWith(PreviewOrderPriceDto value,
          $Res Function(PreviewOrderPriceDto) then) =
      _$PreviewOrderPriceDtoCopyWithImpl<$Res, PreviewOrderPriceDto>;
  @useResult
  $Res call({String outletId, List<OrderItemDto> items});
}

/// @nodoc
class _$PreviewOrderPriceDtoCopyWithImpl<$Res,
        $Val extends PreviewOrderPriceDto>
    implements $PreviewOrderPriceDtoCopyWith<$Res> {
  _$PreviewOrderPriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreviewOrderPriceDtoImplCopyWith<$Res>
    implements $PreviewOrderPriceDtoCopyWith<$Res> {
  factory _$$PreviewOrderPriceDtoImplCopyWith(_$PreviewOrderPriceDtoImpl value,
          $Res Function(_$PreviewOrderPriceDtoImpl) then) =
      __$$PreviewOrderPriceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String outletId, List<OrderItemDto> items});
}

/// @nodoc
class __$$PreviewOrderPriceDtoImplCopyWithImpl<$Res>
    extends _$PreviewOrderPriceDtoCopyWithImpl<$Res, _$PreviewOrderPriceDtoImpl>
    implements _$$PreviewOrderPriceDtoImplCopyWith<$Res> {
  __$$PreviewOrderPriceDtoImplCopyWithImpl(_$PreviewOrderPriceDtoImpl _value,
      $Res Function(_$PreviewOrderPriceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
    Object? items = null,
  }) {
    return _then(_$PreviewOrderPriceDtoImpl(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreviewOrderPriceDtoImpl implements _PreviewOrderPriceDto {
  const _$PreviewOrderPriceDtoImpl(
      {required this.outletId, required final List<OrderItemDto> items})
      : _items = items;

  factory _$PreviewOrderPriceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewOrderPriceDtoImplFromJson(json);

  @override
  final String outletId;
  final List<OrderItemDto> _items;
  @override
  List<OrderItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PreviewOrderPriceDto(outletId: $outletId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewOrderPriceDtoImpl &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, outletId, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewOrderPriceDtoImplCopyWith<_$PreviewOrderPriceDtoImpl>
      get copyWith =>
          __$$PreviewOrderPriceDtoImplCopyWithImpl<_$PreviewOrderPriceDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreviewOrderPriceDtoImplToJson(
      this,
    );
  }
}

abstract class _PreviewOrderPriceDto implements PreviewOrderPriceDto {
  const factory _PreviewOrderPriceDto(
      {required final String outletId,
      required final List<OrderItemDto> items}) = _$PreviewOrderPriceDtoImpl;

  factory _PreviewOrderPriceDto.fromJson(Map<String, dynamic> json) =
      _$PreviewOrderPriceDtoImpl.fromJson;

  @override
  String get outletId;
  @override
  List<OrderItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$PreviewOrderPriceDtoImplCopyWith<_$PreviewOrderPriceDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FindAllOrderDto {
  String? get type => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FindAllOrderDtoCopyWith<FindAllOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllOrderDtoCopyWith<$Res> {
  factory $FindAllOrderDtoCopyWith(
          FindAllOrderDto value, $Res Function(FindAllOrderDto) then) =
      _$FindAllOrderDtoCopyWithImpl<$Res, FindAllOrderDto>;
  @useResult
  $Res call(
      {String? type,
      String? source,
      String? status,
      String? search,
      String? sort});
}

/// @nodoc
class _$FindAllOrderDtoCopyWithImpl<$Res, $Val extends FindAllOrderDto>
    implements $FindAllOrderDtoCopyWith<$Res> {
  _$FindAllOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? source = freezed,
    Object? status = freezed,
    Object? search = freezed,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindAllOrderDtoImplCopyWith<$Res>
    implements $FindAllOrderDtoCopyWith<$Res> {
  factory _$$FindAllOrderDtoImplCopyWith(_$FindAllOrderDtoImpl value,
          $Res Function(_$FindAllOrderDtoImpl) then) =
      __$$FindAllOrderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      String? source,
      String? status,
      String? search,
      String? sort});
}

/// @nodoc
class __$$FindAllOrderDtoImplCopyWithImpl<$Res>
    extends _$FindAllOrderDtoCopyWithImpl<$Res, _$FindAllOrderDtoImpl>
    implements _$$FindAllOrderDtoImplCopyWith<$Res> {
  __$$FindAllOrderDtoImplCopyWithImpl(
      _$FindAllOrderDtoImpl _value, $Res Function(_$FindAllOrderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? source = freezed,
    Object? status = freezed,
    Object? search = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$FindAllOrderDtoImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FindAllOrderDtoImpl implements _FindAllOrderDto {
  const _$FindAllOrderDtoImpl(
      {this.type, this.source, this.status, this.search, this.sort});

  @override
  final String? type;
  @override
  final String? source;
  @override
  final String? status;
  @override
  final String? search;
  @override
  final String? sort;

  @override
  String toString() {
    return 'FindAllOrderDto(type: $type, source: $source, status: $status, search: $search, sort: $sort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllOrderDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, type, source, status, search, sort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllOrderDtoImplCopyWith<_$FindAllOrderDtoImpl> get copyWith =>
      __$$FindAllOrderDtoImplCopyWithImpl<_$FindAllOrderDtoImpl>(
          this, _$identity);
}

abstract class _FindAllOrderDto implements FindAllOrderDto {
  const factory _FindAllOrderDto(
      {final String? type,
      final String? source,
      final String? status,
      final String? search,
      final String? sort}) = _$FindAllOrderDtoImpl;

  @override
  String? get type;
  @override
  String? get source;
  @override
  String? get status;
  @override
  String? get search;
  @override
  String? get sort;
  @override
  @JsonKey(ignore: true)
  _$$FindAllOrderDtoImplCopyWith<_$FindAllOrderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}