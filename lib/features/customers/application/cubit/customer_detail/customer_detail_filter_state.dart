import 'package:equatable/equatable.dart';

class CustomerDetailFilterState extends Equatable {
  final String? from;
  final String? to;
  final String template;

  const CustomerDetailFilterState({
    this.from,
    this.to,
    required this.template,
  });

  @override
  List<Object?> get props => [from, to, template];
}
