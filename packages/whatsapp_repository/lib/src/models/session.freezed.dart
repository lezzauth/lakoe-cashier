// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WASessionModel _$WASessionModelFromJson(Map<String, dynamic> json) {
  return _WASessionModel.fromJson(json);
}

/// @nodoc
mixin _$WASessionModel {
  String get name => throw _privateConstructorUsedError;
  WASessionMe? get me => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  WASessionConfig get config => throw _privateConstructorUsedError;

  /// Serializes this WASessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WASessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WASessionModelCopyWith<WASessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WASessionModelCopyWith<$Res> {
  factory $WASessionModelCopyWith(
          WASessionModel value, $Res Function(WASessionModel) then) =
      _$WASessionModelCopyWithImpl<$Res, WASessionModel>;
  @useResult
  $Res call(
      {String name, WASessionMe? me, String status, WASessionConfig config});

  $WASessionMeCopyWith<$Res>? get me;
  $WASessionConfigCopyWith<$Res> get config;
}

/// @nodoc
class _$WASessionModelCopyWithImpl<$Res, $Val extends WASessionModel>
    implements $WASessionModelCopyWith<$Res> {
  _$WASessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WASessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? me = freezed,
    Object? status = null,
    Object? config = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as WASessionMe?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as WASessionConfig,
    ) as $Val);
  }

  /// Create a copy of WASessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WASessionMeCopyWith<$Res>? get me {
    if (_value.me == null) {
      return null;
    }

    return $WASessionMeCopyWith<$Res>(_value.me!, (value) {
      return _then(_value.copyWith(me: value) as $Val);
    });
  }

  /// Create a copy of WASessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WASessionConfigCopyWith<$Res> get config {
    return $WASessionConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WASessionModelImplCopyWith<$Res>
    implements $WASessionModelCopyWith<$Res> {
  factory _$$WASessionModelImplCopyWith(_$WASessionModelImpl value,
          $Res Function(_$WASessionModelImpl) then) =
      __$$WASessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, WASessionMe? me, String status, WASessionConfig config});

  @override
  $WASessionMeCopyWith<$Res>? get me;
  @override
  $WASessionConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$WASessionModelImplCopyWithImpl<$Res>
    extends _$WASessionModelCopyWithImpl<$Res, _$WASessionModelImpl>
    implements _$$WASessionModelImplCopyWith<$Res> {
  __$$WASessionModelImplCopyWithImpl(
      _$WASessionModelImpl _value, $Res Function(_$WASessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WASessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? me = freezed,
    Object? status = null,
    Object? config = null,
  }) {
    return _then(_$WASessionModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as WASessionMe?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as WASessionConfig,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WASessionModelImpl implements _WASessionModel {
  const _$WASessionModelImpl(
      {required this.name,
      this.me,
      required this.status,
      required this.config});

  factory _$WASessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WASessionModelImplFromJson(json);

  @override
  final String name;
  @override
  final WASessionMe? me;
  @override
  final String status;
  @override
  final WASessionConfig config;

  @override
  String toString() {
    return 'WASessionModel(name: $name, me: $me, status: $status, config: $config)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WASessionModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.me, me) || other.me == me) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.config, config) || other.config == config));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, me, status, config);

  /// Create a copy of WASessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WASessionModelImplCopyWith<_$WASessionModelImpl> get copyWith =>
      __$$WASessionModelImplCopyWithImpl<_$WASessionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WASessionModelImplToJson(
      this,
    );
  }
}

abstract class _WASessionModel implements WASessionModel {
  const factory _WASessionModel(
      {required final String name,
      final WASessionMe? me,
      required final String status,
      required final WASessionConfig config}) = _$WASessionModelImpl;

  factory _WASessionModel.fromJson(Map<String, dynamic> json) =
      _$WASessionModelImpl.fromJson;

  @override
  String get name;
  @override
  WASessionMe? get me;
  @override
  String get status;
  @override
  WASessionConfig get config;

  /// Create a copy of WASessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WASessionModelImplCopyWith<_$WASessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WASessionMe _$WASessionMeFromJson(Map<String, dynamic> json) {
  return _WASessionMe.fromJson(json);
}

/// @nodoc
mixin _$WASessionMe {
  String get id => throw _privateConstructorUsedError;
  String get pushName => throw _privateConstructorUsedError;

  /// Serializes this WASessionMe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WASessionMe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WASessionMeCopyWith<WASessionMe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WASessionMeCopyWith<$Res> {
  factory $WASessionMeCopyWith(
          WASessionMe value, $Res Function(WASessionMe) then) =
      _$WASessionMeCopyWithImpl<$Res, WASessionMe>;
  @useResult
  $Res call({String id, String pushName});
}

/// @nodoc
class _$WASessionMeCopyWithImpl<$Res, $Val extends WASessionMe>
    implements $WASessionMeCopyWith<$Res> {
  _$WASessionMeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WASessionMe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pushName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pushName: null == pushName
          ? _value.pushName
          : pushName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WASessionMeImplCopyWith<$Res>
    implements $WASessionMeCopyWith<$Res> {
  factory _$$WASessionMeImplCopyWith(
          _$WASessionMeImpl value, $Res Function(_$WASessionMeImpl) then) =
      __$$WASessionMeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String pushName});
}

/// @nodoc
class __$$WASessionMeImplCopyWithImpl<$Res>
    extends _$WASessionMeCopyWithImpl<$Res, _$WASessionMeImpl>
    implements _$$WASessionMeImplCopyWith<$Res> {
  __$$WASessionMeImplCopyWithImpl(
      _$WASessionMeImpl _value, $Res Function(_$WASessionMeImpl) _then)
      : super(_value, _then);

  /// Create a copy of WASessionMe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pushName = null,
  }) {
    return _then(_$WASessionMeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pushName: null == pushName
          ? _value.pushName
          : pushName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WASessionMeImpl implements _WASessionMe {
  const _$WASessionMeImpl({required this.id, required this.pushName});

  factory _$WASessionMeImpl.fromJson(Map<String, dynamic> json) =>
      _$$WASessionMeImplFromJson(json);

  @override
  final String id;
  @override
  final String pushName;

  @override
  String toString() {
    return 'WASessionMe(id: $id, pushName: $pushName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WASessionMeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pushName, pushName) ||
                other.pushName == pushName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pushName);

  /// Create a copy of WASessionMe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WASessionMeImplCopyWith<_$WASessionMeImpl> get copyWith =>
      __$$WASessionMeImplCopyWithImpl<_$WASessionMeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WASessionMeImplToJson(
      this,
    );
  }
}

abstract class _WASessionMe implements WASessionMe {
  const factory _WASessionMe(
      {required final String id,
      required final String pushName}) = _$WASessionMeImpl;

  factory _WASessionMe.fromJson(Map<String, dynamic> json) =
      _$WASessionMeImpl.fromJson;

  @override
  String get id;
  @override
  String get pushName;

  /// Create a copy of WASessionMe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WASessionMeImplCopyWith<_$WASessionMeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WASessionConfig _$WASessionConfigFromJson(Map<String, dynamic> json) {
  return _WASessionConfig.fromJson(json);
}

/// @nodoc
mixin _$WASessionConfig {
  WASessionConfigMetadata? get metadata => throw _privateConstructorUsedError;
  bool? get debug => throw _privateConstructorUsedError;
  WASessionConfigNoweb? get noweb => throw _privateConstructorUsedError;
  List<WASessionConfigWebhook> get webhooks =>
      throw _privateConstructorUsedError;

  /// Serializes this WASessionConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WASessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WASessionConfigCopyWith<WASessionConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WASessionConfigCopyWith<$Res> {
  factory $WASessionConfigCopyWith(
          WASessionConfig value, $Res Function(WASessionConfig) then) =
      _$WASessionConfigCopyWithImpl<$Res, WASessionConfig>;
  @useResult
  $Res call(
      {WASessionConfigMetadata? metadata,
      bool? debug,
      WASessionConfigNoweb? noweb,
      List<WASessionConfigWebhook> webhooks});

  $WASessionConfigMetadataCopyWith<$Res>? get metadata;
  $WASessionConfigNowebCopyWith<$Res>? get noweb;
}

/// @nodoc
class _$WASessionConfigCopyWithImpl<$Res, $Val extends WASessionConfig>
    implements $WASessionConfigCopyWith<$Res> {
  _$WASessionConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WASessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = freezed,
    Object? debug = freezed,
    Object? noweb = freezed,
    Object? webhooks = null,
  }) {
    return _then(_value.copyWith(
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as WASessionConfigMetadata?,
      debug: freezed == debug
          ? _value.debug
          : debug // ignore: cast_nullable_to_non_nullable
              as bool?,
      noweb: freezed == noweb
          ? _value.noweb
          : noweb // ignore: cast_nullable_to_non_nullable
              as WASessionConfigNoweb?,
      webhooks: null == webhooks
          ? _value.webhooks
          : webhooks // ignore: cast_nullable_to_non_nullable
              as List<WASessionConfigWebhook>,
    ) as $Val);
  }

  /// Create a copy of WASessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WASessionConfigMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $WASessionConfigMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }

  /// Create a copy of WASessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WASessionConfigNowebCopyWith<$Res>? get noweb {
    if (_value.noweb == null) {
      return null;
    }

    return $WASessionConfigNowebCopyWith<$Res>(_value.noweb!, (value) {
      return _then(_value.copyWith(noweb: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WASessionConfigImplCopyWith<$Res>
    implements $WASessionConfigCopyWith<$Res> {
  factory _$$WASessionConfigImplCopyWith(_$WASessionConfigImpl value,
          $Res Function(_$WASessionConfigImpl) then) =
      __$$WASessionConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WASessionConfigMetadata? metadata,
      bool? debug,
      WASessionConfigNoweb? noweb,
      List<WASessionConfigWebhook> webhooks});

  @override
  $WASessionConfigMetadataCopyWith<$Res>? get metadata;
  @override
  $WASessionConfigNowebCopyWith<$Res>? get noweb;
}

/// @nodoc
class __$$WASessionConfigImplCopyWithImpl<$Res>
    extends _$WASessionConfigCopyWithImpl<$Res, _$WASessionConfigImpl>
    implements _$$WASessionConfigImplCopyWith<$Res> {
  __$$WASessionConfigImplCopyWithImpl(
      _$WASessionConfigImpl _value, $Res Function(_$WASessionConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of WASessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = freezed,
    Object? debug = freezed,
    Object? noweb = freezed,
    Object? webhooks = null,
  }) {
    return _then(_$WASessionConfigImpl(
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as WASessionConfigMetadata?,
      debug: freezed == debug
          ? _value.debug
          : debug // ignore: cast_nullable_to_non_nullable
              as bool?,
      noweb: freezed == noweb
          ? _value.noweb
          : noweb // ignore: cast_nullable_to_non_nullable
              as WASessionConfigNoweb?,
      webhooks: null == webhooks
          ? _value._webhooks
          : webhooks // ignore: cast_nullable_to_non_nullable
              as List<WASessionConfigWebhook>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WASessionConfigImpl implements _WASessionConfig {
  const _$WASessionConfigImpl(
      {this.metadata,
      this.debug,
      this.noweb,
      required final List<WASessionConfigWebhook> webhooks})
      : _webhooks = webhooks;

  factory _$WASessionConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$WASessionConfigImplFromJson(json);

  @override
  final WASessionConfigMetadata? metadata;
  @override
  final bool? debug;
  @override
  final WASessionConfigNoweb? noweb;
  final List<WASessionConfigWebhook> _webhooks;
  @override
  List<WASessionConfigWebhook> get webhooks {
    if (_webhooks is EqualUnmodifiableListView) return _webhooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_webhooks);
  }

  @override
  String toString() {
    return 'WASessionConfig(metadata: $metadata, debug: $debug, noweb: $noweb, webhooks: $webhooks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WASessionConfigImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.debug, debug) || other.debug == debug) &&
            (identical(other.noweb, noweb) || other.noweb == noweb) &&
            const DeepCollectionEquality().equals(other._webhooks, _webhooks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, metadata, debug, noweb,
      const DeepCollectionEquality().hash(_webhooks));

  /// Create a copy of WASessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WASessionConfigImplCopyWith<_$WASessionConfigImpl> get copyWith =>
      __$$WASessionConfigImplCopyWithImpl<_$WASessionConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WASessionConfigImplToJson(
      this,
    );
  }
}

abstract class _WASessionConfig implements WASessionConfig {
  const factory _WASessionConfig(
          {final WASessionConfigMetadata? metadata,
          final bool? debug,
          final WASessionConfigNoweb? noweb,
          required final List<WASessionConfigWebhook> webhooks}) =
      _$WASessionConfigImpl;

  factory _WASessionConfig.fromJson(Map<String, dynamic> json) =
      _$WASessionConfigImpl.fromJson;

  @override
  WASessionConfigMetadata? get metadata;
  @override
  bool? get debug;
  @override
  WASessionConfigNoweb? get noweb;
  @override
  List<WASessionConfigWebhook> get webhooks;

  /// Create a copy of WASessionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WASessionConfigImplCopyWith<_$WASessionConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WASessionConfigMetadata _$WASessionConfigMetadataFromJson(
    Map<String, dynamic> json) {
  return _WASessionConfigMetadata.fromJson(json);
}

/// @nodoc
mixin _$WASessionConfigMetadata {
  @JsonKey(name: "user.id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "user.email")
  String? get userEmail => throw _privateConstructorUsedError;

  /// Serializes this WASessionConfigMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WASessionConfigMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WASessionConfigMetadataCopyWith<WASessionConfigMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WASessionConfigMetadataCopyWith<$Res> {
  factory $WASessionConfigMetadataCopyWith(WASessionConfigMetadata value,
          $Res Function(WASessionConfigMetadata) then) =
      _$WASessionConfigMetadataCopyWithImpl<$Res, WASessionConfigMetadata>;
  @useResult
  $Res call(
      {@JsonKey(name: "user.id") String? userId,
      @JsonKey(name: "user.email") String? userEmail});
}

/// @nodoc
class _$WASessionConfigMetadataCopyWithImpl<$Res,
        $Val extends WASessionConfigMetadata>
    implements $WASessionConfigMetadataCopyWith<$Res> {
  _$WASessionConfigMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WASessionConfigMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userEmail = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WASessionConfigMetadataImplCopyWith<$Res>
    implements $WASessionConfigMetadataCopyWith<$Res> {
  factory _$$WASessionConfigMetadataImplCopyWith(
          _$WASessionConfigMetadataImpl value,
          $Res Function(_$WASessionConfigMetadataImpl) then) =
      __$$WASessionConfigMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user.id") String? userId,
      @JsonKey(name: "user.email") String? userEmail});
}

/// @nodoc
class __$$WASessionConfigMetadataImplCopyWithImpl<$Res>
    extends _$WASessionConfigMetadataCopyWithImpl<$Res,
        _$WASessionConfigMetadataImpl>
    implements _$$WASessionConfigMetadataImplCopyWith<$Res> {
  __$$WASessionConfigMetadataImplCopyWithImpl(
      _$WASessionConfigMetadataImpl _value,
      $Res Function(_$WASessionConfigMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WASessionConfigMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userEmail = freezed,
  }) {
    return _then(_$WASessionConfigMetadataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WASessionConfigMetadataImpl implements _WASessionConfigMetadata {
  const _$WASessionConfigMetadataImpl(
      {@JsonKey(name: "user.id") this.userId,
      @JsonKey(name: "user.email") this.userEmail});

  factory _$WASessionConfigMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WASessionConfigMetadataImplFromJson(json);

  @override
  @JsonKey(name: "user.id")
  final String? userId;
  @override
  @JsonKey(name: "user.email")
  final String? userEmail;

  @override
  String toString() {
    return 'WASessionConfigMetadata(userId: $userId, userEmail: $userEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WASessionConfigMetadataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userEmail);

  /// Create a copy of WASessionConfigMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WASessionConfigMetadataImplCopyWith<_$WASessionConfigMetadataImpl>
      get copyWith => __$$WASessionConfigMetadataImplCopyWithImpl<
          _$WASessionConfigMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WASessionConfigMetadataImplToJson(
      this,
    );
  }
}

abstract class _WASessionConfigMetadata implements WASessionConfigMetadata {
  const factory _WASessionConfigMetadata(
          {@JsonKey(name: "user.id") final String? userId,
          @JsonKey(name: "user.email") final String? userEmail}) =
      _$WASessionConfigMetadataImpl;

  factory _WASessionConfigMetadata.fromJson(Map<String, dynamic> json) =
      _$WASessionConfigMetadataImpl.fromJson;

  @override
  @JsonKey(name: "user.id")
  String? get userId;
  @override
  @JsonKey(name: "user.email")
  String? get userEmail;

  /// Create a copy of WASessionConfigMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WASessionConfigMetadataImplCopyWith<_$WASessionConfigMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WASessionConfigNoweb _$WASessionConfigNowebFromJson(Map<String, dynamic> json) {
  return _WASessionConfigNoweb.fromJson(json);
}

/// @nodoc
mixin _$WASessionConfigNoweb {
  WASessionConfigNowebStore get store => throw _privateConstructorUsedError;

  /// Serializes this WASessionConfigNoweb to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WASessionConfigNoweb
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WASessionConfigNowebCopyWith<WASessionConfigNoweb> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WASessionConfigNowebCopyWith<$Res> {
  factory $WASessionConfigNowebCopyWith(WASessionConfigNoweb value,
          $Res Function(WASessionConfigNoweb) then) =
      _$WASessionConfigNowebCopyWithImpl<$Res, WASessionConfigNoweb>;
  @useResult
  $Res call({WASessionConfigNowebStore store});

  $WASessionConfigNowebStoreCopyWith<$Res> get store;
}

/// @nodoc
class _$WASessionConfigNowebCopyWithImpl<$Res,
        $Val extends WASessionConfigNoweb>
    implements $WASessionConfigNowebCopyWith<$Res> {
  _$WASessionConfigNowebCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WASessionConfigNoweb
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_value.copyWith(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as WASessionConfigNowebStore,
    ) as $Val);
  }

  /// Create a copy of WASessionConfigNoweb
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WASessionConfigNowebStoreCopyWith<$Res> get store {
    return $WASessionConfigNowebStoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WASessionConfigNowebImplCopyWith<$Res>
    implements $WASessionConfigNowebCopyWith<$Res> {
  factory _$$WASessionConfigNowebImplCopyWith(_$WASessionConfigNowebImpl value,
          $Res Function(_$WASessionConfigNowebImpl) then) =
      __$$WASessionConfigNowebImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WASessionConfigNowebStore store});

  @override
  $WASessionConfigNowebStoreCopyWith<$Res> get store;
}

/// @nodoc
class __$$WASessionConfigNowebImplCopyWithImpl<$Res>
    extends _$WASessionConfigNowebCopyWithImpl<$Res, _$WASessionConfigNowebImpl>
    implements _$$WASessionConfigNowebImplCopyWith<$Res> {
  __$$WASessionConfigNowebImplCopyWithImpl(_$WASessionConfigNowebImpl _value,
      $Res Function(_$WASessionConfigNowebImpl) _then)
      : super(_value, _then);

  /// Create a copy of WASessionConfigNoweb
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = null,
  }) {
    return _then(_$WASessionConfigNowebImpl(
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as WASessionConfigNowebStore,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WASessionConfigNowebImpl implements _WASessionConfigNoweb {
  const _$WASessionConfigNowebImpl({required this.store});

  factory _$WASessionConfigNowebImpl.fromJson(Map<String, dynamic> json) =>
      _$$WASessionConfigNowebImplFromJson(json);

  @override
  final WASessionConfigNowebStore store;

  @override
  String toString() {
    return 'WASessionConfigNoweb(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WASessionConfigNowebImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of WASessionConfigNoweb
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WASessionConfigNowebImplCopyWith<_$WASessionConfigNowebImpl>
      get copyWith =>
          __$$WASessionConfigNowebImplCopyWithImpl<_$WASessionConfigNowebImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WASessionConfigNowebImplToJson(
      this,
    );
  }
}

abstract class _WASessionConfigNoweb implements WASessionConfigNoweb {
  const factory _WASessionConfigNoweb(
          {required final WASessionConfigNowebStore store}) =
      _$WASessionConfigNowebImpl;

  factory _WASessionConfigNoweb.fromJson(Map<String, dynamic> json) =
      _$WASessionConfigNowebImpl.fromJson;

  @override
  WASessionConfigNowebStore get store;

  /// Create a copy of WASessionConfigNoweb
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WASessionConfigNowebImplCopyWith<_$WASessionConfigNowebImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WASessionConfigNowebStore _$WASessionConfigNowebStoreFromJson(
    Map<String, dynamic> json) {
  return _WASessionConfigNowebStore.fromJson(json);
}

/// @nodoc
mixin _$WASessionConfigNowebStore {
  bool get enabled => throw _privateConstructorUsedError;
  bool get fullSync => throw _privateConstructorUsedError;

  /// Serializes this WASessionConfigNowebStore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WASessionConfigNowebStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WASessionConfigNowebStoreCopyWith<WASessionConfigNowebStore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WASessionConfigNowebStoreCopyWith<$Res> {
  factory $WASessionConfigNowebStoreCopyWith(WASessionConfigNowebStore value,
          $Res Function(WASessionConfigNowebStore) then) =
      _$WASessionConfigNowebStoreCopyWithImpl<$Res, WASessionConfigNowebStore>;
  @useResult
  $Res call({bool enabled, bool fullSync});
}

/// @nodoc
class _$WASessionConfigNowebStoreCopyWithImpl<$Res,
        $Val extends WASessionConfigNowebStore>
    implements $WASessionConfigNowebStoreCopyWith<$Res> {
  _$WASessionConfigNowebStoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WASessionConfigNowebStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? fullSync = null,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      fullSync: null == fullSync
          ? _value.fullSync
          : fullSync // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WASessionConfigNowebStoreImplCopyWith<$Res>
    implements $WASessionConfigNowebStoreCopyWith<$Res> {
  factory _$$WASessionConfigNowebStoreImplCopyWith(
          _$WASessionConfigNowebStoreImpl value,
          $Res Function(_$WASessionConfigNowebStoreImpl) then) =
      __$$WASessionConfigNowebStoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled, bool fullSync});
}

/// @nodoc
class __$$WASessionConfigNowebStoreImplCopyWithImpl<$Res>
    extends _$WASessionConfigNowebStoreCopyWithImpl<$Res,
        _$WASessionConfigNowebStoreImpl>
    implements _$$WASessionConfigNowebStoreImplCopyWith<$Res> {
  __$$WASessionConfigNowebStoreImplCopyWithImpl(
      _$WASessionConfigNowebStoreImpl _value,
      $Res Function(_$WASessionConfigNowebStoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of WASessionConfigNowebStore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? fullSync = null,
  }) {
    return _then(_$WASessionConfigNowebStoreImpl(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      fullSync: null == fullSync
          ? _value.fullSync
          : fullSync // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WASessionConfigNowebStoreImpl implements _WASessionConfigNowebStore {
  const _$WASessionConfigNowebStoreImpl(
      {required this.enabled, required this.fullSync});

  factory _$WASessionConfigNowebStoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$WASessionConfigNowebStoreImplFromJson(json);

  @override
  final bool enabled;
  @override
  final bool fullSync;

  @override
  String toString() {
    return 'WASessionConfigNowebStore(enabled: $enabled, fullSync: $fullSync)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WASessionConfigNowebStoreImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.fullSync, fullSync) ||
                other.fullSync == fullSync));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, enabled, fullSync);

  /// Create a copy of WASessionConfigNowebStore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WASessionConfigNowebStoreImplCopyWith<_$WASessionConfigNowebStoreImpl>
      get copyWith => __$$WASessionConfigNowebStoreImplCopyWithImpl<
          _$WASessionConfigNowebStoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WASessionConfigNowebStoreImplToJson(
      this,
    );
  }
}

abstract class _WASessionConfigNowebStore implements WASessionConfigNowebStore {
  const factory _WASessionConfigNowebStore(
      {required final bool enabled,
      required final bool fullSync}) = _$WASessionConfigNowebStoreImpl;

  factory _WASessionConfigNowebStore.fromJson(Map<String, dynamic> json) =
      _$WASessionConfigNowebStoreImpl.fromJson;

  @override
  bool get enabled;
  @override
  bool get fullSync;

  /// Create a copy of WASessionConfigNowebStore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WASessionConfigNowebStoreImplCopyWith<_$WASessionConfigNowebStoreImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WASessionConfigWebhook _$WASessionConfigWebhookFromJson(
    Map<String, dynamic> json) {
  return _WASessionConfigWebhook.fromJson(json);
}

/// @nodoc
mixin _$WASessionConfigWebhook {
  String get url => throw _privateConstructorUsedError;
  List<String> get events => throw _privateConstructorUsedError;

  /// Serializes this WASessionConfigWebhook to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WASessionConfigWebhook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WASessionConfigWebhookCopyWith<WASessionConfigWebhook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WASessionConfigWebhookCopyWith<$Res> {
  factory $WASessionConfigWebhookCopyWith(WASessionConfigWebhook value,
          $Res Function(WASessionConfigWebhook) then) =
      _$WASessionConfigWebhookCopyWithImpl<$Res, WASessionConfigWebhook>;
  @useResult
  $Res call({String url, List<String> events});
}

/// @nodoc
class _$WASessionConfigWebhookCopyWithImpl<$Res,
        $Val extends WASessionConfigWebhook>
    implements $WASessionConfigWebhookCopyWith<$Res> {
  _$WASessionConfigWebhookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WASessionConfigWebhook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WASessionConfigWebhookImplCopyWith<$Res>
    implements $WASessionConfigWebhookCopyWith<$Res> {
  factory _$$WASessionConfigWebhookImplCopyWith(
          _$WASessionConfigWebhookImpl value,
          $Res Function(_$WASessionConfigWebhookImpl) then) =
      __$$WASessionConfigWebhookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, List<String> events});
}

/// @nodoc
class __$$WASessionConfigWebhookImplCopyWithImpl<$Res>
    extends _$WASessionConfigWebhookCopyWithImpl<$Res,
        _$WASessionConfigWebhookImpl>
    implements _$$WASessionConfigWebhookImplCopyWith<$Res> {
  __$$WASessionConfigWebhookImplCopyWithImpl(
      _$WASessionConfigWebhookImpl _value,
      $Res Function(_$WASessionConfigWebhookImpl) _then)
      : super(_value, _then);

  /// Create a copy of WASessionConfigWebhook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? events = null,
  }) {
    return _then(_$WASessionConfigWebhookImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WASessionConfigWebhookImpl implements _WASessionConfigWebhook {
  const _$WASessionConfigWebhookImpl(
      {required this.url, required final List<String> events})
      : _events = events;

  factory _$WASessionConfigWebhookImpl.fromJson(Map<String, dynamic> json) =>
      _$$WASessionConfigWebhookImplFromJson(json);

  @override
  final String url;
  final List<String> _events;
  @override
  List<String> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'WASessionConfigWebhook(url: $url, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WASessionConfigWebhookImpl &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, url, const DeepCollectionEquality().hash(_events));

  /// Create a copy of WASessionConfigWebhook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WASessionConfigWebhookImplCopyWith<_$WASessionConfigWebhookImpl>
      get copyWith => __$$WASessionConfigWebhookImplCopyWithImpl<
          _$WASessionConfigWebhookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WASessionConfigWebhookImplToJson(
      this,
    );
  }
}

abstract class _WASessionConfigWebhook implements WASessionConfigWebhook {
  const factory _WASessionConfigWebhook(
      {required final String url,
      required final List<String> events}) = _$WASessionConfigWebhookImpl;

  factory _WASessionConfigWebhook.fromJson(Map<String, dynamic> json) =
      _$WASessionConfigWebhookImpl.fromJson;

  @override
  String get url;
  @override
  List<String> get events;

  /// Create a copy of WASessionConfigWebhook
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WASessionConfigWebhookImplCopyWith<_$WASessionConfigWebhookImpl>
      get copyWith => throw _privateConstructorUsedError;
}
