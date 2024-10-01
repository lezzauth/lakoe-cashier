import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_screen_state.dart';

class CompletingDataScreenCubit extends Cubit<CompletingDataScreenState> {
  CompletingDataScreenCubit() : super(CompletingDataScreenState(page: 0));

  setPage(int page) {
    emit(CompletingDataScreenState(page: page));
  }

  goToFormPage() {
    emit(CompletingDataScreenState(page: 0));
  }

  goToPinInputPage() {
    emit(CompletingDataScreenState(page: 1));
  }
}
