import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class BaseProductItem extends StatelessWidget {
  final String notes;
  final String name;
  final Widget image;
  final int price;
  final Widget? noteAction;
  final Widget? counter;
  final Widget? tag;

  const BaseProductItem({
    super.key,
    this.notes = "",
    this.name = "",
    required this.image,
    this.price = 0,
    this.noteAction,
    this.counter,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: image,
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeading4(
                          name,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2.0),
                        TextBodyM(
                          TFormatter.formatToRupiah(price),
                          color: TColors.neutralDarkLight,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  if (counter != null) counter!,
                  if (tag != null) tag!,
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: TColors.error,
                    ),
                  ),
                ],
              ),
              if (noteAction != null) noteAction!,
            ],
          ),
        ),
      ],
    );
  }
}
