import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sales_cashier/features/authentication/application/cubit/completing_data/completing_data_state.dart';

class CompletingDataCubit extends Cubit<CompletingDataState> {
  CompletingDataCubit() : super(CompletingDataInitial());

  void submitBusinessInformation({
    required String name,
    required String phoneNumber,
    required String email,
    required String outletAddress,
    required String outletName,
    required String outletType,
  }) {
    emit(CompletingDataSubmitted(
      name: name,
      phoneNumber: phoneNumber,
      email: email,
      outletAddress: outletAddress,
      outletName: outletName,
      outletType: outletType,
    ));
  }
}
