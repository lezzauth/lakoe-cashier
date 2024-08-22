import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

class ProductNoteAction extends StatelessWidget {
  ProductNoteAction({
    super.key,
    this.notes = "",
    this.onChanged,
    this.readOnly = false,
  });

  final String notes;
  final Function(String notes)? onChanged;
  final TextEditingController _controller = TextEditingController();
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
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
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Tuliskan catatan",
                          ),
                          controller: _controller,
                          maxLines: 4,
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: () {
                            if (onChanged != null) {
                              onChanged!(_controller.text);
                            }
                          },
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (notes.isNotEmpty)
          Text(
            '“$notes“',
            style: GoogleFonts.inter(
              fontStyle: FontStyle.italic,
              fontSize: TSizes.fontSizeBodyS,
              color: TColors.neutralDarkMedium,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        if (!readOnly)
          GestureDetector(
            onTap: onAddNotes,
            child: TextHeading5(
              notes.isNotEmpty ? "Ubah" : "Tambah Catatan",
              color: TColors.primary,
            ),
          ),
      ],
    );
  }
}
