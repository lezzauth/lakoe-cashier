import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/form/search_field.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class MasterProductAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const MasterProductAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      isShowBackButton: true,
      search: SearchField(
        hintText: "Cari produk disini...",
      ),
      actions: [
        const SizedBox(width: 5),
        IconButton(
          onPressed: () {},
          icon: const UiIcons(
            TIcons.box,
            height: 20,
            width: 20,
            color: TColors.primary,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
