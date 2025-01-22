import 'package:equatable/equatable.dart';
import 'package:owner_repository/owner_repository.dart';

class FilterPurchaseState extends Equatable {
  final String? status;

  const FilterPurchaseState({this.status});

  FindAllPurchaseDto get toFindAllPurchaseDto => FindAllPurchaseDto(
        status: status == 'ALL' ? null : status,
      );

  FilterPurchaseState copyWith({String? status}) {
    return FilterPurchaseState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
