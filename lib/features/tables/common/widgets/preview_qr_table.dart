import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_1.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/helpers/preview_qr_table_helper.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PreviewQrTable extends StatelessWidget {
  final Color color;
  final String data;
  final String tableNumber;

  const PreviewQrTable(this.data,
      {super.key, this.color = TColors.primary, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.string(
          PreviewQrTableHelper.getPreviewQrTable(
            color,
          ),
          height: 485.39,
        ),
        Positioned(
          top: 20,
          right: 16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const TextHeading4(
                  "No.Meja",
                  color: TColors.neutralLightLightest,
                ),
              ),
              TextHeading1(
                tableNumber,
                color: TColors.neutralLightLightest,
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 16,
          child: Image.asset(
            TImages.lakoeLetterLogo,
            height: 60,
            width: 60,
          ),
        ),
        Positioned(
          top: 150,
          left: 82,
          right: 82,
          child: QrImageView(
            data: data,
            size: 180,
            // embeddedImage: AssetImage(TImages.lakoeLetterLogo),
            // embeddedImageStyle: QrEmbeddedImageStyle(
            //   size: Size(31.68, 31.68),
            // ),
          ),
        ),
      ],
    );
  }
}
