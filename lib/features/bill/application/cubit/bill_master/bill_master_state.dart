import 'package:equatable/equatable.dart';

class BillMasterState extends Equatable {
  final String footNote;
  final String langCode;

  const BillMasterState({required this.footNote, required this.langCode});

  @override
  List<Object?> get props => [footNote, langCode];

  BillMasterState copyWith({String? footNote, String? langCode}) {
    return BillMasterState(
      footNote: footNote ?? this.footNote,
      langCode: langCode ?? this.langCode,
    );
  }
}
