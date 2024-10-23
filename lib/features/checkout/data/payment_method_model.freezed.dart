// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentMedia {
  String get mediaName => throw _privateConstructorUsedError;
  String get steps => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMediaCopyWith<PaymentMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMediaCopyWith<$Res> {
  factory $PaymentMediaCopyWith(
          PaymentMedia value, $Res Function(PaymentMedia) then) =
      _$PaymentMediaCopyWithImpl<$Res, PaymentMedia>;
  @useResult
  $Res call({String mediaName, String steps});
}

/// @nodoc
class _$PaymentMediaCopyWithImpl<$Res, $Val extends PaymentMedia>
    implements $PaymentMediaCopyWith<$Res> {
  _$PaymentMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaName = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      mediaName: null == mediaName
          ? _value.mediaName
          : mediaName // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMediaImplCopyWith<$Res>
    implements $PaymentMediaCopyWith<$Res> {
  factory _$$PaymentMediaImplCopyWith(
          _$PaymentMediaImpl value, $Res Function(_$PaymentMediaImpl) then) =
      __$$PaymentMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mediaName, String steps});
}

/// @nodoc
class __$$PaymentMediaImplCopyWithImpl<$Res>
    extends _$PaymentMediaCopyWithImpl<$Res, _$PaymentMediaImpl>
    implements _$$PaymentMediaImplCopyWith<$Res> {
  __$$PaymentMediaImplCopyWithImpl(
      _$PaymentMediaImpl _value, $Res Function(_$PaymentMediaImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaName = null,
    Object? steps = null,
  }) {
    return _then(_$PaymentMediaImpl(
      mediaName: null == mediaName
          ? _value.mediaName
          : mediaName // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentMediaImpl implements _PaymentMedia {
  const _$PaymentMediaImpl({required this.mediaName, required this.steps});

  @override
  final String mediaName;
  @override
  final String steps;

  @override
  String toString() {
    return 'PaymentMedia(mediaName: $mediaName, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMediaImpl &&
            (identical(other.mediaName, mediaName) ||
                other.mediaName == mediaName) &&
            (identical(other.steps, steps) || other.steps == steps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mediaName, steps);

  /// Create a copy of PaymentMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMediaImplCopyWith<_$PaymentMediaImpl> get copyWith =>
      __$$PaymentMediaImplCopyWithImpl<_$PaymentMediaImpl>(this, _$identity);
}

abstract class _PaymentMedia implements PaymentMedia {
  const factory _PaymentMedia(
      {required final String mediaName,
      required final String steps}) = _$PaymentMediaImpl;

  @override
  String get mediaName;
  @override
  String get steps;

  /// Create a copy of PaymentMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMediaImplCopyWith<_$PaymentMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentMethod {
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  List<PaymentMedia> get paymentMedia => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call(
      {String name,
      String logo,
      bool isSelected,
      List<PaymentMedia> paymentMedia});
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? logo = null,
    Object? isSelected = null,
    Object? paymentMedia = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMedia: null == paymentMedia
          ? _value.paymentMedia
          : paymentMedia // ignore: cast_nullable_to_non_nullable
              as List<PaymentMedia>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String logo,
      bool isSelected,
      List<PaymentMedia> paymentMedia});
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? logo = null,
    Object? isSelected = null,
    Object? paymentMedia = null,
  }) {
    return _then(_$PaymentMethodImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMedia: null == paymentMedia
          ? _value._paymentMedia
          : paymentMedia // ignore: cast_nullable_to_non_nullable
              as List<PaymentMedia>,
    ));
  }
}

/// @nodoc

class _$PaymentMethodImpl implements _PaymentMethod {
  const _$PaymentMethodImpl(
      {required this.name,
      required this.logo,
      this.isSelected = false,
      final List<PaymentMedia> paymentMedia = const []})
      : _paymentMedia = paymentMedia;

