// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindAllProductDto _$FindAllProductDtoFromJson(Map<String, dynamic> json) {
  return _FindAllProductDto.fromJson(json);
}

/// @nodoc
mixin _$FindAllProductDto {
  int? get categoryId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get availability => throw _privateConstructorUsedError;

  /// Serializes this FindAllProductDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindAllProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindAllProductDtoCopyWith<FindAllProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllProductDtoCopyWith<$Res> {
  factory $FindAllProductDtoCopyWith(
          FindAllProductDto value, $Res Function(FindAllProductDto) then) =
      _$FindAllProductDtoCopyWithImpl<$Res, FindAllProductDto>;
  @useResult
  $Res call({int? categoryId, String? name, String? availability});
}

/// @nodoc
class _$FindAllProductDtoCopyWithImpl<$Res, $Val extends FindAllProductDto>
    implements $FindAllProductDtoCopyWith<$Res> {
  _$FindAllProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindAllProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? availability = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindAllProductDtoImplCopyWith<$Res>
    implements $FindAllProductDtoCopyWith<$Res> {
  factory _$$FindAllProductDtoImplCopyWith(_$FindAllProductDtoImpl value,
          $Res Function(_$FindAllProductDtoImpl) then) =
      __$$FindAllProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? categoryId, String? name, String? availability});
}

