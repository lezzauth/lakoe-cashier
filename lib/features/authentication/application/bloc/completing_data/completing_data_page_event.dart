import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_state.dart';

sealed class CompletingDataPageEvent {}

final class CompletingDataChangePageEvent extends CompletingDataPageEvent {
  late CompletingDataPage page;

  CompletingDataChangePageEvent({required this.page});
}
