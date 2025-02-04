import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_state.dart';

class BillMasterCubit extends Cubit<BillMasterState> {
  final AppDataProvider _appDataProvider = AppDataProvider();
  static const String defaultFootNote =
      'Terimakasih\nDitunggu kembali kedatangannya';

  BillMasterCubit()
      : super(BillMasterState(footNote: defaultFootNote, langCode: 'en'));

  Future<void> init() async {
    final footNote = await _appDataProvider.footNote;
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('bill_language') ?? 'en';

    emit(state.copyWith(
        footNote: footNote.isEmpty ? defaultFootNote : footNote,
        langCode: langCode));
  }

  void setFootNote(String footNote) {
    emit(state.copyWith(footNote: footNote));
  }

  Future<void> onSave() async {
    await _appDataProvider.setFootNote(state.footNote);
  }

  Future<void> setLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bill_language', langCode);
    emit(state.copyWith(langCode: langCode));
  }
}
