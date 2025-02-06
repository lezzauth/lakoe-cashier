import 'package:equatable/equatable.dart';

class BillMasterState extends Equatable {
  final String footNote;
  final String receiptLanguage;
  final bool autoPrintReceipt;
  final bool printOrderTicket;

  const BillMasterState({
    required this.footNote,
    required this.receiptLanguage,
    required this.autoPrintReceipt,
    required this.printOrderTicket,
  });

  @override
  List<Object?> get props => [
        footNote,
        receiptLanguage,
        autoPrintReceipt,
        printOrderTicket,
      ];

  BillMasterState copyWith({
    String? footNote,
    String? receiptLanguage,
    bool? autoPrintReceipt,
    bool? autoPrintTicketOrder,
    bool? printOrderTicket,
  }) {
    return BillMasterState(
      footNote: footNote ?? this.footNote,
      receiptLanguage: receiptLanguage ?? this.receiptLanguage,
      autoPrintReceipt: autoPrintReceipt ?? this.autoPrintReceipt,
      printOrderTicket: printOrderTicket ?? this.printOrderTicket,
    );
  }
}
