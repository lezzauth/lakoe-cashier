import 'package:equatable/equatable.dart';

class ReportMasterFilterState extends Equatable {
  final String? from;
  final String? to;
  final String? template;
  final String? preset;
  final int? duration;

  const ReportMasterFilterState({
    this.from,
    this.to,
    this.template,
    this.preset,
    this.duration,
  });

  @override
  List<Object?> get props => [from, to, template, preset, duration];
}