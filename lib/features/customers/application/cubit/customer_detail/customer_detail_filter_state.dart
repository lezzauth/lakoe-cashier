import 'package:equatable/equatable.dart';
import 'package:outlet_repository/outlet_repository.dart';

class CustomerDetailFilterState extends Equatable {
  final String? from;
  final String? to;
  final String? status;
  final String template;

  const CustomerDetailFilterState({
    this.from,
    this.to,
    this.status,
    required this.template,
  });

  DetailCustomerOutletDto get toDetailCustomerOutletDto =>
      DetailCustomerOutletDto(
        from: from,
        to: to,
        status: status == 'ALL' ? null : status,
        template: ["ALL", "CUSTOM"].contains(template) ? null : template,
      );

  CustomerDetailFilterState copyWith({
    String? from,
    String? to,
    String? status,
    String? template,
  }) {
    return CustomerDetailFilterState(
      from: from ?? this.from,
      to: to ?? this.to,
      status: status ?? this.status,
      template: template ?? this.template,
    );
  }

  @override
  List<Object?> get props => [from, to, status, template];
}
