import 'package:equatable/equatable.dart';
import 'package:package_repository/package_repository.dart';

sealed class PackageMasterState extends Equatable {}

final class PackageMasterInitial extends PackageMasterState {
  @override
  List<Object?> get props => [];
}

final class PackageMasterLoadInProgress extends PackageMasterState {
  @override
  List<Object?> get props => [];
}

final class PackageMasterLoadSuccess extends PackageMasterState {
  final List<PackageModel> packages;

  PackageMasterLoadSuccess({required this.packages});

  @override
  List<Object?> get props => [];
}

final class PackageMasterLoadFailure extends PackageMasterState {
  final String error;

  PackageMasterLoadFailure(this.error);

  @override
  List<Object?> get props => [];
}
