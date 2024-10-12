// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tracking _$TrackingFromJson(Map<String, dynamic> json) {
  return _Tracking.fromJson(json);
}

/// @nodoc
mixin _$Tracking {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get object => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'waybill_id')
  String get waybillId => throw _privateConstructorUsedError;
  TrackingCourier get courier => throw _privateConstructorUsedError;
  TrackingDestination get destination => throw _privateConstructorUsedError;
  List<TrackingHistory> get history => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  TrackingOrigin get origin => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this Tracking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tracking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackingCopyWith<Tracking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingCopyWith<$Res> {
  factory $TrackingCopyWith(Tracking value, $Res Function(Tracking) then) =
      _$TrackingCopyWithImpl<$Res, Tracking>;
  @useResult
  $Res call(
      {bool success,
      String message,
      String object,
      String id,
      @JsonKey(name: 'waybill_id') String waybillId,
      TrackingCourier courier,
      TrackingDestination destination,
      List<TrackingHistory> history,
      String? link,
      @JsonKey(name: 'order_id') String orderId,
      TrackingOrigin origin,
      String status});

  $TrackingCourierCopyWith<$Res> get courier;
  $TrackingDestinationCopyWith<$Res> get destination;
  $TrackingOriginCopyWith<$Res> get origin;
}

/// @nodoc
class _$TrackingCopyWithImpl<$Res, $Val extends Tracking>
    implements $TrackingCopyWith<$Res> {
  _$TrackingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tracking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? object = null,
    Object? id = null,
    Object? waybillId = null,
    Object? courier = null,
    Object? destination = null,
    Object? history = null,
    Object? link = freezed,
    Object? orderId = null,
    Object? origin = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      waybillId: null == waybillId
          ? _value.waybillId
          : waybillId // ignore: cast_nullable_to_non_nullable
              as String,
      courier: null == courier
          ? _value.courier
          : courier // ignore: cast_nullable_to_non_nullable
              as TrackingCourier,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as TrackingDestination,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<TrackingHistory>,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as TrackingOrigin,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Tracking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrackingCourierCopyWith<$Res> get courier {
    return $TrackingCourierCopyWith<$Res>(_value.courier, (value) {
      return _then(_value.copyWith(courier: value) as $Val);
    });
  }

  /// Create a copy of Tracking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrackingDestinationCopyWith<$Res> get destination {
    return $TrackingDestinationCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }

  /// Create a copy of Tracking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrackingOriginCopyWith<$Res> get origin {
    return $TrackingOriginCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrackingImplCopyWith<$Res>
    implements $TrackingCopyWith<$Res> {
  factory _$$TrackingImplCopyWith(
          _$TrackingImpl value, $Res Function(_$TrackingImpl) then) =
      __$$TrackingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String message,
      String object,
      String id,
      @JsonKey(name: 'waybill_id') String waybillId,
      TrackingCourier courier,
      TrackingDestination destination,
      List<TrackingHistory> history,
      String? link,
      @JsonKey(name: 'order_id') String orderId,
      TrackingOrigin origin,
      String status});

  @override
  $TrackingCourierCopyWith<$Res> get courier;
  @override
  $TrackingDestinationCopyWith<$Res> get destination;
  @override
  $TrackingOriginCopyWith<$Res> get origin;
}

