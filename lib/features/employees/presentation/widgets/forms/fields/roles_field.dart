import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class RolesField extends StatefulWidget {
  const RolesField({super.key});

  @override
  State<RolesField> createState() => _RolesFieldState();
}

class _RolesFieldState extends State<RolesField> {
  List<_Roles> roles = [
    _Roles(id: 1, nameRole: "Kasir"),
    _Roles(id: 2, nameRole: "Pelayan/Waiter"),
    _Roles(id: 3, nameRole: "Koki/Barista"),
    _Roles(id: 4, nameRole: "Manajer"),
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<int>(
      name: "categoryId",
      builder: (field) {
        return Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          runSpacing: -4,
          children: [
            ...roles.map(
              (role) {
                bool selected = field.value == role.id;
                return InputChip(
                  label: !selected
                      ? TextBodyM(role.nameRole)
                      : TextHeading4(
                          role.nameRole,
                          color: TColors.primary,
                        ),
                  selected: selected,
                  onPressed: () {
                    field.didChange(role.id);
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 32,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  label: const TextActionM(
                    "Buat Baru",
                    color: TColors.primary,
                  ),
                  style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 14.0),
                    ),
                    side: WidgetStatePropertyAll(
                      BorderSide(
                        width: 1,
                        color: TColors.primary,
                      ),
                    ),
                  ),
                  icon: const UiIcons(
                    TIcons.add,
                    height: 12,
                    width: 12,
                    color: TColors.primary,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class _Roles {
  final int id;
  final String nameRole;

  _Roles({
    required this.id,
    required this.nameRole,
  });
}
