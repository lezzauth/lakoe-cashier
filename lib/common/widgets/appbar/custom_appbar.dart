import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_3.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.isShowBackButton = false,
    this.title,
    this.leading,
    this.search,
    this.actions,
  });

  final bool isShowBackButton;
  final Widget? leading;
  final String? title;
  final SearchField? search;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    Widget? renderLeading() {
      if (isShowBackButton) {
        return IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: UiIcons(
            TIcons.arrowLeft,
            height: 20,
            width: 20,
            // onTap: () {
            //   Navigator.pop(context);
            // },
            color: TColors.primary,
          ),
        );
      }

      return leading;
    }

    Widget? renderTitle() {
      if (search != null) {
        return search!;
      }

      return TextHeading3(
        title ?? "",
      );
    }

    // List<Widget>? renderActions() {
    //   if (actions != null) {
    //     return actions!;
    //   }

    //   return [
    //     const SizedBox(
    //       height: 20,
    //       width: 20,
    //     )
    //   ];
    // }

    return AppBar(
      leading: renderLeading(),
      title: renderTitle(),
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: actions,
      forceMaterialTransparency: true,
    );

    // return SafeArea(
    //   child: Container(
    //     height: double.maxFinite,
    //     width: double.maxFinite,
    //     padding: const EdgeInsets.symmetric(horizontal: 16),
    //     child: Row(
    //       mainAxisSize: MainAxisSize.max,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Container(
    //           child: renderLeading(),
    //         ),
    //         Expanded(
    //           child: Center(
    //             child: renderTitle(),
    //           ),
    //         ),
    //         Container(
    //           margin: const EdgeInsets.only(left: 20),
    //           child: Row(
    //             children: renderActions() ?? [],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
