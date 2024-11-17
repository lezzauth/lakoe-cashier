import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

class AccountEditScreen extends StatefulWidget {
  const AccountEditScreen({super.key});

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  List<_ItemAccountEditModel> listItemAccountEdit = [
    _ItemAccountEditModel(
      icon: TIcons.userOutline,
      field: "Nama Lengkap",
      value: "Tauhid",
      routeName: "/account/edit/name",
    ),
    _ItemAccountEditModel(
      icon: TIcons.smartphoneOutline,
      field: "Nomor WA",
      value: "0812-3456-7890",
      routeName: "/account/edit/phone_number",
    ),
    _ItemAccountEditModel(
      icon: TIcons.letterOutline,
      field: "Email",
      value: "-",
      routeName: "/account/edit/email",
    ),
    _ItemAccountEditModel(
      icon: TIcons.passwordOutline,
      field: "PIN",
      value: "",
      routeName: "/account/edit/pin",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Ubah Data Akun",
      ),
      body: ListView(
        children: listItemAccountEdit
            .map(
              (item) => ItemAccountEdit(
                icon: item.icon,
                field: item.field,
                value: item.value,
                routeName: item.routeName,
              ),
            )
            .toList(),
      ),
    );
  }
}

class ItemAccountEdit extends StatelessWidget {
  final String icon;
  final String field;
  final String value;
  final String routeName;

  const ItemAccountEdit({
    super.key,
    required this.icon,
    required this.field,
    required this.value,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          minLeadingWidth: 16,
          leading: UiIcons(
            icon,
            size: 20,
            color: TColors.neutralDarkDark,
          ),
          title: TextBodyM(
            field,
            color: TColors.neutralDarkDark,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextHeading4(
                value,
                color: TColors.neutralDarkDark,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 8),
              const UiIcons(
                TIcons.arrowRight,
                size: 16,
                color: TColors.primary,
              ),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
        ),
        const Divider(
          color: TColors.neutralLightMedium,
          indent: 20.0,
          height: 1,
        ),
      ],
    );
  }
}

class _ItemAccountEditModel {
  final String icon;
  final String field;
  final String value;
  final String routeName;

  _ItemAccountEditModel({
    required this.icon,
    required this.field,
    required this.value,
    required this.routeName,
  });
}
