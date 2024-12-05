// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) {
  return _EmployeeModel.fromJson(json);
}

/// @nodoc
mixin _$EmployeeModel {
  String get id => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  bool get phoneVerified => throw _privateConstructorUsedError;
  String get outletId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this EmployeeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeModelCopyWith<EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeModelCopyWith<$Res> {
  factory $EmployeeModelCopyWith(
          EmployeeModel value, $Res Function(EmployeeModel) then) =
      _$EmployeeModelCopyWithImpl<$Res, EmployeeModel>;
  @useResult
  $Res call(
      {String id,
      String role,
      String name,
      String phoneNumber,
      String? email,
      String? profilePicture,
      bool emailVerified,
      bool phoneVerified,
      String outletId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$EmployeeModelCopyWithImpl<$Res, $Val extends EmployeeModel>
    implements $EmployeeModelCopyWith<$Res> {
  _$EmployeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? profilePicture = freezed,
    Object? emailVerified = null,
    Object? phoneVerified = null,
    Object? outletId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneVerified: null == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeModelImplCopyWith<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  factory _$$EmployeeModelImplCopyWith(
          _$EmployeeModelImpl value, $Res Function(_$EmployeeModelImpl) then) =
      __$$EmployeeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String role,
      String name,
      String phoneNumber,
      String? email,
      String? profilePicture,
      bool emailVerified,
      bool phoneVerified,
      String outletId,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$EmployeeModelImplCopyWithImpl<$Res>
    extends _$EmployeeModelCopyWithImpl<$Res, _$EmployeeModelImpl>
    implements _$$EmployeeModelImplCopyWith<$Res> {
  __$$EmployeeModelImplCopyWithImpl(
      _$EmployeeModelImpl _value, $Res Function(_$EmployeeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? profilePicture = freezed,
    Object? emailVerified = null,
    Object? phoneVerified = null,
    Object? outletId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$EmployeeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneVerified: null == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      outletId: null == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeModelImpl implements _EmployeeModel {
  const _$EmployeeModelImpl(
      {required this.id,
      required this.role,
      required this.name,
      required this.phoneNumber,
      this.email,
      this.profilePicture,
      required this.emailVerified,
      required this.phoneVerified,
      required this.outletId,
      required this.createdAt,
      required this.updatedAt});

  factory _$EmployeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeModelImplFromJson(json);

  @override
  final String id;
  @override
  final String role;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String? email;
  @override
  final String? profilePicture;
  @override
  final bool emailVerified;
  @override
  final bool phoneVerified;
  @override
  final String outletId;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'EmployeeModel(id: $id, role: $role, name: $name, phoneNumber: $phoneNumber, email: $email, profilePicture: $profilePicture, emailVerified: $emailVerified, phoneVerified: $phoneVerified, outletId: $outletId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.phoneVerified, phoneVerified) ||
                other.phoneVerified == phoneVerified) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      role,
      name,
      phoneNumber,
      email,
      profilePicture,
      emailVerified,
      phoneVerified,
      outletId,
      createdAt,
      updatedAt);

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeModelImplCopyWith<_$EmployeeModelImpl> get copyWith =>
      __$$EmployeeModelImplCopyWithImpl<_$EmployeeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeModelImplToJson(
      this,
    );
  }
}

abstract class _EmployeeModel implements EmployeeModel {
  const factory _EmployeeModel(
      {required final String id,
      required final String role,
      required final String name,
      required final String phoneNumber,
      final String? email,
      final String? profilePicture,
      required final bool emailVerified,
      required final bool phoneVerified,
      required final String outletId,
      required final String createdAt,
      required final String updatedAt}) = _$EmployeeModelImpl;

  factory _EmployeeModel.fromJson(Map<String, dynamic> json) =
      _$EmployeeModelImpl.fromJson;

  @override
  String get id;
  @override
  String get role;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String? get email;
  @override
  String? get profilePicture;
  @override
  bool get emailVerified;
  @override
  bool get phoneVerified;
  @override
  String get outletId;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeModelImplCopyWith<_$EmployeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestOtpRes _$RequestOtpResFromJson(Map<String, dynamic> json) {
  return _RequestOtpRes.fromJson(json);
}

/// @nodoc
mixin _$RequestOtpRes {
  String get id => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RequestOtpRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestOtpResCopyWith<RequestOtpRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOtpResCopyWith<$Res> {
  factory $RequestOtpResCopyWith(
          RequestOtpRes value, $Res Function(RequestOtpRes) then) =
      _$RequestOtpResCopyWithImpl<$Res, RequestOtpRes>;
  @useResult
  $Res call(
      {String id,
      String target,
      String type,
      String action,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$RequestOtpResCopyWithImpl<$Res, $Val extends RequestOtpRes>
    implements $RequestOtpResCopyWith<$Res> {
  _$RequestOtpResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? target = null,
    Object? type = null,
    Object? action = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOtpResImplCopyWith<$Res>
    implements $RequestOtpResCopyWith<$Res> {
  factory _$$RequestOtpResImplCopyWith(
          _$RequestOtpResImpl value, $Res Function(_$RequestOtpResImpl) then) =
      __$$RequestOtpResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String target,
      String type,
      String action,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$RequestOtpResImplCopyWithImpl<$Res>
    extends _$RequestOtpResCopyWithImpl<$Res, _$RequestOtpResImpl>
    implements _$$RequestOtpResImplCopyWith<$Res> {
  __$$RequestOtpResImplCopyWithImpl(
      _$RequestOtpResImpl _value, $Res Function(_$RequestOtpResImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? target = null,
    Object? type = null,
    Object? action = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RequestOtpResImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOtpResImpl implements _RequestOtpRes {
  const _$RequestOtpResImpl(
      {required this.id,
      required this.target,
      required this.type,
      required this.action,
      required this.createdAt,
      required this.updatedAt});

  factory _$RequestOtpResImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOtpResImplFromJson(json);

  @override
  final String id;
  @override
  final String target;
  @override
  final String type;
  @override
  final String action;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'RequestOtpRes(id: $id, target: $target, type: $type, action: $action, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOtpResImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, target, type, action, createdAt, updatedAt);

  /// Create a copy of RequestOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOtpResImplCopyWith<_$RequestOtpResImpl> get copyWith =>
      __$$RequestOtpResImplCopyWithImpl<_$RequestOtpResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOtpResImplToJson(
      this,
    );
  }
}

abstract class _RequestOtpRes implements RequestOtpRes {
  const factory _RequestOtpRes(
      {required final String id,
      required final String target,
      required final String type,
      required final String action,
      required final String createdAt,
      required final String updatedAt}) = _$RequestOtpResImpl;

  factory _RequestOtpRes.fromJson(Map<String, dynamic> json) =
      _$RequestOtpResImpl.fromJson;

  @override
  String get id;
  @override
  String get target;
  @override
  String get type;
  @override
  String get action;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of RequestOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestOtpResImplCopyWith<_$RequestOtpResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifyOtpRes _$VerifyOtpResFromJson(Map<String, dynamic> json) {
  return _VerifyOtpRes.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpRes {
  String get token => throw _privateConstructorUsedError;

  /// Serializes this VerifyOtpRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOtpResCopyWith<VerifyOtpRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpResCopyWith<$Res> {
  factory $VerifyOtpResCopyWith(
          VerifyOtpRes value, $Res Function(VerifyOtpRes) then) =
      _$VerifyOtpResCopyWithImpl<$Res, VerifyOtpRes>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$VerifyOtpResCopyWithImpl<$Res, $Val extends VerifyOtpRes>
    implements $VerifyOtpResCopyWith<$Res> {
  _$VerifyOtpResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpResImplCopyWith<$Res>
    implements $VerifyOtpResCopyWith<$Res> {
  factory _$$VerifyOtpResImplCopyWith(
          _$VerifyOtpResImpl value, $Res Function(_$VerifyOtpResImpl) then) =
      __$$VerifyOtpResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$VerifyOtpResImplCopyWithImpl<$Res>
    extends _$VerifyOtpResCopyWithImpl<$Res, _$VerifyOtpResImpl>
    implements _$$VerifyOtpResImplCopyWith<$Res> {
  __$$VerifyOtpResImplCopyWithImpl(
      _$VerifyOtpResImpl _value, $Res Function(_$VerifyOtpResImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$VerifyOtpResImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpResImpl implements _VerifyOtpRes {
  const _$VerifyOtpResImpl({required this.token});

  factory _$VerifyOtpResImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpResImplFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'VerifyOtpRes(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpResImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of VerifyOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpResImplCopyWith<_$VerifyOtpResImpl> get copyWith =>
      __$$VerifyOtpResImplCopyWithImpl<_$VerifyOtpResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpResImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpRes implements VerifyOtpRes {
  const factory _VerifyOtpRes({required final String token}) =
      _$VerifyOtpResImpl;

  factory _VerifyOtpRes.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpResImpl.fromJson;

  @override
  String get token;

  /// Create a copy of VerifyOtpRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpResImplCopyWith<_$VerifyOtpResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