/// @nodoc
class __$$TrackingImplCopyWithImpl<$Res>
    extends _$TrackingCopyWithImpl<$Res, _$TrackingImpl>
    implements _$$TrackingImplCopyWith<$Res> {
  __$$TrackingImplCopyWithImpl(
      _$TrackingImpl _value, $Res Function(_$TrackingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tracking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? object = null,
    Object? id = null,
    Object? waybillId = null,
    Object? courier = null,
    Object? destination = null,
    Object? history = null,
    Object? link = freezed,
    Object? orderId = null,
    Object? origin = null,
    Object? status = null,
  }) {
    return _then(_$TrackingImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      waybillId: null == waybillId
          ? _value.waybillId
          : waybillId // ignore: cast_nullable_to_non_nullable
              as String,
      courier: null == courier
          ? _value.courier
          : courier // ignore: cast_nullable_to_non_nullable
              as TrackingCourier,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as TrackingDestination,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<TrackingHistory>,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as TrackingOrigin,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackingImpl implements _Tracking {
  const _$TrackingImpl(
      {required this.success,
      required this.message,
      required this.object,
      required this.id,
      @JsonKey(name: 'waybill_id') required this.waybillId,
      required this.courier,
      required this.destination,
      required final List<TrackingHistory> history,
      this.link,
      @JsonKey(name: 'order_id') required this.orderId,
      required this.origin,
      required this.status})
      : _history = history;

  factory _$TrackingImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final String object;
  @override
  final String id;
  @override
  @JsonKey(name: 'waybill_id')
  final String waybillId;
  @override
  final TrackingCourier courier;
  @override
  final TrackingDestination destination;
  final List<TrackingHistory> _history;
  @override
  List<TrackingHistory> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final String? link;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  final TrackingOrigin origin;
  @override
  final String status;

  @override
  String toString() {
    return 'Tracking(success: $success, message: $message, object: $object, id: $id, waybillId: $waybillId, courier: $courier, destination: $destination, history: $history, link: $link, orderId: $orderId, origin: $origin, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.waybillId, waybillId) ||
                other.waybillId == waybillId) &&
            (identical(other.courier, courier) || other.courier == courier) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      message,
      object,
      id,
      waybillId,
      courier,
      destination,
      const DeepCollectionEquality().hash(_history),
      link,
      orderId,
      origin,
      status);

  /// Create a copy of Tracking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingImplCopyWith<_$TrackingImpl> get copyWith =>
      __$$TrackingImplCopyWithImpl<_$TrackingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingImplToJson(
      this,
    );
  }
}

abstract class _Tracking implements Tracking {
  const factory _Tracking(
      {required final bool success,
      required final String message,
      required final String object,
      required final String id,
      @JsonKey(name: 'waybill_id') required final String waybillId,
      required final TrackingCourier courier,
      required final TrackingDestination destination,
      required final List<TrackingHistory> history,
      final String? link,
      @JsonKey(name: 'order_id') required final String orderId,
      required final TrackingOrigin origin,
      required final String status}) = _$TrackingImpl;

  factory _Tracking.fromJson(Map<String, dynamic> json) =
      _$TrackingImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  String get object;
  @override
  String get id;
  @override
  @JsonKey(name: 'waybill_id')
  String get waybillId;
  @override
  TrackingCourier get courier;
  @override
  TrackingDestination get destination;
  @override
  List<TrackingHistory> get history;
  @override
  String? get link;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  TrackingOrigin get origin;
  @override
  String get status;

  /// Create a copy of Tracking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackingImplCopyWith<_$TrackingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrackingCourier _$TrackingCourierFromJson(Map<String, dynamic> json) {
  return _TrackingCourier.fromJson(json);
}

/// @nodoc
mixin _$TrackingCourier {
  String get company => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_name')
  String? get driverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_phone')
  String? get driverPhone => throw _privateConstructorUsedError;

  /// Serializes this TrackingCourier to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackingCourier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackingCourierCopyWith<TrackingCourier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingCourierCopyWith<$Res> {
  factory $TrackingCourierCopyWith(
          TrackingCourier value, $Res Function(TrackingCourier) then) =
      _$TrackingCourierCopyWithImpl<$Res, TrackingCourier>;
  @useResult
  $Res call(
      {String company,
      String? name,
      String? phone,
      @JsonKey(name: 'driver_name') String? driverName,
      @JsonKey(name: 'driver_phone') String? driverPhone});
}

/// @nodoc
class _$TrackingCourierCopyWithImpl<$Res, $Val extends TrackingCourier>
    implements $TrackingCourierCopyWith<$Res> {
  _$TrackingCourierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackingCourier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
  }) {
    return _then(_value.copyWith(
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPhone: freezed == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackingCourierImplCopyWith<$Res>
    implements $TrackingCourierCopyWith<$Res> {
  factory _$$TrackingCourierImplCopyWith(_$TrackingCourierImpl value,
          $Res Function(_$TrackingCourierImpl) then) =
      __$$TrackingCourierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String company,
      String? name,
      String? phone,
      @JsonKey(name: 'driver_name') String? driverName,
      @JsonKey(name: 'driver_phone') String? driverPhone});
}

/// @nodoc
class __$$TrackingCourierImplCopyWithImpl<$Res>
    extends _$TrackingCourierCopyWithImpl<$Res, _$TrackingCourierImpl>
    implements _$$TrackingCourierImplCopyWith<$Res> {
  __$$TrackingCourierImplCopyWithImpl(
      _$TrackingCourierImpl _value, $Res Function(_$TrackingCourierImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackingCourier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? driverName = freezed,
    Object? driverPhone = freezed,
  }) {
    return _then(_$TrackingCourierImpl(
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      driverPhone: freezed == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackingCourierImpl implements _TrackingCourier {
  const _$TrackingCourierImpl(
      {required this.company,
      this.name,
      this.phone,
      @JsonKey(name: 'driver_name') this.driverName,
      @JsonKey(name: 'driver_phone') this.driverPhone});

  factory _$TrackingCourierImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingCourierImplFromJson(json);

  @override
  final String company;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'driver_name')
  final String? driverName;
  @override
  @JsonKey(name: 'driver_phone')
  final String? driverPhone;

  @override
  String toString() {
    return 'TrackingCourier(company: $company, name: $name, phone: $phone, driverName: $driverName, driverPhone: $driverPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingCourierImpl &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, company, name, phone, driverName, driverPhone);

  /// Create a copy of TrackingCourier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingCourierImplCopyWith<_$TrackingCourierImpl> get copyWith =>
      __$$TrackingCourierImplCopyWithImpl<_$TrackingCourierImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingCourierImplToJson(
      this,
    );
  }
}

abstract class _TrackingCourier implements TrackingCourier {
  const factory _TrackingCourier(
          {required final String company,
          final String? name,
          final String? phone,
          @JsonKey(name: 'driver_name') final String? driverName,
          @JsonKey(name: 'driver_phone') final String? driverPhone}) =
      _$TrackingCourierImpl;

  factory _TrackingCourier.fromJson(Map<String, dynamic> json) =
      _$TrackingCourierImpl.fromJson;

  @override
  String get company;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'driver_name')
  String? get driverName;
  @override
  @JsonKey(name: 'driver_phone')
  String? get driverPhone;

  /// Create a copy of TrackingCourier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackingCourierImplCopyWith<_$TrackingCourierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrackingDestination _$TrackingDestinationFromJson(Map<String, dynamic> json) {
  return _TrackingDestination.fromJson(json);
}

/// @nodoc
mixin _$TrackingDestination {
  @JsonKey(name: 'contact_name')
  String get contactName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this TrackingDestination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackingDestination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackingDestinationCopyWith<TrackingDestination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingDestinationCopyWith<$Res> {
  factory $TrackingDestinationCopyWith(
          TrackingDestination value, $Res Function(TrackingDestination) then) =
      _$TrackingDestinationCopyWithImpl<$Res, TrackingDestination>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contact_name') String contactName, String address});
}

/// @nodoc
class _$TrackingDestinationCopyWithImpl<$Res, $Val extends TrackingDestination>
    implements $TrackingDestinationCopyWith<$Res> {
  _$TrackingDestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackingDestination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactName = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      contactName: null == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackingDestinationImplCopyWith<$Res>
    implements $TrackingDestinationCopyWith<$Res> {
  factory _$$TrackingDestinationImplCopyWith(_$TrackingDestinationImpl value,
          $Res Function(_$TrackingDestinationImpl) then) =
      __$$TrackingDestinationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contact_name') String contactName, String address});
}

/// @nodoc
class __$$TrackingDestinationImplCopyWithImpl<$Res>
    extends _$TrackingDestinationCopyWithImpl<$Res, _$TrackingDestinationImpl>
    implements _$$TrackingDestinationImplCopyWith<$Res> {
  __$$TrackingDestinationImplCopyWithImpl(_$TrackingDestinationImpl _value,
      $Res Function(_$TrackingDestinationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackingDestination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactName = null,
    Object? address = null,
  }) {
    return _then(_$TrackingDestinationImpl(
      contactName: null == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
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
class _$TrackingDestinationImpl implements _TrackingDestination {
  const _$TrackingDestinationImpl(
      {@JsonKey(name: 'contact_name') required this.contactName,
      required this.address});

  factory _$TrackingDestinationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingDestinationImplFromJson(json);

  @override
  @JsonKey(name: 'contact_name')
  final String contactName;
  @override
  final String address;

  @override
  String toString() {
    return 'TrackingDestination(contactName: $contactName, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingDestinationImpl &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, contactName, address);

  /// Create a copy of TrackingDestination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingDestinationImplCopyWith<_$TrackingDestinationImpl> get copyWith =>
      __$$TrackingDestinationImplCopyWithImpl<_$TrackingDestinationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingDestinationImplToJson(
      this,
    );
  }
}

abstract class _TrackingDestination implements TrackingDestination {
  const factory _TrackingDestination(
      {@JsonKey(name: 'contact_name') required final String contactName,
      required final String address}) = _$TrackingDestinationImpl;

  factory _TrackingDestination.fromJson(Map<String, dynamic> json) =
      _$TrackingDestinationImpl.fromJson;

  @override
  @JsonKey(name: 'contact_name')
  String get contactName;
  @override
  String get address;

  /// Create a copy of TrackingDestination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackingDestinationImplCopyWith<_$TrackingDestinationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrackingOrigin _$TrackingOriginFromJson(Map<String, dynamic> json) {
  return _TrackingOrigin.fromJson(json);
}

/// @nodoc
mixin _$TrackingOrigin {
  @JsonKey(name: 'contact_name')
  String get contactName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this TrackingOrigin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackingOrigin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackingOriginCopyWith<TrackingOrigin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingOriginCopyWith<$Res> {
  factory $TrackingOriginCopyWith(
          TrackingOrigin value, $Res Function(TrackingOrigin) then) =
      _$TrackingOriginCopyWithImpl<$Res, TrackingOrigin>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contact_name') String contactName, String address});
}

/// @nodoc
class _$TrackingOriginCopyWithImpl<$Res, $Val extends TrackingOrigin>
    implements $TrackingOriginCopyWith<$Res> {
  _$TrackingOriginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackingOrigin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactName = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      contactName: null == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackingOriginImplCopyWith<$Res>
    implements $TrackingOriginCopyWith<$Res> {
  factory _$$TrackingOriginImplCopyWith(_$TrackingOriginImpl value,
          $Res Function(_$TrackingOriginImpl) then) =
      __$$TrackingOriginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contact_name') String contactName, String address});
}

/// @nodoc
class __$$TrackingOriginImplCopyWithImpl<$Res>
    extends _$TrackingOriginCopyWithImpl<$Res, _$TrackingOriginImpl>
    implements _$$TrackingOriginImplCopyWith<$Res> {
  __$$TrackingOriginImplCopyWithImpl(
      _$TrackingOriginImpl _value, $Res Function(_$TrackingOriginImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackingOrigin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactName = null,
    Object? address = null,
  }) {
    return _then(_$TrackingOriginImpl(
      contactName: null == contactName
          ? _value.contactName
          : contactName // ignore: cast_nullable_to_non_nullable
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
class _$TrackingOriginImpl implements _TrackingOrigin {
  const _$TrackingOriginImpl(
      {@JsonKey(name: 'contact_name') required this.contactName,
      required this.address});

  factory _$TrackingOriginImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingOriginImplFromJson(json);

  @override
  @JsonKey(name: 'contact_name')
  final String contactName;
  @override
  final String address;

  @override
  String toString() {
    return 'TrackingOrigin(contactName: $contactName, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingOriginImpl &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, contactName, address);

  /// Create a copy of TrackingOrigin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingOriginImplCopyWith<_$TrackingOriginImpl> get copyWith =>
      __$$TrackingOriginImplCopyWithImpl<_$TrackingOriginImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingOriginImplToJson(
      this,
    );
  }
}

abstract class _TrackingOrigin implements TrackingOrigin {
  const factory _TrackingOrigin(
      {@JsonKey(name: 'contact_name') required final String contactName,
      required final String address}) = _$TrackingOriginImpl;

  factory _TrackingOrigin.fromJson(Map<String, dynamic> json) =
      _$TrackingOriginImpl.fromJson;

  @override
  @JsonKey(name: 'contact_name')
  String get contactName;
  @override
  String get address;

  /// Create a copy of TrackingOrigin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackingOriginImplCopyWith<_$TrackingOriginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrackingHistory _$TrackingHistoryFromJson(Map<String, dynamic> json) {
  return _TrackingHistory.fromJson(json);
}

/// @nodoc
mixin _$TrackingHistory {
  String get note => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_type')
  String get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TrackingHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackingHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackingHistoryCopyWith<TrackingHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingHistoryCopyWith<$Res> {
  factory $TrackingHistoryCopyWith(
          TrackingHistory value, $Res Function(TrackingHistory) then) =
      _$TrackingHistoryCopyWithImpl<$Res, TrackingHistory>;
  @useResult
  $Res call(
      {String note,
      String status,
      @JsonKey(name: 'service_type') String serviceType,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class _$TrackingHistoryCopyWithImpl<$Res, $Val extends TrackingHistory>
    implements $TrackingHistoryCopyWith<$Res> {
  _$TrackingHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackingHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? status = null,
    Object? serviceType = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackingHistoryImplCopyWith<$Res>
    implements $TrackingHistoryCopyWith<$Res> {
  factory _$$TrackingHistoryImplCopyWith(_$TrackingHistoryImpl value,
          $Res Function(_$TrackingHistoryImpl) then) =
      __$$TrackingHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String note,
      String status,
      @JsonKey(name: 'service_type') String serviceType,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class __$$TrackingHistoryImplCopyWithImpl<$Res>
    extends _$TrackingHistoryCopyWithImpl<$Res, _$TrackingHistoryImpl>
    implements _$$TrackingHistoryImplCopyWith<$Res> {
  __$$TrackingHistoryImplCopyWithImpl(
      _$TrackingHistoryImpl _value, $Res Function(_$TrackingHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackingHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? status = null,
    Object? serviceType = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TrackingHistoryImpl(
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
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
class _$TrackingHistoryImpl implements _TrackingHistory {
  const _$TrackingHistoryImpl(
      {required this.note,
      required this.status,
      @JsonKey(name: 'service_type') required this.serviceType,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$TrackingHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingHistoryImplFromJson(json);

  @override
  final String note;
  @override
  final String status;
  @override
  @JsonKey(name: 'service_type')
  final String serviceType;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'TrackingHistory(note: $note, status: $status, serviceType: $serviceType, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingHistoryImpl &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, note, status, serviceType, updatedAt);

  /// Create a copy of TrackingHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingHistoryImplCopyWith<_$TrackingHistoryImpl> get copyWith =>
      __$$TrackingHistoryImplCopyWithImpl<_$TrackingHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingHistoryImplToJson(
      this,
    );
  }
}

abstract class _TrackingHistory implements TrackingHistory {
  const factory _TrackingHistory(
          {required final String note,
          required final String status,
          @JsonKey(name: 'service_type') required final String serviceType,
          @JsonKey(name: 'updated_at') required final String updatedAt}) =
      _$TrackingHistoryImpl;

  factory _TrackingHistory.fromJson(Map<String, dynamic> json) =
      _$TrackingHistoryImpl.fromJson;

  @override
  String get note;
  @override
  String get status;
  @override
  @JsonKey(name: 'service_type')
  String get serviceType;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of TrackingHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackingHistoryImplCopyWith<_$TrackingHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
