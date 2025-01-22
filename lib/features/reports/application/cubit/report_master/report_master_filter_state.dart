import 'package:equatable/equatable.dart';
import 'package:outlet_repository/outlet_repository.dart';

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

  GetOutletReportDto get toGetOutletReportDto => GetOutletReportDto(
        from: from,
        to: to,
        template: ["ALL", "CUSTOM"].contains(template) ? null : template,
      );

  ReportMasterFilterState copyWith({
    String? from,
    String? to,
    String? template,
  }) {
    return ReportMasterFilterState(
      from: from ?? this.from,
      to: to ?? this.to,
      template: template ?? this.template,
    );
  }

  @override
  List<Object?> get props => [from, to, template, preset, duration];
}
