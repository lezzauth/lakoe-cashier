sealed class AppState {}

class AppStateInitial extends AppState {}

class AppStateCompleted extends AppState {
  final String? outletId;

  AppStateCompleted({this.outletId});

  AppStateCompleted copyWith({
    String? outletId,
  }) {
    return AppStateCompleted(outletId: outletId ?? this.outletId);
  }
}
