sealed class CompletingDataState {}

class CompletingDataInitial extends CompletingDataState {}

class CompletingDataSubmitted extends CompletingDataState {
  final String name;
  final String phoneNumber;
  final String email;
  final String outletAddress;
  final String outletName;
  final String outletType;

  CompletingDataSubmitted({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.outletAddress,
    required this.outletName,
    required this.outletType,
  });
}
