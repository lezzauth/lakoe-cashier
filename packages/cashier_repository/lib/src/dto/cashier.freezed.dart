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

SaveOrderDto _$SaveOrderDtoFromJson(Map<String, dynamic> json) {
  return _SaveOrderDto.fromJson(json);
}

/// @nodoc
mixin _$SaveOrderDto {
  String get outletId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<OrderItemDto> get items => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String? get tableId => throw _privateConstructorUsedError;

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
  $Res call(
      {String outletId,
      String type,
      List<OrderItemDto> items,
      String? customerId,
      String? tableId});
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
    Object? type = null,
    Object? items = null,
    Object? customerId = freezed,
    Object? tableId = freezed,
  }) {
    return _then(_value.copyWith(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemDto>,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      tableId: freezed == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {String outletId,
      String type,
      List<OrderItemDto> items,
      String? customerId,
      String? tableId});
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
    Object? type = null,
    Object? items = null,
    Object? customerId = freezed,
    Object? tableId = freezed,
  }) {
    return _then(_$SaveOrderDtoImpl(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemDto>,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      tableId: freezed == tableId
          ? _value.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SaveOrderDtoImpl implements _SaveOrderDto {
  const _$SaveOrderDtoImpl(
      {required this.outletId,
      required this.type,
      required final List<OrderItemDto> items,
      this.customerId,
      this.tableId})
      : _items = items;

  factory _$SaveOrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveOrderDtoImplFromJson(json);

  @override
  final String outletId;
  @override
  final String type;
  final List<OrderItemDto> _items;
  @override
  List<OrderItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? customerId;
  @override
  final String? tableId;

  @override
  String toString() {
    return 'SaveOrderDto(outletId: $outletId, type: $type, items: $items, customerId: $customerId, tableId: $tableId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveOrderDtoImpl &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.tableId, tableId) || other.tableId == tableId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, outletId, type,
      const DeepCollectionEquality().hash(_items), customerId, tableId);

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
      required final String type,
      required final List<OrderItemDto> items,
      final String? customerId,
      final String? tableId}) = _$SaveOrderDtoImpl;

  factory _SaveOrderDto.fromJson(Map<String, dynamic> json) =
      _$SaveOrderDtoImpl.fromJson;

  @override
  String get outletId;
  @override
  String get type;
  @override
  List<OrderItemDto> get items;
  @override
  String? get customerId;
  @override
  String? get tableId;
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
  String? get customerId => throw _privateConstructorUsedError;
  String? get redeemCoinAmount => throw _privateConstructorUsedError;

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
  $Res call(
      {String paymentMethod,
      int paidAmount,
      int change,
      String? customerId,
      String? redeemCoinAmount});
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
    Object? customerId = freezed,
    Object? redeemCoinAmount = freezed,
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
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      redeemCoinAmount: freezed == redeemCoinAmount
          ? _value.redeemCoinAmount
          : redeemCoinAmount // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {String paymentMethod,
      int paidAmount,
      int change,
      String? customerId,
      String? redeemCoinAmount});
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
    Object? customerId = freezed,
    Object? redeemCoinAmount = freezed,
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
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      redeemCoinAmount: freezed == redeemCoinAmount
          ? _value.redeemCoinAmount
          : redeemCoinAmount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompleteOrderDtoImpl implements _CompleteOrderDto {
  const _$CompleteOrderDtoImpl(
      {required this.paymentMethod,
      required this.paidAmount,
      required this.change,
      this.customerId,
      this.redeemCoinAmount});

  factory _$CompleteOrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompleteOrderDtoImplFromJson(json);

  @override
  final String paymentMethod;
  @override
  final int paidAmount;
  @override
  final int change;
  @override
  final String? customerId;
  @override
  final String? redeemCoinAmount;

  @override
  String toString() {
    return 'CompleteOrderDto(paymentMethod: $paymentMethod, paidAmount: $paidAmount, change: $change, customerId: $customerId, redeemCoinAmount: $redeemCoinAmount)';
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
            (identical(other.change, change) || other.change == change) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.redeemCoinAmount, redeemCoinAmount) ||
                other.redeemCoinAmount == redeemCoinAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentMethod, paidAmount,
      change, customerId, redeemCoinAmount);

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
      required final int change,
      final String? customerId,
      final String? redeemCoinAmount}) = _$CompleteOrderDtoImpl;

  factory _CompleteOrderDto.fromJson(Map<String, dynamic> json) =
      _$CompleteOrderDtoImpl.fromJson;

  @override
  String get paymentMethod;
  @override
  int get paidAmount;
  @override
  int get change;
  @override
  String? get customerId;
  @override
  String? get redeemCoinAmount;
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

