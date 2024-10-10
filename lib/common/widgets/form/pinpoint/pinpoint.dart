import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:point_of_sales_cashier/common/widgets/form/pinpoint/pinpoint_content.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/permissions/request_permission.dart';

class Pinpoint extends StatefulWidget {
  const Pinpoint({
    super.key,
    this.value,
    required this.onChanged,
    this.hasError = false,
    this.errorText = "",
  });

  final LatLng? value;
  final ValueChanged<LatLng> onChanged;
  final bool hasError;
  final String errorText;

  @override
  State<Pinpoint> createState() => _PinpointState();
}

class _PinpointState extends State<Pinpoint> {
  Future<void> _onTap() async {
    final isPassed = await LocationRequestPermission().request(context);

    if (isPassed == true) {
      await showModalBottomSheet(
        context: context,
        enableDrag: false,
        builder: (context) {
          return CustomBottomsheet(
            child: Expanded(
              child: PinpointContent(
                onChanged: widget.onChanged,
                value: widget.value,
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1,
                color: widget.hasError
                    ? TColors.error
                    : TColors.neutralLightDarkest,
              ),
            ),
            child: Container(
              height: 100,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 6,
                        sigmaY: 6,
                      ),
                      child: Image.asset(
                        TImages.pinpoint,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: TextHeading4(
                      "Atur Pinpoint",
                      color: TColors.info,
                    ),
                  )
                ],
              ),
            ),
          ),
          if (widget.hasError)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(left: 14),
              child: TextBodyS(
                widget.errorText,
                color: TColors.error,
              ),
            ),
        ],
      ),
    );
  }
}
