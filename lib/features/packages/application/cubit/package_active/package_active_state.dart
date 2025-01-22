import 'package:owner_repository/owner_repository.dart';

sealed class PackageActiveState {}

final class PackageActiveInitial extends PackageActiveState {}

final class GetActivePackageInProgress extends PackageActiveState {}

final class GetActivePackageSuccess extends PackageActiveState {
  final PackageActive package;

  GetActivePackageSuccess(this.package);
}

final class GetActivePackageFailure extends PackageActiveState {
  final String error;

  GetActivePackageFailure(this.error);
}
