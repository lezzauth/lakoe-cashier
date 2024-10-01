import 'package:equatable/equatable.dart';

class CompletingDataScreenState extends Equatable {
  final int page;

  const CompletingDataScreenState({required this.page});

  @override
  List<Object?> get props => [page];
}