RegenerateCashierTokenDto _$RegenerateCashierTokenDtoFromJson(
    Map<String, dynamic> json) {
  return _RegenerateCashierTokenDto.fromJson(json);
}

/// @nodoc
mixin _$RegenerateCashierTokenDto {
  String get outletId => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegenerateCashierTokenDtoCopyWith<RegenerateCashierTokenDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegenerateCashierTokenDtoCopyWith<$Res> {
  factory $RegenerateCashierTokenDtoCopyWith(RegenerateCashierTokenDto value,
          $Res Function(RegenerateCashierTokenDto) then) =
      _$RegenerateCashierTokenDtoCopyWithImpl<$Res, RegenerateCashierTokenDto>;
  @useResult
  $Res call({String outletId, String pin});
}

/// @nodoc
class _$RegenerateCashierTokenDtoCopyWithImpl<$Res,
        $Val extends RegenerateCashierTokenDto>
    implements $RegenerateCashierTokenDtoCopyWith<$Res> {
  _$RegenerateCashierTokenDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$RegenerateCashierTokenDtoImplCopyWith<$Res>
    implements $RegenerateCashierTokenDtoCopyWith<$Res> {
  factory _$$RegenerateCashierTokenDtoImplCopyWith(
          _$RegenerateCashierTokenDtoImpl value,
          $Res Function(_$RegenerateCashierTokenDtoImpl) then) =
      __$$RegenerateCashierTokenDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String outletId, String pin});
}

/// @nodoc
class __$$RegenerateCashierTokenDtoImplCopyWithImpl<$Res>
    extends _$RegenerateCashierTokenDtoCopyWithImpl<$Res,
        _$RegenerateCashierTokenDtoImpl>
    implements _$$RegenerateCashierTokenDtoImplCopyWith<$Res> {
  __$$RegenerateCashierTokenDtoImplCopyWithImpl(
      _$RegenerateCashierTokenDtoImpl _value,
      $Res Function(_$RegenerateCashierTokenDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
    Object? pin = null,
  }) {
    return _then(_$RegenerateCashierTokenDtoImpl(
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
class _$RegenerateCashierTokenDtoImpl implements _RegenerateCashierTokenDto {
  const _$RegenerateCashierTokenDtoImpl(
      {required this.outletId, required this.pin});

  factory _$RegenerateCashierTokenDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegenerateCashierTokenDtoImplFromJson(json);

  @override
  final String outletId;
  @override
  final String pin;

  @override
  String toString() {
    return 'RegenerateCashierTokenDto(outletId: $outletId, pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegenerateCashierTokenDtoImpl &&
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
  _$$RegenerateCashierTokenDtoImplCopyWith<_$RegenerateCashierTokenDtoImpl>
      get copyWith => __$$RegenerateCashierTokenDtoImplCopyWithImpl<
          _$RegenerateCashierTokenDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegenerateCashierTokenDtoImplToJson(
      this,
    );
  }
}

abstract class _RegenerateCashierTokenDto implements RegenerateCashierTokenDto {
  const factory _RegenerateCashierTokenDto(
      {required final String outletId,
      required final String pin}) = _$RegenerateCashierTokenDtoImpl;

  factory _RegenerateCashierTokenDto.fromJson(Map<String, dynamic> json) =
      _$RegenerateCashierTokenDtoImpl.fromJson;

  @override
  String get outletId;
  @override
  String get pin;
  @override
  @JsonKey(ignore: true)
  _$$RegenerateCashierTokenDtoImplCopyWith<_$RegenerateCashierTokenDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
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
