import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

class ProductNoteAction extends StatefulWidget {
  final String notes;
  final Function(String notes)? onChanged;
  final bool readOnly;

  const ProductNoteAction({
    super.key,
    this.notes = "",
    this.onChanged,
    this.readOnly = false,
  });

  @override
  State<ProductNoteAction> createState() => _ProductNoteActionState();
}

class _ProductNoteActionState extends State<ProductNoteAction> {
  final _formKey = GlobalKey<FormBuilderState>();

  _onSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      dynamic value = _formKey.currentState?.value;
      if (widget.onChanged == null) return;

      widget.onChanged!(value["notes"]);
      Navigator.pop(context);
    } else {
      const snackBar = SnackBar(
        content: Text('Validation failed'),
        showCloseIcon: true,
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          snackBar,
        );
    }
  }

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
                  child: FormBuilder(
                    key: _formKey,
                    initialValue: {
                      "notes": widget.notes,
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: FormBuilderTextField(
                            name: "notes",
                            decoration: const InputDecoration(
                              hintText: "Tuliskan catatan",
                            ),
                            maxLines: 4,
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: _onSubmit,
                            child: const TextActionL(
                              "Lanjutkan",
                              color: TColors.neutralLightLightest,
                            ),
                          ),
                        )
                      ],
                    ),
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.notes.isNotEmpty)
          Text(
            '“${widget.notes}“',
            style: GoogleFonts.inter(
              fontStyle: FontStyle.italic,
              fontSize: TSizes.fontSizeBodyS,
              color: TColors.neutralDarkMedium,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        if (!widget.readOnly)
          GestureDetector(
            onTap: onAddNotes,
            child: TextHeading5(
              widget.notes.isNotEmpty ? "Ubah" : "Tambah Catatan",
              color: TColors.primary,
            ),
          ),
      ],
    );
  }
}
