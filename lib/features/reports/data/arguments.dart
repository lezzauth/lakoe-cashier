import 'package:outlet_repository/outlet_repository.dart';

class ReportProductSalesArguments {
  final OutletReportBestSalesProductModel product;
  final int rank;

  const ReportProductSalesArguments({
    required this.rank,
    required this.product,
  });
}
