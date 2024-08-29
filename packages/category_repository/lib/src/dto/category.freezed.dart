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

/// @nodoc
mixin _$FindAllCategoryDto {
  String get outletId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FindAllCategoryDtoCopyWith<FindAllCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllCategoryDtoCopyWith<$Res> {
  factory $FindAllCategoryDtoCopyWith(
          FindAllCategoryDto value, $Res Function(FindAllCategoryDto) then) =
      _$FindAllCategoryDtoCopyWithImpl<$Res, FindAllCategoryDto>;
  @useResult
  $Res call({String outletId});
}

/// @nodoc
class _$FindAllCategoryDtoCopyWithImpl<$Res, $Val extends FindAllCategoryDto>
    implements $FindAllCategoryDtoCopyWith<$Res> {
  _$FindAllCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
  }) {
    return _then(_value.copyWith(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindAllCategoryDtoImplCopyWith<$Res>
    implements $FindAllCategoryDtoCopyWith<$Res> {
  factory _$$FindAllCategoryDtoImplCopyWith(_$FindAllCategoryDtoImpl value,
          $Res Function(_$FindAllCategoryDtoImpl) then) =
      __$$FindAllCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String outletId});
}

/// @nodoc
class __$$FindAllCategoryDtoImplCopyWithImpl<$Res>
    extends _$FindAllCategoryDtoCopyWithImpl<$Res, _$FindAllCategoryDtoImpl>
    implements _$$FindAllCategoryDtoImplCopyWith<$Res> {
  __$$FindAllCategoryDtoImplCopyWithImpl(_$FindAllCategoryDtoImpl _value,
      $Res Function(_$FindAllCategoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
  }) {
    return _then(_$FindAllCategoryDtoImpl(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FindAllCategoryDtoImpl implements _FindAllCategoryDto {
  const _$FindAllCategoryDtoImpl({required this.outletId});

  @override
  final String outletId;

  @override
  String toString() {
    return 'FindAllCategoryDto(outletId: $outletId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllCategoryDtoImpl &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, outletId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllCategoryDtoImplCopyWith<_$FindAllCategoryDtoImpl> get copyWith =>
      __$$FindAllCategoryDtoImplCopyWithImpl<_$FindAllCategoryDtoImpl>(
          this, _$identity);
}

abstract class _FindAllCategoryDto implements FindAllCategoryDto {
  const factory _FindAllCategoryDto({required final String outletId}) =
      _$FindAllCategoryDtoImpl;

  @override
  String get outletId;
  @override
  @JsonKey(ignore: true)
  _$$FindAllCategoryDtoImplCopyWith<_$FindAllCategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
