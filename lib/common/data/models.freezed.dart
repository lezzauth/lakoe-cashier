// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LabelValue<T> {
  String get label => throw _privateConstructorUsedError;
  T get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LabelValueCopyWith<T, LabelValue<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabelValueCopyWith<T, $Res> {
  factory $LabelValueCopyWith(
          LabelValue<T> value, $Res Function(LabelValue<T>) then) =
      _$LabelValueCopyWithImpl<T, $Res, LabelValue<T>>;
  @useResult
  $Res call({String label, T value});
}

/// @nodoc
class _$LabelValueCopyWithImpl<T, $Res, $Val extends LabelValue<T>>
    implements $LabelValueCopyWith<T, $Res> {
  _$LabelValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LabelValueImplCopyWith<T, $Res>
    implements $LabelValueCopyWith<T, $Res> {
  factory _$$LabelValueImplCopyWith(
          _$LabelValueImpl<T> value, $Res Function(_$LabelValueImpl<T>) then) =
      __$$LabelValueImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String label, T value});
}

/// @nodoc
class __$$LabelValueImplCopyWithImpl<T, $Res>
    extends _$LabelValueCopyWithImpl<T, $Res, _$LabelValueImpl<T>>
    implements _$$LabelValueImplCopyWith<T, $Res> {
  __$$LabelValueImplCopyWithImpl(
      _$LabelValueImpl<T> _value, $Res Function(_$LabelValueImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = freezed,
  }) {
    return _then(_$LabelValueImpl<T>(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LabelValueImpl<T> implements _LabelValue<T> {
  const _$LabelValueImpl({required this.label, required this.value});

  @override
  final String label;
  @override
  final T value;

  @override
  String toString() {
    return 'LabelValue<$T>(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabelValueImpl<T> &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, label, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LabelValueImplCopyWith<T, _$LabelValueImpl<T>> get copyWith =>
      __$$LabelValueImplCopyWithImpl<T, _$LabelValueImpl<T>>(this, _$identity);
}

abstract class _LabelValue<T> implements LabelValue<T> {
  const factory _LabelValue(
      {required final String label,
      required final T value}) = _$LabelValueImpl<T>;

  @override
  String get label;
  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  _$$LabelValueImplCopyWith<T, _$LabelValueImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
