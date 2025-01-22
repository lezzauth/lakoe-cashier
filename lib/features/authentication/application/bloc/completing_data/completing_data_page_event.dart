import 'package:lakoe_pos/features/authentication/application/bloc/completing_data/completing_data_page_state.dart';

sealed class CompletingDataPageEvent {}

final class CompletingDataChangePageEvent extends CompletingDataPageEvent {
  late CompletingDataPage page;

  CompletingDataChangePageEvent({required this.page});
}
