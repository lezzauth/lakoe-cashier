import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/form/search_field.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class MasterProductAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const MasterProductAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      search: SearchField(
        hintText: "Cari produk disini...",
      ),
      actions: [
        const SizedBox(width: 5),
        IconButton(
          onPressed: () {},
          icon: const UiIcons(
            TIcons.box,
            size: 20,
            color: TColors.primary,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