  @override
  final String name;
  @override
  final String logo;
  @override
  @JsonKey()
  final bool isSelected;
  final List<PaymentMedia> _paymentMedia;
  @override
  @JsonKey()
  List<PaymentMedia> get paymentMedia {
    if (_paymentMedia is EqualUnmodifiableListView) return _paymentMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMedia);
  }

  @override
  String toString() {
    return 'PaymentMethod(name: $name, logo: $logo, isSelected: $isSelected, paymentMedia: $paymentMedia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            const DeepCollectionEquality()
                .equals(other._paymentMedia, _paymentMedia));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, logo, isSelected,
      const DeepCollectionEquality().hash(_paymentMedia));

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod(
      {required final String name,
      required final String logo,
      final bool isSelected,
      final List<PaymentMedia> paymentMedia}) = _$PaymentMethodImpl;

  @override
  String get name;
  @override
  String get logo;
  @override
  bool get isSelected;
  @override
  List<PaymentMedia> get paymentMedia;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentCategory {
  String get categoryName => throw _privateConstructorUsedError;
  List<PaymentMethod> get methods => throw _privateConstructorUsedError;

  /// Create a copy of PaymentCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCategoryCopyWith<PaymentCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCategoryCopyWith<$Res> {
  factory $PaymentCategoryCopyWith(
          PaymentCategory value, $Res Function(PaymentCategory) then) =
      _$PaymentCategoryCopyWithImpl<$Res, PaymentCategory>;
  @useResult
  $Res call({String categoryName, List<PaymentMethod> methods});
}

/// @nodoc
class _$PaymentCategoryCopyWithImpl<$Res, $Val extends PaymentCategory>
    implements $PaymentCategoryCopyWith<$Res> {
  _$PaymentCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? methods = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      methods: null == methods
          ? _value.methods
          : methods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentCategoryImplCopyWith<$Res>
    implements $PaymentCategoryCopyWith<$Res> {
  factory _$$PaymentCategoryImplCopyWith(_$PaymentCategoryImpl value,
          $Res Function(_$PaymentCategoryImpl) then) =
      __$$PaymentCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryName, List<PaymentMethod> methods});
}

/// @nodoc
class __$$PaymentCategoryImplCopyWithImpl<$Res>
    extends _$PaymentCategoryCopyWithImpl<$Res, _$PaymentCategoryImpl>
    implements _$$PaymentCategoryImplCopyWith<$Res> {
  __$$PaymentCategoryImplCopyWithImpl(
      _$PaymentCategoryImpl _value, $Res Function(_$PaymentCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? methods = null,
  }) {
    return _then(_$PaymentCategoryImpl(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      methods: null == methods
          ? _value._methods
          : methods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethod>,
    ));
  }
}

/// @nodoc

class _$PaymentCategoryImpl implements _PaymentCategory {
  const _$PaymentCategoryImpl(
      {required this.categoryName, required final List<PaymentMethod> methods})
      : _methods = methods;

  @override
  final String categoryName;
  final List<PaymentMethod> _methods;
  @override
  List<PaymentMethod> get methods {
    if (_methods is EqualUnmodifiableListView) return _methods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_methods);
  }

  @override
  String toString() {
    return 'PaymentCategory(categoryName: $categoryName, methods: $methods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCategoryImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality().equals(other._methods, _methods));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryName, const DeepCollectionEquality().hash(_methods));

  /// Create a copy of PaymentCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCategoryImplCopyWith<_$PaymentCategoryImpl> get copyWith =>
      __$$PaymentCategoryImplCopyWithImpl<_$PaymentCategoryImpl>(
          this, _$identity);
}

abstract class _PaymentCategory implements PaymentCategory {
  const factory _PaymentCategory(
      {required final String categoryName,
      required final List<PaymentMethod> methods}) = _$PaymentCategoryImpl;

  @override
  String get categoryName;
  @override
  List<PaymentMethod> get methods;

  /// Create a copy of PaymentCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentCategoryImplCopyWith<_$PaymentCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
