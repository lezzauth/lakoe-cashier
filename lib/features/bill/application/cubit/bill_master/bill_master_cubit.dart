import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lakoe_pos/features/bill/application/cubit/bill_master/bill_master_state.dart';

class BillMasterCubit extends Cubit<BillMasterState> {
  static String defaultFootNote = 'Terimakasih\nDitunggu kembali kedatangannya';

  BillMasterCubit()
      : super(BillMasterState(
          footNote: defaultFootNote,
          receiptLanguage: 'en',
          autoPrintReceipt: false,
          printOrderTicket: false,
        )) {
    init();
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final footNote = prefs.getString('foot_note') ?? defaultFootNote;
    final receiptLanguage = prefs.getString('receipt_language') ?? 'en';
    final autoPrintReceipt = prefs.getBool('auto_print_receipt') ?? false;
    final printOrderTicket = prefs.getBool('print_order_ticket') ?? false;

    emit(state.copyWith(
        footNote: footNote,
        receiptLanguage: receiptLanguage,
        autoPrintReceipt: autoPrintReceipt,
        printOrderTicket: printOrderTicket));
  }

  Future<void> setFootNote(String footNote) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('foot_note', footNote);
    emit(state.copyWith(footNote: footNote));
  }

  Future<void> setReceiptLanguage(String receiptLanguage) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('receipt_language', receiptLanguage);
    emit(state.copyWith(receiptLanguage: receiptLanguage));
  }

  Future<void> setAutoPrintReceipt(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('auto_print_receipt', value);
    emit(state.copyWith(autoPrintReceipt: value));
  }

  Future<void> setPrintTicketOrder(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('print_order_ticket', value);
    emit(state.copyWith(printOrderTicket: value));
  }
}
