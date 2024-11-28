// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OwnerProfileModel _$OwnerProfileModelFromJson(Map<String, dynamic> json) {
  return _OwnerProfileModel.fromJson(json);
}

/// @nodoc
mixin _$OwnerProfileModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  List<Outlet> get outlets => throw _privateConstructorUsedError;

  /// Serializes this OwnerProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OwnerProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OwnerProfileModelCopyWith<OwnerProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerProfileModelCopyWith<$Res> {
  factory $OwnerProfileModelCopyWith(
          OwnerProfileModel value, $Res Function(OwnerProfileModel) then) =
      _$OwnerProfileModelCopyWithImpl<$Res, OwnerProfileModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String phoneNumber,
      String packageName,
      String? email,
      List<Outlet> outlets});
}

/// @nodoc
class _$OwnerProfileModelCopyWithImpl<$Res, $Val extends OwnerProfileModel>
    implements $OwnerProfileModelCopyWith<$Res> {
  _$OwnerProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OwnerProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? packageName = null,
    Object? email = freezed,
    Object? outlets = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      outlets: null == outlets
          ? _value.outlets
          : outlets // ignore: cast_nullable_to_non_nullable
              as List<Outlet>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnerProfileModelImplCopyWith<$Res>
    implements $OwnerProfileModelCopyWith<$Res> {
  factory _$$OwnerProfileModelImplCopyWith(_$OwnerProfileModelImpl value,
          $Res Function(_$OwnerProfileModelImpl) then) =
      __$$OwnerProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phoneNumber,
      String packageName,
      String? email,
      List<Outlet> outlets});
}

/// @nodoc
class __$$OwnerProfileModelImplCopyWithImpl<$Res>
    extends _$OwnerProfileModelCopyWithImpl<$Res, _$OwnerProfileModelImpl>
    implements _$$OwnerProfileModelImplCopyWith<$Res> {
  __$$OwnerProfileModelImplCopyWithImpl(_$OwnerProfileModelImpl _value,
      $Res Function(_$OwnerProfileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OwnerProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? packageName = null,
    Object? email = freezed,
    Object? outlets = null,
  }) {
    return _then(_$OwnerProfileModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      outlets: null == outlets
          ? _value._outlets
          : outlets // ignore: cast_nullable_to_non_nullable
              as List<Outlet>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerProfileModelImpl implements _OwnerProfileModel {
  const _$OwnerProfileModelImpl(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.packageName,
      this.email,
      required final List<Outlet> outlets})
      : _outlets = outlets;

  factory _$OwnerProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerProfileModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String packageName;
  @override
  final String? email;
  final List<Outlet> _outlets;
  @override
  List<Outlet> get outlets {
    if (_outlets is EqualUnmodifiableListView) return _outlets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_outlets);
  }

  @override
  String toString() {
    return 'OwnerProfileModel(id: $id, name: $name, phoneNumber: $phoneNumber, packageName: $packageName, email: $email, outlets: $outlets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other._outlets, _outlets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phoneNumber,
      packageName, email, const DeepCollectionEquality().hash(_outlets));

  /// Create a copy of OwnerProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerProfileModelImplCopyWith<_$OwnerProfileModelImpl> get copyWith =>
      __$$OwnerProfileModelImplCopyWithImpl<_$OwnerProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerProfileModelImplToJson(
      this,
    );
  }
}

abstract class _OwnerProfileModel implements OwnerProfileModel {
  const factory _OwnerProfileModel(
      {required final String id,
      required final String name,
      required final String phoneNumber,
      required final String packageName,
      final String? email,
      required final List<Outlet> outlets}) = _$OwnerProfileModelImpl;

  factory _OwnerProfileModel.fromJson(Map<String, dynamic> json) =
      _$OwnerProfileModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get packageName;
  @override
  String? get email;
  @override
  List<Outlet> get outlets;

  /// Create a copy of OwnerProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OwnerProfileModelImplCopyWith<_$OwnerProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Outlet _$OutletFromJson(Map<String, dynamic> json) {
  return _Outlet.fromJson(json);
}

/// @nodoc
mixin _$Outlet {
  String get logo => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this Outlet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Outlet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutletCopyWith<Outlet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutletCopyWith<$Res> {
  factory $OutletCopyWith(Outlet value, $Res Function(Outlet) then) =
      _$OutletCopyWithImpl<$Res, Outlet>;
  @useResult
  $Res call({String logo, String name, String address});
}

/// @nodoc
class _$OutletCopyWithImpl<$Res, $Val extends Outlet>
    implements $OutletCopyWith<$Res> {
  _$OutletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Outlet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = null,
    Object? name = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutletImplCopyWith<$Res> implements $OutletCopyWith<$Res> {
  factory _$$OutletImplCopyWith(
          _$OutletImpl value, $Res Function(_$OutletImpl) then) =
      __$$OutletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String logo, String name, String address});
}

