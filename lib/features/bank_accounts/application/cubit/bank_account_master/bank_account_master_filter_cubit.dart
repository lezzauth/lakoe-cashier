import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/bank_accounts/application/cubit/bank_account_master/bank_account_master_filter_state.dart';

class BankAccountMasterFilterCubit extends Cubit<BankAccountMasterFilterState> {
  BankAccountMasterFilterCubit() : super(BankAccountMasterFilterState());

  void setFilter({String? search}) {
    //
  }
}
