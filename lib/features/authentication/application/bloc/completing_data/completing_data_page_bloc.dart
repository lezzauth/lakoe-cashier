import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_event.dart';
import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_state.dart';

class CompletingDataPageBloc
    extends Bloc<CompletingDataPageEvent, CompletingDataPageState> {
  CompletingDataPage? page = CompletingDataPage.businessForm;

  CompletingDataPageBloc({this.page})
      : super(CompletingDataPageState(
            page: page ?? CompletingDataPage.businessForm)) {
    on<CompletingDataChangePageEvent>((event, emit) {
      emit(CompletingDataPageState(page: event.page));
    });
  }
}
