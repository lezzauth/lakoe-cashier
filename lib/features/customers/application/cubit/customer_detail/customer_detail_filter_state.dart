import 'package:equatable/equatable.dart';
import 'package:outlet_repository/outlet_repository.dart';

class CustomerDetailFilterState extends Equatable {
  final String? status;
  final String template;
  final String? from;
  final String? to;

  const CustomerDetailFilterState({
    this.status,
    required this.template,
    this.from,
    this.to,
  });

  DetailCustomerOutletDto get toDetailCustomerOutletDto =>
      DetailCustomerOutletDto(
        status: status == 'ALL' ? null : status,
        template: ["ALL", "CUSTOM"].contains(template) ? null : template,
        from: from,
        to: to,
      );

  CustomerDetailFilterState copyWith({
    String? status,
    String? template,
    String? from,
    String? to,
  }) {
    return CustomerDetailFilterState(
      status: status ?? this.status,
      template: template ?? this.template,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  List<Object?> get props => [status, template, from, to];
}
