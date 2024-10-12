import 'package:equatable/equatable.dart';
import 'package:online_shop_repository/online_shop_repository.dart';

sealed class ShopOrderTrackState extends Equatable {}

final class ShopOrderTrackInitial extends ShopOrderTrackState {
  @override
  List<Object?> get props => [];
}

final class ShopOrderTrackLoadInProgress extends ShopOrderTrackState {
  @override
  List<Object?> get props => [];
}

final class ShopOrderTrackLoadSuccess extends ShopOrderTrackState {
  final Tracking track;

  ShopOrderTrackLoadSuccess({required this.track});

  @override
  List<Object?> get props => [track];
}

final class ShopOrderTrackLoadFailure extends ShopOrderTrackState {
  final String error;

  ShopOrderTrackLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}