/// @nodoc
class __$$OutletImplCopyWithImpl<$Res>
    extends _$OutletCopyWithImpl<$Res, _$OutletImpl>
    implements _$$OutletImplCopyWith<$Res> {
  __$$OutletImplCopyWithImpl(
      _$OutletImpl _value, $Res Function(_$OutletImpl) _then)
      : super(_value, _then);

  /// Create a copy of Outlet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = null,
    Object? name = null,
    Object? address = null,
  }) {
    return _then(_$OutletImpl(
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutletImpl implements _Outlet {
  const _$OutletImpl(
      {required this.logo, required this.name, required this.address});

  factory _$OutletImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutletImplFromJson(json);

  @override
  final String logo;
  @override
  final String name;
  @override
  final String address;

  @override
  String toString() {
    return 'Outlet(logo: $logo, name: $name, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutletImpl &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, logo, name, address);

  /// Create a copy of Outlet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutletImplCopyWith<_$OutletImpl> get copyWith =>
      __$$OutletImplCopyWithImpl<_$OutletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutletImplToJson(
      this,
    );
  }
}

abstract class _Outlet implements Outlet {
  const factory _Outlet(
      {required final String logo,
      required final String name,
      required final String address}) = _$OutletImpl;

  factory _Outlet.fromJson(Map<String, dynamic> json) = _$OutletImpl.fromJson;

  @override
  String get logo;
  @override
  String get name;
  @override
  String get address;

  /// Create a copy of Outlet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutletImplCopyWith<_$OutletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateOwnerModel _$UpdateOwnerModelFromJson(Map<String, dynamic> json) {
  return _UpdateOwnerModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateOwnerModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get balance => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  bool get phoneVerified => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  String? get packageExpiretAt => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UpdateOwnerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateOwnerModelCopyWith<UpdateOwnerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateOwnerModelCopyWith<$Res> {
  factory $UpdateOwnerModelCopyWith(
          UpdateOwnerModel value, $Res Function(UpdateOwnerModel) then) =
      _$UpdateOwnerModelCopyWithImpl<$Res, UpdateOwnerModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String phoneNumber,
      String? email,
      String balance,
      bool emailVerified,
      bool phoneVerified,
      String packageName,
      String? packageExpiretAt,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$UpdateOwnerModelCopyWithImpl<$Res, $Val extends UpdateOwnerModel>
    implements $UpdateOwnerModelCopyWith<$Res> {
  _$UpdateOwnerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? balance = null,
    Object? emailVerified = null,
    Object? phoneVerified = null,
    Object? packageName = null,
    Object? packageExpiretAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneVerified: null == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      packageExpiretAt: freezed == packageExpiretAt
          ? _value.packageExpiretAt
          : packageExpiretAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$UpdateOwnerModelImplCopyWith<$Res>
    implements $UpdateOwnerModelCopyWith<$Res> {
  factory _$$UpdateOwnerModelImplCopyWith(_$UpdateOwnerModelImpl value,
          $Res Function(_$UpdateOwnerModelImpl) then) =
      __$$UpdateOwnerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phoneNumber,
      String? email,
      String balance,
      bool emailVerified,
      bool phoneVerified,
      String packageName,
      String? packageExpiretAt,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$UpdateOwnerModelImplCopyWithImpl<$Res>
    extends _$UpdateOwnerModelCopyWithImpl<$Res, _$UpdateOwnerModelImpl>
    implements _$$UpdateOwnerModelImplCopyWith<$Res> {
  __$$UpdateOwnerModelImplCopyWithImpl(_$UpdateOwnerModelImpl _value,
      $Res Function(_$UpdateOwnerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? balance = null,
    Object? emailVerified = null,
    Object? phoneVerified = null,
    Object? packageName = null,
    Object? packageExpiretAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UpdateOwnerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneVerified: null == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      packageExpiretAt: freezed == packageExpiretAt
          ? _value.packageExpiretAt
          : packageExpiretAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$UpdateOwnerModelImpl implements _UpdateOwnerModel {
  const _$UpdateOwnerModelImpl(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      this.email,
      required this.balance,
      required this.emailVerified,
      required this.phoneVerified,
      required this.packageName,
      this.packageExpiretAt,
      required this.createdAt,
      required this.updatedAt});

  factory _$UpdateOwnerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateOwnerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String? email;
  @override
  final String balance;
  @override
  final bool emailVerified;
  @override
  final bool phoneVerified;
  @override
  final String packageName;
  @override
  final String? packageExpiretAt;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'UpdateOwnerModel(id: $id, name: $name, phoneNumber: $phoneNumber, email: $email, balance: $balance, emailVerified: $emailVerified, phoneVerified: $phoneVerified, packageName: $packageName, packageExpiretAt: $packageExpiretAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateOwnerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.phoneVerified, phoneVerified) ||
                other.phoneVerified == phoneVerified) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.packageExpiretAt, packageExpiretAt) ||
                other.packageExpiretAt == packageExpiretAt) &&
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
      name,
      phoneNumber,
      email,
      balance,
      emailVerified,
      phoneVerified,
      packageName,
      packageExpiretAt,
      createdAt,
      updatedAt);

  /// Create a copy of UpdateOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateOwnerModelImplCopyWith<_$UpdateOwnerModelImpl> get copyWith =>
      __$$UpdateOwnerModelImplCopyWithImpl<_$UpdateOwnerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateOwnerModelImplToJson(
      this,
    );
  }
}

abstract class _UpdateOwnerModel implements UpdateOwnerModel {
  const factory _UpdateOwnerModel(
      {required final String id,
      required final String name,
      required final String phoneNumber,
      final String? email,
      required final String balance,
      required final bool emailVerified,
      required final bool phoneVerified,
      required final String packageName,
      final String? packageExpiretAt,
      required final String createdAt,
      required final String updatedAt}) = _$UpdateOwnerModelImpl;

  factory _UpdateOwnerModel.fromJson(Map<String, dynamic> json) =
      _$UpdateOwnerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String? get email;
  @override
  String get balance;
  @override
  bool get emailVerified;
  @override
  bool get phoneVerified;
  @override
  String get packageName;
  @override
  String? get packageExpiretAt;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of UpdateOwnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateOwnerModelImplCopyWith<_$UpdateOwnerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
