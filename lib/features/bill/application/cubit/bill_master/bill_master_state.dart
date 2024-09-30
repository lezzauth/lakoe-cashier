import 'package:equatable/equatable.dart';

class BillMasterState extends Equatable {
  final String footNote;

  const BillMasterState({required this.footNote});

  @override
  List<Object?> get props => [footNote];
}