/// @nodoc
class __$$FindAllProductDtoImplCopyWithImpl<$Res>
    extends _$FindAllProductDtoCopyWithImpl<$Res, _$FindAllProductDtoImpl>
    implements _$$FindAllProductDtoImplCopyWith<$Res> {
  __$$FindAllProductDtoImplCopyWithImpl(_$FindAllProductDtoImpl _value,
      $Res Function(_$FindAllProductDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindAllProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? availability = freezed,
  }) {
    return _then(_$FindAllProductDtoImpl(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindAllProductDtoImpl implements _FindAllProductDto {
  const _$FindAllProductDtoImpl(
      {this.categoryId, this.name, this.availability});

  factory _$FindAllProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindAllProductDtoImplFromJson(json);

  @override
  final int? categoryId;
  @override
  final String? name;
  @override
  final String? availability;

  @override
  String toString() {
    return 'FindAllProductDto(categoryId: $categoryId, name: $name, availability: $availability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllProductDtoImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.availability, availability) ||
                other.availability == availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, name, availability);

  /// Create a copy of FindAllProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllProductDtoImplCopyWith<_$FindAllProductDtoImpl> get copyWith =>
      __$$FindAllProductDtoImplCopyWithImpl<_$FindAllProductDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindAllProductDtoImplToJson(
      this,
    );
  }
}

abstract class _FindAllProductDto implements FindAllProductDto {
  const factory _FindAllProductDto(
      {final int? categoryId,
      final String? name,
      final String? availability}) = _$FindAllProductDtoImpl;

  factory _FindAllProductDto.fromJson(Map<String, dynamic> json) =
      _$FindAllProductDtoImpl.fromJson;

  @override
  int? get categoryId;
  @override
  String? get name;
  @override
  String? get availability;

  /// Create a copy of FindAllProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindAllProductDtoImplCopyWith<_$FindAllProductDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListOrderByProductDto _$ListOrderByProductDtoFromJson(
    Map<String, dynamic> json) {
  return _ListOrderByProductDto.fromJson(json);
}

/// @nodoc
mixin _$ListOrderByProductDto {
  String? get cursor => throw _privateConstructorUsedError;
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get template => throw _privateConstructorUsedError;

  /// Serializes this ListOrderByProductDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListOrderByProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListOrderByProductDtoCopyWith<ListOrderByProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListOrderByProductDtoCopyWith<$Res> {
  factory $ListOrderByProductDtoCopyWith(ListOrderByProductDto value,
          $Res Function(ListOrderByProductDto) then) =
      _$ListOrderByProductDtoCopyWithImpl<$Res, ListOrderByProductDto>;
  @useResult
  $Res call({String? cursor, String? from, String? to, String? template});
}

/// @nodoc
class _$ListOrderByProductDtoCopyWithImpl<$Res,
        $Val extends ListOrderByProductDto>
    implements $ListOrderByProductDtoCopyWith<$Res> {
  _$ListOrderByProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListOrderByProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? template = freezed,
  }) {
    return _then(_value.copyWith(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListOrderByProductDtoImplCopyWith<$Res>
    implements $ListOrderByProductDtoCopyWith<$Res> {
  factory _$$ListOrderByProductDtoImplCopyWith(
          _$ListOrderByProductDtoImpl value,
          $Res Function(_$ListOrderByProductDtoImpl) then) =
      __$$ListOrderByProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? cursor, String? from, String? to, String? template});
}

/// @nodoc
class __$$ListOrderByProductDtoImplCopyWithImpl<$Res>
    extends _$ListOrderByProductDtoCopyWithImpl<$Res,
        _$ListOrderByProductDtoImpl>
    implements _$$ListOrderByProductDtoImplCopyWith<$Res> {
  __$$ListOrderByProductDtoImplCopyWithImpl(_$ListOrderByProductDtoImpl _value,
      $Res Function(_$ListOrderByProductDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListOrderByProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? template = freezed,
  }) {
    return _then(_$ListOrderByProductDtoImpl(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListOrderByProductDtoImpl implements _ListOrderByProductDto {
  const _$ListOrderByProductDtoImpl(
      {this.cursor, this.from, this.to, this.template});

  factory _$ListOrderByProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListOrderByProductDtoImplFromJson(json);

  @override
  final String? cursor;
  @override
  final String? from;
  @override
  final String? to;
  @override
  final String? template;

  @override
  String toString() {
    return 'ListOrderByProductDto(cursor: $cursor, from: $from, to: $to, template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListOrderByProductDtoImpl &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cursor, from, to, template);

  /// Create a copy of ListOrderByProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListOrderByProductDtoImplCopyWith<_$ListOrderByProductDtoImpl>
      get copyWith => __$$ListOrderByProductDtoImplCopyWithImpl<
          _$ListOrderByProductDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListOrderByProductDtoImplToJson(
      this,
    );
  }
}

abstract class _ListOrderByProductDto implements ListOrderByProductDto {
  const factory _ListOrderByProductDto(
      {final String? cursor,
      final String? from,
      final String? to,
      final String? template}) = _$ListOrderByProductDtoImpl;

  factory _ListOrderByProductDto.fromJson(Map<String, dynamic> json) =
      _$ListOrderByProductDtoImpl.fromJson;

  @override
  String? get cursor;
  @override
  String? get from;
  @override
  String? get to;
  @override
  String? get template;

  /// Create a copy of ListOrderByProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListOrderByProductDtoImplCopyWith<_$ListOrderByProductDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateProductDto _$CreateProductDtoFromJson(Map<String, dynamic> json) {
  return _CreateProductDto.fromJson(json);
}

/// @nodoc
mixin _$CreateProductDto {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get modal => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String? get outletId => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  String get availability => throw _privateConstructorUsedError;

  /// Serializes this CreateProductDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateProductDtoCopyWith<CreateProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProductDtoCopyWith<$Res> {
  factory $CreateProductDtoCopyWith(
          CreateProductDto value, $Res Function(CreateProductDto) then) =
      _$CreateProductDtoCopyWithImpl<$Res, CreateProductDto>;
  @useResult
  $Res call(
      {String name,
      String? description,
      int price,
      int modal,
      int categoryId,
      String unit,
      String? outletId,
      String? sku,
      int? stock,
      String availability});
}

/// @nodoc
class _$CreateProductDtoCopyWithImpl<$Res, $Val extends CreateProductDto>
    implements $CreateProductDtoCopyWith<$Res> {
  _$CreateProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? modal = null,
    Object? categoryId = null,
    Object? unit = null,
    Object? outletId = freezed,
    Object? sku = freezed,
    Object? stock = freezed,
    Object? availability = null,
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
              as int,
      modal: null == modal
          ? _value.modal
          : modal // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateProductDtoImplCopyWith<$Res>
    implements $CreateProductDtoCopyWith<$Res> {
  factory _$$CreateProductDtoImplCopyWith(_$CreateProductDtoImpl value,
          $Res Function(_$CreateProductDtoImpl) then) =
      __$$CreateProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      int price,
      int modal,
      int categoryId,
      String unit,
      String? outletId,
      String? sku,
      int? stock,
      String availability});
}

/// @nodoc
class __$$CreateProductDtoImplCopyWithImpl<$Res>
    extends _$CreateProductDtoCopyWithImpl<$Res, _$CreateProductDtoImpl>
    implements _$$CreateProductDtoImplCopyWith<$Res> {
  __$$CreateProductDtoImplCopyWithImpl(_$CreateProductDtoImpl _value,
      $Res Function(_$CreateProductDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? modal = null,
    Object? categoryId = null,
    Object? unit = null,
    Object? outletId = freezed,
    Object? sku = freezed,
    Object? stock = freezed,
    Object? availability = null,
  }) {
    return _then(_$CreateProductDtoImpl(
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
              as int,
      modal: null == modal
          ? _value.modal
          : modal // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      availability: null == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateProductDtoImpl implements _CreateProductDto {
  const _$CreateProductDtoImpl(
      {required this.name,
      this.description,
      required this.price,
      required this.modal,
      required this.categoryId,
      required this.unit,
      this.outletId,
      this.sku,
      this.stock,
      this.availability = "AVAILABLE"});

  factory _$CreateProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateProductDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final int price;
  @override
  final int modal;
  @override
  final int categoryId;
  @override
  final String unit;
  @override
  final String? outletId;
  @override
  final String? sku;
  @override
  final int? stock;
  @override
  @JsonKey()
  final String availability;

  @override
  String toString() {
    return 'CreateProductDto(name: $name, description: $description, price: $price, modal: $modal, categoryId: $categoryId, unit: $unit, outletId: $outletId, sku: $sku, stock: $stock, availability: $availability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProductDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.modal, modal) || other.modal == modal) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.availability, availability) ||
                other.availability == availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, price, modal,
      categoryId, unit, outletId, sku, stock, availability);

  /// Create a copy of CreateProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProductDtoImplCopyWith<_$CreateProductDtoImpl> get copyWith =>
      __$$CreateProductDtoImplCopyWithImpl<_$CreateProductDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateProductDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateProductDto implements CreateProductDto {
  const factory _CreateProductDto(
      {required final String name,
      final String? description,
      required final int price,
      required final int modal,
      required final int categoryId,
      required final String unit,
      final String? outletId,
      final String? sku,
      final int? stock,
      final String availability}) = _$CreateProductDtoImpl;

  factory _CreateProductDto.fromJson(Map<String, dynamic> json) =
      _$CreateProductDtoImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  int get price;
  @override
  int get modal;
  @override
  int get categoryId;
  @override
  String get unit;
  @override
  String? get outletId;
  @override
  String? get sku;
  @override
  int? get stock;
  @override
  String get availability;

  /// Create a copy of CreateProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateProductDtoImplCopyWith<_$CreateProductDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateProductDto _$UpdateProductDtoFromJson(Map<String, dynamic> json) {
  return _UpdateProductDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateProductDto {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get modal => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  String? get outletId => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  String? get availability => throw _privateConstructorUsedError;

  /// Serializes this UpdateProductDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateProductDtoCopyWith<UpdateProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProductDtoCopyWith<$Res> {
  factory $UpdateProductDtoCopyWith(
          UpdateProductDto value, $Res Function(UpdateProductDto) then) =
      _$UpdateProductDtoCopyWithImpl<$Res, UpdateProductDto>;
  @useResult
  $Res call(
      {String? name,
      String? description,
      int? price,
      int? modal,
      int? categoryId,
      String? unit,
      String? outletId,
      String? sku,
      int? stock,
      String? availability});
}

/// @nodoc
class _$UpdateProductDtoCopyWithImpl<$Res, $Val extends UpdateProductDto>
    implements $UpdateProductDtoCopyWith<$Res> {
  _$UpdateProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? modal = freezed,
    Object? categoryId = freezed,
    Object? unit = freezed,
    Object? outletId = freezed,
    Object? sku = freezed,
    Object? stock = freezed,
    Object? availability = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      modal: freezed == modal
          ? _value.modal
          : modal // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateProductDtoImplCopyWith<$Res>
    implements $UpdateProductDtoCopyWith<$Res> {
  factory _$$UpdateProductDtoImplCopyWith(_$UpdateProductDtoImpl value,
          $Res Function(_$UpdateProductDtoImpl) then) =
      __$$UpdateProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      int? price,
      int? modal,
      int? categoryId,
      String? unit,
      String? outletId,
      String? sku,
      int? stock,
      String? availability});
}

/// @nodoc
class __$$UpdateProductDtoImplCopyWithImpl<$Res>
    extends _$UpdateProductDtoCopyWithImpl<$Res, _$UpdateProductDtoImpl>
    implements _$$UpdateProductDtoImplCopyWith<$Res> {
  __$$UpdateProductDtoImplCopyWithImpl(_$UpdateProductDtoImpl _value,
      $Res Function(_$UpdateProductDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? modal = freezed,
    Object? categoryId = freezed,
    Object? unit = freezed,
    Object? outletId = freezed,
    Object? sku = freezed,
    Object? stock = freezed,
    Object? availability = freezed,
  }) {
    return _then(_$UpdateProductDtoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      modal: freezed == modal
          ? _value.modal
          : modal // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      availability: freezed == availability
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProductDtoImpl implements _UpdateProductDto {
  const _$UpdateProductDtoImpl(
      {this.name,
      this.description,
      this.price,
      this.modal,
      this.categoryId,
      this.unit,
      this.outletId,
      this.sku,
      this.stock,
      this.availability});

  factory _$UpdateProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProductDtoImplFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? price;
  @override
  final int? modal;
  @override
  final int? categoryId;
  @override
  final String? unit;
  @override
  final String? outletId;
  @override
  final String? sku;
  @override
  final int? stock;
  @override
  final String? availability;

  @override
  String toString() {
    return 'UpdateProductDto(name: $name, description: $description, price: $price, modal: $modal, categoryId: $categoryId, unit: $unit, outletId: $outletId, sku: $sku, stock: $stock, availability: $availability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProductDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.modal, modal) || other.modal == modal) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.availability, availability) ||
                other.availability == availability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, price, modal,
      categoryId, unit, outletId, sku, stock, availability);

  /// Create a copy of UpdateProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProductDtoImplCopyWith<_$UpdateProductDtoImpl> get copyWith =>
      __$$UpdateProductDtoImplCopyWithImpl<_$UpdateProductDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProductDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateProductDto implements UpdateProductDto {
  const factory _UpdateProductDto(
      {final String? name,
      final String? description,
      final int? price,
      final int? modal,
      final int? categoryId,
      final String? unit,
      final String? outletId,
      final String? sku,
      final int? stock,
      final String? availability}) = _$UpdateProductDtoImpl;

  factory _UpdateProductDto.fromJson(Map<String, dynamic> json) =
      _$UpdateProductDtoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  int? get price;
  @override
  int? get modal;
  @override
  int? get categoryId;
  @override
  String? get unit;
  @override
  String? get outletId;
  @override
  String? get sku;
  @override
  int? get stock;
  @override
  String? get availability;

  /// Create a copy of UpdateProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProductDtoImplCopyWith<_$UpdateProductDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
