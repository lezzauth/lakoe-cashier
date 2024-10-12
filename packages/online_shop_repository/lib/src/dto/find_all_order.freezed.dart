// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'find_all_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindAllOrderDto _$FindAllOrderDtoFromJson(Map<String, dynamic> json) {
  return _FindAllOrderDto.fromJson(json);
}

/// @nodoc
mixin _$FindAllOrderDto {
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this FindAllOrderDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FindAllOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FindAllOrderDtoCopyWith<FindAllOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllOrderDtoCopyWith<$Res> {
  factory $FindAllOrderDtoCopyWith(
          FindAllOrderDto value, $Res Function(FindAllOrderDto) then) =
      _$FindAllOrderDtoCopyWithImpl<$Res, FindAllOrderDto>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class _$FindAllOrderDtoCopyWithImpl<$Res, $Val extends FindAllOrderDto>
    implements $FindAllOrderDtoCopyWith<$Res> {
  _$FindAllOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FindAllOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
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
  $Res call({String? status});
}

/// @nodoc
class __$$FindAllOrderDtoImplCopyWithImpl<$Res>
    extends _$FindAllOrderDtoCopyWithImpl<$Res, _$FindAllOrderDtoImpl>
    implements _$$FindAllOrderDtoImplCopyWith<$Res> {
  __$$FindAllOrderDtoImplCopyWithImpl(
      _$FindAllOrderDtoImpl _value, $Res Function(_$FindAllOrderDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FindAllOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$FindAllOrderDtoImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindAllOrderDtoImpl implements _FindAllOrderDto {
  const _$FindAllOrderDtoImpl({this.status});

  factory _$FindAllOrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindAllOrderDtoImplFromJson(json);

  @override
  final String? status;

  @override
  String toString() {
    return 'FindAllOrderDto(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllOrderDtoImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of FindAllOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllOrderDtoImplCopyWith<_$FindAllOrderDtoImpl> get copyWith =>
      __$$FindAllOrderDtoImplCopyWithImpl<_$FindAllOrderDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindAllOrderDtoImplToJson(
      this,
    );
  }
}

abstract class _FindAllOrderDto implements FindAllOrderDto {
  const factory _FindAllOrderDto({final String? status}) =
      _$FindAllOrderDtoImpl;

  factory _FindAllOrderDto.fromJson(Map<String, dynamic> json) =
      _$FindAllOrderDtoImpl.fromJson;

  @override
  String? get status;

  /// Create a copy of FindAllOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FindAllOrderDtoImplCopyWith<_$FindAllOrderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
