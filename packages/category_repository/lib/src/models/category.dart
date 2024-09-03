import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.g.dart';
part 'category.freezed.dart';

@freezed
class CategoryCount with _$CategoryCount {
  const factory CategoryCount({
    required int products,
  }) = _CategoryCount;

  factory CategoryCount.fromJson(Map<String, Object?> json) =>
      _$CategoryCountFromJson(json);
}

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    String? icon,
    required String outletId,
    @JsonKey(name: "_count") CategoryCount? count,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, Object?> json) =>
      _$CategoryModelFromJson(json);
}
