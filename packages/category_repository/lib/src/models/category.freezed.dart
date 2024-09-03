// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryCount _$CategoryCountFromJson(Map<String, dynamic> json) {
  return _CategoryCount.fromJson(json);
}

/// @nodoc
mixin _$CategoryCount {
  int get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCountCopyWith<CategoryCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCountCopyWith<$Res> {
  factory $CategoryCountCopyWith(
          CategoryCount value, $Res Function(CategoryCount) then) =
      _$CategoryCountCopyWithImpl<$Res, CategoryCount>;
  @useResult
  $Res call({int products});
}

/// @nodoc
class _$CategoryCountCopyWithImpl<$Res, $Val extends CategoryCount>
    implements $CategoryCountCopyWith<$Res> {
  _$CategoryCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryCountImplCopyWith<$Res>
    implements $CategoryCountCopyWith<$Res> {
  factory _$$CategoryCountImplCopyWith(
          _$CategoryCountImpl value, $Res Function(_$CategoryCountImpl) then) =
      __$$CategoryCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int products});
}

/// @nodoc
class __$$CategoryCountImplCopyWithImpl<$Res>
    extends _$CategoryCountCopyWithImpl<$Res, _$CategoryCountImpl>
    implements _$$CategoryCountImplCopyWith<$Res> {
  __$$CategoryCountImplCopyWithImpl(
      _$CategoryCountImpl _value, $Res Function(_$CategoryCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$CategoryCountImpl(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryCountImpl implements _CategoryCount {
  const _$CategoryCountImpl({required this.products});

  factory _$CategoryCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryCountImplFromJson(json);

  @override
  final int products;

  @override
  String toString() {
    return 'CategoryCount(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryCountImpl &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, products);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryCountImplCopyWith<_$CategoryCountImpl> get copyWith =>
      __$$CategoryCountImplCopyWithImpl<_$CategoryCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryCountImplToJson(
      this,
    );
  }
}

abstract class _CategoryCount implements CategoryCount {
  const factory _CategoryCount({required final int products}) =
      _$CategoryCountImpl;

  factory _CategoryCount.fromJson(Map<String, dynamic> json) =
      _$CategoryCountImpl.fromJson;

  @override
  int get products;
  @override
  @JsonKey(ignore: true)
  _$$CategoryCountImplCopyWith<_$CategoryCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  @JsonKey(name: "_count")
  CategoryCount? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? icon,
      String outletId,
      @JsonKey(name: "_count") CategoryCount? count});

  $CategoryCountCopyWith<$Res>? get count;
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? outletId = null,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as CategoryCount?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCountCopyWith<$Res>? get count {
    if (_value.count == null) {
      return null;
    }

    return $CategoryCountCopyWith<$Res>(_value.count!, (value) {
      return _then(_value.copyWith(count: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? icon,
      String outletId,
      @JsonKey(name: "_count") CategoryCount? count});

  @override
  $CategoryCountCopyWith<$Res>? get count;
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = freezed,
    Object? outletId = null,
    Object? count = freezed,
  }) {
    return _then(_$CategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as CategoryCount?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {required this.id,
      required this.name,
      this.icon,
      required this.outletId,
      @JsonKey(name: "_count") this.count});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? icon;
  @override
  final String outletId;
  @override
  @JsonKey(name: "_count")
  final CategoryCount? count;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, icon: $icon, outletId: $outletId, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon, outletId, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
          {required final int id,
          required final String name,
          final String? icon,
          required final String outletId,
          @JsonKey(name: "_count") final CategoryCount? count}) =
      _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get icon;
  @override
  String get outletId;
  @override
  @JsonKey(name: "_count")
  CategoryCount? get count;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
