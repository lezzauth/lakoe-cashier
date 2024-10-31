import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title = "",
    this.leading,
    this.search,
    this.actions,
    this.bottom,
    this.toolbarHeight,
    this.backgroundColor,
    this.handleBackButton,
    this.flexibleSpace,
    this.isScrolled = false,
  });

  final Widget? leading;
  final String title;
  final SearchField? search;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final Color? backgroundColor;
  final Function()? handleBackButton;
  final Widget? flexibleSpace;
  final bool? isScrolled;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border(
                bottom: BorderSide(
                  color: isScrolled == false
                      ? Colors.transparent
                      : TColors.neutralLightMedium,
                  // color: TColors.neutralLightMedium,
                  width: 1.0,
                ),
              ),
            ),
            padding: EdgeInsets.only(
              right: (actions == null && search != null) ? 20.0 : 8.0,
              left: leading == null ? 4.0 : 16.0,
            ),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                if (title.isNotEmpty && search == null)
                  Positioned.fill(
                    child: Center(
                      child: TextHeading3(title,
                          color: TColors.neutralDarkDarkest),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    leading ??
                        Transform.translate(
                          offset: const Offset(0, 0),
                          child: IconButton(
                            onPressed: handleBackButton ??
                                () {
                                  Navigator.pop(context);
                                },
                            icon: const UiIcons(
                              TIcons.arrowLeft,
                              size: 16,
                              color: TColors.primary,
                            ),
                          ),
                        ),
                    if (search != null)
                      Expanded(
                        child: search!,
                      ),
                    if (actions != null)
                      Transform.translate(
                        offset: const Offset(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: actions!,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (bottom != null) bottom!,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => _PreferredAppBarSize(
        toolbarHeight,
        bottom?.preferredSize.height,
      );
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
