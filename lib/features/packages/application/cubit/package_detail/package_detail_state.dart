import 'package:equatable/equatable.dart';
import 'package:package_repository/package_repository.dart';

sealed class PackageDetailState extends Equatable {}

final class PackageDetailInitial extends PackageDetailState {
  @override
  List<Object?> get props => [];
}

final class PackageDetailLoadInProgress extends PackageDetailState {
  @override
  List<Object?> get props => [];
}

final class PackageDetailLoadSuccess extends PackageDetailState {
  final List<PackagePriceModel> detail;

  PackageDetailLoadSuccess({required this.detail});

  @override
  List<Object?> get props => [];
}

final class PackageDetailLoadFailure extends PackageDetailState {
  final String error;

  PackageDetailLoadFailure(this.error);

  @override
  List<Object?> get props => [];
}
