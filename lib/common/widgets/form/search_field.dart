import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';

class SearchField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final int debounceTime;
  final Function(String)? onSubmitted;

  const SearchField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.debounceTime = 500,
    this.focusNode,
    this.onSubmitted,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (widget.debounceTime == 0) {
      if (widget.onChanged != null) widget.onChanged!(query);
      return;
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: widget.debounceTime), () {
      if (widget.onChanged != null) widget.onChanged!(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        color: TColors.neutralLightMedium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UiIcons(
            TIcons.search,
            size: 20,
            color: TColors.neutralDarkLight,
          ),
          const SizedBox(width: 12),
          Flexible(
            child: SizedBox(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  contentPadding: EdgeInsets.zero,
                  hintText: widget.hintText,
                  hintStyle: GoogleFonts.inter(
                      fontSize: TSizes.fontSizeBodyL,
                      color: TColors.neutralDarkLight),
                  labelStyle: GoogleFonts.inter(fontSize: TSizes.fontSizeBodyL),
                ),
                style: GoogleFonts.inter(fontSize: TSizes.fontSizeBodyL),
                onChanged: _onSearchChanged,
                onSubmitted: widget.onSubmitted,
                focusNode: widget.focusNode,
              ),
            ),
          ),
          if (widget.controller!.text.isNotEmpty)
            GestureDetector(
              onTap: () {
                widget.controller!.clear();
                widget.onChanged?.call('');
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: UiIcons(
                  TIcons.close,
                  size: 12,
                  color: TColors.neutralDarkLight,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
