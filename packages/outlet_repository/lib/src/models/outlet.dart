import 'package:freezed_annotation/freezed_annotation.dart';

part 'outlet.g.dart';
part 'outlet.freezed.dart';

@freezed
class OutletModel with _$OutletModel {
  const factory OutletModel({
    required String id,
    required String name,
  }) = _OutletModel;

  factory OutletModel.fromJson(Map<String, Object?> json) =>
      _$OutletModelFromJson(json);
}
