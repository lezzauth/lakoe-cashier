// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FindAllCustomerDto {
  String get ownerId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FindAllCustomerDtoCopyWith<FindAllCustomerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllCustomerDtoCopyWith<$Res> {
  factory $FindAllCustomerDtoCopyWith(
          FindAllCustomerDto value, $Res Function(FindAllCustomerDto) then) =
      _$FindAllCustomerDtoCopyWithImpl<$Res, FindAllCustomerDto>;
  @useResult
  $Res call({String ownerId});
}

/// @nodoc
class _$FindAllCustomerDtoCopyWithImpl<$Res, $Val extends FindAllCustomerDto>
    implements $FindAllCustomerDtoCopyWith<$Res> {
  _$FindAllCustomerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
  }) {
    return _then(_value.copyWith(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindAllCustomerDtoImplCopyWith<$Res>
    implements $FindAllCustomerDtoCopyWith<$Res> {
  factory _$$FindAllCustomerDtoImplCopyWith(_$FindAllCustomerDtoImpl value,
          $Res Function(_$FindAllCustomerDtoImpl) then) =
      __$$FindAllCustomerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ownerId});
}

/// @nodoc
class __$$FindAllCustomerDtoImplCopyWithImpl<$Res>
    extends _$FindAllCustomerDtoCopyWithImpl<$Res, _$FindAllCustomerDtoImpl>
    implements _$$FindAllCustomerDtoImplCopyWith<$Res> {
  __$$FindAllCustomerDtoImplCopyWithImpl(_$FindAllCustomerDtoImpl _value,
      $Res Function(_$FindAllCustomerDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
  }) {
    return _then(_$FindAllCustomerDtoImpl(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FindAllCustomerDtoImpl implements _FindAllCustomerDto {
  const _$FindAllCustomerDtoImpl({required this.ownerId});

  @override
  final String ownerId;

  @override
  String toString() {
    return 'FindAllCustomerDto(ownerId: $ownerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllCustomerDtoImpl &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ownerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllCustomerDtoImplCopyWith<_$FindAllCustomerDtoImpl> get copyWith =>
      __$$FindAllCustomerDtoImplCopyWithImpl<_$FindAllCustomerDtoImpl>(
          this, _$identity);
}

abstract class _FindAllCustomerDto implements FindAllCustomerDto {
  const factory _FindAllCustomerDto({required final String ownerId}) =
      _$FindAllCustomerDtoImpl;

  @override
  String get ownerId;
  @override
  @JsonKey(ignore: true)
  _$$FindAllCustomerDtoImplCopyWith<_$FindAllCustomerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
