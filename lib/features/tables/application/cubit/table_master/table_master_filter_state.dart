import 'package:equatable/equatable.dart';

class TableMasterFilterState extends Equatable {
  final String? outletRoomId;

  const TableMasterFilterState({this.outletRoomId});

  @override
  List<Object?> get props => [outletRoomId];
}
