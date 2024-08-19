import 'package:point_of_sales_cashier/features/authentication/application/bloc/completing_data/completing_data_page_state.dart';

class CompletingDataRouteArguments {
  final String? title;
  final String? description;
  final Function(String)? onPinValid;
  final CompletingDataPage page;

  CompletingDataRouteArguments(
      {this.title, this.description, this.onPinValid, required this.page});
}
