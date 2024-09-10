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

PreviewOrderPriceDto _$PreviewOrderPriceDtoFromJson(Map<String, dynamic> json) {
  return _PreviewOrderPriceDto.fromJson(json);
}

/// @nodoc
mixin _$PreviewOrderPriceDto {
  String get type => throw _privateConstructorUsedError;
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
  $Res call({String type, String outletId, List<OrderItemDto> items});
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
    Object? type = null,
    Object? outletId = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String type, String outletId, List<OrderItemDto> items});
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
    Object? type = null,
    Object? outletId = null,
    Object? items = null,
  }) {
    return _then(_$PreviewOrderPriceDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
      {required this.type,
      required this.outletId,
      required final List<OrderItemDto> items})
      : _items = items;

  factory _$PreviewOrderPriceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreviewOrderPriceDtoImplFromJson(json);

  @override
  final String type;
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
    return 'PreviewOrderPriceDto(type: $type, outletId: $outletId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewOrderPriceDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, outletId, const DeepCollectionEquality().hash(_items));

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
      {required final String type,
      required final String outletId,
      required final List<OrderItemDto> items}) = _$PreviewOrderPriceDtoImpl;

  factory _PreviewOrderPriceDto.fromJson(Map<String, dynamic> json) =
      _$PreviewOrderPriceDtoImpl.fromJson;

  @override
  String get type;
  @override
  String get outletId;
  @override
  List<OrderItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$PreviewOrderPriceDtoImplCopyWith<_$PreviewOrderPriceDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
