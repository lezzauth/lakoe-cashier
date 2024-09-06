// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FindAllTableDto _$FindAllTableDtoFromJson(Map<String, dynamic> json) {
  return _FindAllTableDto.fromJson(json);
}

/// @nodoc
mixin _$FindAllTableDto {
  String get outletId => throw _privateConstructorUsedError;
  String? get outletRoomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FindAllTableDtoCopyWith<FindAllTableDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FindAllTableDtoCopyWith<$Res> {
  factory $FindAllTableDtoCopyWith(
          FindAllTableDto value, $Res Function(FindAllTableDto) then) =
      _$FindAllTableDtoCopyWithImpl<$Res, FindAllTableDto>;
  @useResult
  $Res call({String outletId, String? outletRoomId});
}

/// @nodoc
class _$FindAllTableDtoCopyWithImpl<$Res, $Val extends FindAllTableDto>
    implements $FindAllTableDtoCopyWith<$Res> {
  _$FindAllTableDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
    Object? outletRoomId = freezed,
  }) {
    return _then(_value.copyWith(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      outletRoomId: freezed == outletRoomId
          ? _value.outletRoomId
          : outletRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FindAllTableDtoImplCopyWith<$Res>
    implements $FindAllTableDtoCopyWith<$Res> {
  factory _$$FindAllTableDtoImplCopyWith(_$FindAllTableDtoImpl value,
          $Res Function(_$FindAllTableDtoImpl) then) =
      __$$FindAllTableDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String outletId, String? outletRoomId});
}

/// @nodoc
class __$$FindAllTableDtoImplCopyWithImpl<$Res>
    extends _$FindAllTableDtoCopyWithImpl<$Res, _$FindAllTableDtoImpl>
    implements _$$FindAllTableDtoImplCopyWith<$Res> {
  __$$FindAllTableDtoImplCopyWithImpl(
      _$FindAllTableDtoImpl _value, $Res Function(_$FindAllTableDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletId = null,
    Object? outletRoomId = freezed,
  }) {
    return _then(_$FindAllTableDtoImpl(
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      outletRoomId: freezed == outletRoomId
          ? _value.outletRoomId
          : outletRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FindAllTableDtoImpl implements _FindAllTableDto {
  const _$FindAllTableDtoImpl({required this.outletId, this.outletRoomId});

  factory _$FindAllTableDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FindAllTableDtoImplFromJson(json);

  @override
  final String outletId;
  @override
  final String? outletRoomId;

  @override
  String toString() {
    return 'FindAllTableDto(outletId: $outletId, outletRoomId: $outletRoomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FindAllTableDtoImpl &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.outletRoomId, outletRoomId) ||
                other.outletRoomId == outletRoomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, outletId, outletRoomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FindAllTableDtoImplCopyWith<_$FindAllTableDtoImpl> get copyWith =>
      __$$FindAllTableDtoImplCopyWithImpl<_$FindAllTableDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FindAllTableDtoImplToJson(
      this,
    );
  }
}

abstract class _FindAllTableDto implements FindAllTableDto {
  const factory _FindAllTableDto(
      {required final String outletId,
      final String? outletRoomId}) = _$FindAllTableDtoImpl;

  factory _FindAllTableDto.fromJson(Map<String, dynamic> json) =
      _$FindAllTableDtoImpl.fromJson;

  @override
  String get outletId;
  @override
  String? get outletRoomId;
  @override
  @JsonKey(ignore: true)
  _$$FindAllTableDtoImplCopyWith<_$FindAllTableDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTableDto _$CreateTableDtoFromJson(Map<String, dynamic> json) {
  return _CreateTableDto.fromJson(json);
}

/// @nodoc
mixin _$CreateTableDto {
  String get no => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get outletRoomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTableDtoCopyWith<CreateTableDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTableDtoCopyWith<$Res> {
  factory $CreateTableDtoCopyWith(
          CreateTableDto value, $Res Function(CreateTableDto) then) =
      _$CreateTableDtoCopyWithImpl<$Res, CreateTableDto>;
  @useResult
  $Res call({String no, int capacity, String outletId, String outletRoomId});
}

/// @nodoc
class _$CreateTableDtoCopyWithImpl<$Res, $Val extends CreateTableDto>
    implements $CreateTableDtoCopyWith<$Res> {
  _$CreateTableDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? capacity = null,
    Object? outletId = null,
    Object? outletRoomId = null,
  }) {
    return _then(_value.copyWith(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      outletRoomId: null == outletRoomId
          ? _value.outletRoomId
          : outletRoomId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTableDtoImplCopyWith<$Res>
    implements $CreateTableDtoCopyWith<$Res> {
  factory _$$CreateTableDtoImplCopyWith(_$CreateTableDtoImpl value,
          $Res Function(_$CreateTableDtoImpl) then) =
      __$$CreateTableDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String no, int capacity, String outletId, String outletRoomId});
}

/// @nodoc
class __$$CreateTableDtoImplCopyWithImpl<$Res>
    extends _$CreateTableDtoCopyWithImpl<$Res, _$CreateTableDtoImpl>
    implements _$$CreateTableDtoImplCopyWith<$Res> {
  __$$CreateTableDtoImplCopyWithImpl(
      _$CreateTableDtoImpl _value, $Res Function(_$CreateTableDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = null,
    Object? capacity = null,
    Object? outletId = null,
    Object? outletRoomId = null,
  }) {
    return _then(_$CreateTableDtoImpl(
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      outletRoomId: null == outletRoomId
          ? _value.outletRoomId
          : outletRoomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTableDtoImpl implements _CreateTableDto {
  const _$CreateTableDtoImpl(
      {required this.no,
      required this.capacity,
      required this.outletId,
      required this.outletRoomId});

  factory _$CreateTableDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTableDtoImplFromJson(json);

  @override
  final String no;
  @override
  final int capacity;
  @override
  final String outletId;
  @override
  final String outletRoomId;

  @override
  String toString() {
    return 'CreateTableDto(no: $no, capacity: $capacity, outletId: $outletId, outletRoomId: $outletRoomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTableDtoImpl &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.outletRoomId, outletRoomId) ||
                other.outletRoomId == outletRoomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, no, capacity, outletId, outletRoomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTableDtoImplCopyWith<_$CreateTableDtoImpl> get copyWith =>
      __$$CreateTableDtoImplCopyWithImpl<_$CreateTableDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTableDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateTableDto implements CreateTableDto {
  const factory _CreateTableDto(
      {required final String no,
      required final int capacity,
      required final String outletId,
      required final String outletRoomId}) = _$CreateTableDtoImpl;

  factory _CreateTableDto.fromJson(Map<String, dynamic> json) =
      _$CreateTableDtoImpl.fromJson;

  @override
  String get no;
  @override
  int get capacity;
  @override
  String get outletId;
  @override
  String get outletRoomId;
  @override
  @JsonKey(ignore: true)
  _$$CreateTableDtoImplCopyWith<_$CreateTableDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateTableDto _$UpdateTableDtoFromJson(Map<String, dynamic> json) {
  return _UpdateTableDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateTableDto {
  String? get no => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  String? get outletId => throw _privateConstructorUsedError;
  String? get outletRoomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTableDtoCopyWith<UpdateTableDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTableDtoCopyWith<$Res> {
  factory $UpdateTableDtoCopyWith(
          UpdateTableDto value, $Res Function(UpdateTableDto) then) =
      _$UpdateTableDtoCopyWithImpl<$Res, UpdateTableDto>;
  @useResult
  $Res call(
      {String? no, int? capacity, String? outletId, String? outletRoomId});
}

/// @nodoc
class _$UpdateTableDtoCopyWithImpl<$Res, $Val extends UpdateTableDto>
    implements $UpdateTableDtoCopyWith<$Res> {
  _$UpdateTableDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = freezed,
    Object? capacity = freezed,
    Object? outletId = freezed,
    Object? outletRoomId = freezed,
  }) {
    return _then(_value.copyWith(
      no: freezed == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      outletRoomId: freezed == outletRoomId
          ? _value.outletRoomId
          : outletRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTableDtoImplCopyWith<$Res>
    implements $UpdateTableDtoCopyWith<$Res> {
  factory _$$UpdateTableDtoImplCopyWith(_$UpdateTableDtoImpl value,
          $Res Function(_$UpdateTableDtoImpl) then) =
      __$$UpdateTableDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? no, int? capacity, String? outletId, String? outletRoomId});
}

/// @nodoc
class __$$UpdateTableDtoImplCopyWithImpl<$Res>
    extends _$UpdateTableDtoCopyWithImpl<$Res, _$UpdateTableDtoImpl>
    implements _$$UpdateTableDtoImplCopyWith<$Res> {
  __$$UpdateTableDtoImplCopyWithImpl(
      _$UpdateTableDtoImpl _value, $Res Function(_$UpdateTableDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? no = freezed,
    Object? capacity = freezed,
    Object? outletId = freezed,
    Object? outletRoomId = freezed,
  }) {
    return _then(_$UpdateTableDtoImpl(
      no: freezed == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      outletRoomId: freezed == outletRoomId
          ? _value.outletRoomId
          : outletRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateTableDtoImpl implements _UpdateTableDto {
  const _$UpdateTableDtoImpl(
      {this.no, this.capacity, this.outletId, this.outletRoomId});

  factory _$UpdateTableDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateTableDtoImplFromJson(json);

  @override
  final String? no;
  @override
  final int? capacity;
  @override
  final String? outletId;
  @override
  final String? outletRoomId;

  @override
  String toString() {
    return 'UpdateTableDto(no: $no, capacity: $capacity, outletId: $outletId, outletRoomId: $outletRoomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTableDtoImpl &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.outletRoomId, outletRoomId) ||
                other.outletRoomId == outletRoomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, no, capacity, outletId, outletRoomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTableDtoImplCopyWith<_$UpdateTableDtoImpl> get copyWith =>
      __$$UpdateTableDtoImplCopyWithImpl<_$UpdateTableDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTableDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateTableDto implements UpdateTableDto {
  const factory _UpdateTableDto(
      {final String? no,
      final int? capacity,
      final String? outletId,
      final String? outletRoomId}) = _$UpdateTableDtoImpl;

  factory _UpdateTableDto.fromJson(Map<String, dynamic> json) =
      _$UpdateTableDtoImpl.fromJson;

  @override
  String? get no;
  @override
  int? get capacity;
  @override
  String? get outletId;
  @override
  String? get outletRoomId;
  @override
  @JsonKey(ignore: true)
  _$$UpdateTableDtoImplCopyWith<_$UpdateTableDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
