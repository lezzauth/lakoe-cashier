import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class LabelValue<T> with _$LabelValue {
  const factory LabelValue({
    required String label,
    required T value,
  }) = _LabelValue;
}
