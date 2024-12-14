import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_state.dart';

class BillMasterCubit extends Cubit<BillMasterState> {
  final AppDataProvider _appDataProvider = AppDataProvider();
  static const String defaultFootNote =
      'Terimakasih\nDitunggu kembali kedatangannya';

  BillMasterCubit()
      : super(BillMasterState(
          footNote: defaultFootNote,
        ));

  Future<void> init() async {
    final footNote = await _appDataProvider.footNote;

    emit(BillMasterState(
        footNote: footNote.isEmpty ? defaultFootNote : footNote));
  }

  void setFootNote(String footNote) {
    emit(BillMasterState(footNote: footNote));
  }

  Future<void> onSave() async {
    await _appDataProvider.setFootNote(state.footNote);
  }
}
