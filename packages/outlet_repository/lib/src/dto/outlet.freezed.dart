// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outlet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailCustomerOutletDto _$DetailCustomerOutletDtoFromJson(
    Map<String, dynamic> json) {
  return _DetailCustomerOutletDto.fromJson(json);
}

/// @nodoc
mixin _$DetailCustomerOutletDto {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCustomerOutletDtoCopyWith<DetailCustomerOutletDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCustomerOutletDtoCopyWith<$Res> {
  factory $DetailCustomerOutletDtoCopyWith(DetailCustomerOutletDto value,
          $Res Function(DetailCustomerOutletDto) then) =
      _$DetailCustomerOutletDtoCopyWithImpl<$Res, DetailCustomerOutletDto>;
  @useResult
  $Res call({String? from, String? to});
}

/// @nodoc
class _$DetailCustomerOutletDtoCopyWithImpl<$Res,
        $Val extends DetailCustomerOutletDto>
    implements $DetailCustomerOutletDtoCopyWith<$Res> {
  _$DetailCustomerOutletDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailCustomerOutletDtoImplCopyWith<$Res>
    implements $DetailCustomerOutletDtoCopyWith<$Res> {
  factory _$$DetailCustomerOutletDtoImplCopyWith(
          _$DetailCustomerOutletDtoImpl value,
          $Res Function(_$DetailCustomerOutletDtoImpl) then) =
      __$$DetailCustomerOutletDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? from, String? to});
}

/// @nodoc
class __$$DetailCustomerOutletDtoImplCopyWithImpl<$Res>
    extends _$DetailCustomerOutletDtoCopyWithImpl<$Res,
        _$DetailCustomerOutletDtoImpl>
    implements _$$DetailCustomerOutletDtoImplCopyWith<$Res> {
  __$$DetailCustomerOutletDtoImplCopyWithImpl(
      _$DetailCustomerOutletDtoImpl _value,
      $Res Function(_$DetailCustomerOutletDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$DetailCustomerOutletDtoImpl(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCustomerOutletDtoImpl implements _DetailCustomerOutletDto {
  const _$DetailCustomerOutletDtoImpl({this.from, this.to});

  factory _$DetailCustomerOutletDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCustomerOutletDtoImplFromJson(json);

  @override
  final String? from;
  @override
  final String? to;

  @override
  String toString() {
    return 'DetailCustomerOutletDto(from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCustomerOutletDtoImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCustomerOutletDtoImplCopyWith<_$DetailCustomerOutletDtoImpl>
      get copyWith => __$$DetailCustomerOutletDtoImplCopyWithImpl<
          _$DetailCustomerOutletDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCustomerOutletDtoImplToJson(
      this,
    );
  }
}

abstract class _DetailCustomerOutletDto implements DetailCustomerOutletDto {
  const factory _DetailCustomerOutletDto(
      {final String? from, final String? to}) = _$DetailCustomerOutletDtoImpl;

  factory _DetailCustomerOutletDto.fromJson(Map<String, dynamic> json) =
      _$DetailCustomerOutletDtoImpl.fromJson;

  @override
  String? get from;
  @override
  String? get to;
  @override
  @JsonKey(ignore: true)
  _$$DetailCustomerOutletDtoImplCopyWith<_$DetailCustomerOutletDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
