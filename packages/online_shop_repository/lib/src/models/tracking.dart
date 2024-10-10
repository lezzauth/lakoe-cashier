import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking.freezed.dart';
part 'tracking.g.dart';

@freezed
class Tracking with _$Tracking {
  const factory Tracking({
    required bool success,
    required String message,
    required String object,
    required String id,
    @JsonKey(name: 'waybill_id') required String waybillId,
    required TrackingCourier courier,
    required TrackingDestination destination,
    required List<TrackingHistory> history,
    String? link,
    @JsonKey(name: 'order_id') required String orderId,
    required TrackingOrigin origin,
    required String status,
  }) = _Tracking;

  factory Tracking.fromJson(Map<String, dynamic> json) =>
      _$TrackingFromJson(json);
}

@freezed
class TrackingCourier with _$TrackingCourier {
  const factory TrackingCourier({
    required String company,
    String? name,
    String? phone,
    @JsonKey(name: 'driver_name') String? driverName,
    @JsonKey(name: 'driver_phone') String? driverPhone,
  }) = _TrackingCourier;

  factory TrackingCourier.fromJson(Map<String, dynamic> json) =>
      _$TrackingCourierFromJson(json);
}

@freezed
class TrackingDestination with _$TrackingDestination {
  const factory TrackingDestination({
    @JsonKey(name: 'contact_name') required String contactName,
    required String address,
  }) = _TrackingDestination;

  factory TrackingDestination.fromJson(Map<String, dynamic> json) =>
      _$TrackingDestinationFromJson(json);
}

@freezed
class TrackingOrigin with _$TrackingOrigin {
  const factory TrackingOrigin({
    @JsonKey(name: 'contact_name') required String contactName,
    required String address,
  }) = _TrackingOrigin;

  factory TrackingOrigin.fromJson(Map<String, dynamic> json) =>
      _$TrackingOriginFromJson(json);
}

@freezed
class TrackingHistory with _$TrackingHistory {
  const factory TrackingHistory({
    required String note,
    required String status,
    @JsonKey(name: 'service_type') required String serviceType,
    @JsonKey(name: 'updated_at') required String updatedAt,
    // Define the fields if any, otherwise keep it empty
  }) = _TrackingHistory;

  factory TrackingHistory.fromJson(Map<String, dynamic> json) =>
      _$TrackingHistoryFromJson(json);
}
