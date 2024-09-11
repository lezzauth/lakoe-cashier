import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class NumberPad extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLength;

  const NumberPad({super.key, this.controller, this.maxLength});

  @override
  State<NumberPad> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  @override
  void dispose() {
    if (widget.controller is TextEditingController) {
      widget.controller?.dispose();
    }
    super.dispose();
  }

  void handleChange(String value) {
    if (widget.controller == null) return;
    if (widget.controller!.text.length == widget.maxLength) return;

    widget.controller!.value =
        TextEditingValue(text: '${widget.controller!.text}$value');
  }

  void handleBackspace() {
    if (widget.controller == null) return;
    if (widget.controller!.text.isEmpty) return;

    String newValue = widget.controller!.text;
    newValue = newValue.substring(0, newValue.length - 1);

    widget.controller!.value = TextEditingValue(text: newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8.0,
          children: [
            Pad(
                onTap: () {
                  handleChange("1");
                },
                child: Text("1",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading1,
                      fontWeight: FontWeight.w900,
                      color: TColors.neutralDarkDarkest,
                    ))),
            Pad(
                onTap: () {
                  handleChange("2");
                },
                child: Text("2",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading1,
                      fontWeight: FontWeight.w900,
                      color: TColors.neutralDarkDarkest,
                    ))),
            Pad(
                onTap: () {
                  handleChange("3");
                },
                child: Text("3",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading1,
                      fontWeight: FontWeight.w900,
                      color: TColors.neutralDarkDarkest,
                    ))),
          ],
        ),
        Wrap(
          spacing: 8.0,
          children: [
            Pad(
                onTap: () {
                  handleChange("4");
                },
                child: Text("4",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading1,
                      fontWeight: FontWeight.w900,
                      color: TColors.neutralDarkDarkest,
                    ))),
            Pad(
                onTap: () {
                  handleChange("5");
                },
                child: Text("5",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading1,
                      fontWeight: FontWeight.w900,
                      color: TColors.neutralDarkDarkest,
                    ))),
            Pad(
                onTap: () {
                  handleChange("6");
                },
                child: Text("6",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading1,
                      fontWeight: FontWeight.w900,
                      color: TColors.neutralDarkDarkest,
                    ))),
          ],
        ),
        Wrap(
          spacing: 8.0,
          children: [
            Pad(
                onTap: () {
                  handleChange("7");
                },
                child: Text("7",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading1,
                      fontWeight: FontWeight.w900,
                      color: TColors.neutralDarkDarkest,
                    ))),
            Pad(
                onTap: () {
                  handleChange("8");
                },
                child: Text("8",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading1,
                      fontWeight: FontWeight.w900,
                      color: TColors.neutralDarkDarkest,
                    ))),
            Pad(
                onTap: () {
                  handleChange("9");
                },
                child: Text("9",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading1,
                      fontWeight: FontWeight.w900,
                      color: TColors.neutralDarkDarkest,
                    ))),
          ],
        ),
        Wrap(
          spacing: 8.0,
          children: [
            const SizedBox(
              height: 96,
              width: 96,
            ),
            Pad(
                onTap: () {
                  handleChange("0");
                },
                child: Text("0",
                    style: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeHeading1,
                      fontWeight: FontWeight.w900,
                      color: TColors.neutralDarkDarkest,
                    ))),
            Pad(
              onTap: () {
                handleBackspace();
              },
              child: const Icon(
                Icons.backspace,
                size: 24.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Pad extends StatelessWidget {
  final Widget child;
  final Function()? onTap;

  const Pad({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(72.0),
            color: TColors.neutralLightMedium,
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
