import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class BaseProductItem extends StatelessWidget {
  final String notes;
  final String name;
  final Image image;
  final int price;
  final Widget? noteAction;
  final Widget? counter;

  const BaseProductItem({
    super.key,
    this.notes = "",
    this.name = "",
    required this.image,
    this.price = 0,
    this.noteAction,
    this.counter,
  });

  @override
  Widget build(BuildContext context) {
    bool isNotesEmpty = notes.isEmpty;

    onAddNotes() {
      return showModalBottomSheet(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: TDeviceUtils.getViewInsets(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextHeading2("Tambah catatan"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Tuliskan catatan",
                          ),
                          maxLines: 4,
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const TextActionL(
                            "Lanjutkan",
                            color: TColors.neutralLightLightest,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeading4(name),
                        TextBodyM(
                          TFormatter.formatToRupiah(price),
                          color: TColors.neutralDarkLight,
                        ),
                      ],
                    ),
                  ),
                  if (counter != null) counter!,
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
              // if (isShowNoteAction && isNotesEmpty)
              //   Row(
              //     children: [
              //       GestureDetector(
              //         onTap: onAddNotes,
              //         child: const TextHeading5(
              //           "Tambah Catatan",
              //           color: TColors.primary,
              //         ),
              //       ),
              //     ],
              //   ),
            ],
          ),
        ),
      ],
    );
  }
}
