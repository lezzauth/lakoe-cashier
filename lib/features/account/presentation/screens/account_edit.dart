import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';

class AccountEditScreen extends StatefulWidget {
  const AccountEditScreen({super.key});

  @override
  State<AccountEditScreen> createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  late List<_ItemAccountEditModel> listItemAccountEdit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerCubit, OwnerState>(builder: (context, state) {
      if (state is OwnerLoadSuccess) {
        listItemAccountEdit = [
          _ItemAccountEditModel(
            icon: TIcons.userOutline,
            field: "Nama Lengkap",
            value: state.owner.name,
            routeName: "/account/edit/name",
          ),
          _ItemAccountEditModel(
            icon: TIcons.smartphoneOutline,
            field: "Nomor WA",
            value: state.owner.phoneNumber,
            routeName: "/account/edit/phone_number",
          ),
          _ItemAccountEditModel(
            icon: TIcons.letterOutline,
            field: "Email",
            value: state.owner.email ?? "-",
            routeName: "/account/edit/email",
          ),
          _ItemAccountEditModel(
            icon: TIcons.passwordOutline,
            field: "PIN",
            value: "••••••",
            routeName: "/account/edit/pin",
          ),
        ];
      }
      return Scaffold(
        appBar: CustomAppbar(title: "Ubah Data Akun"),
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
    });
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
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
                (field == "Nomor WA")
                    ? PhoneNumberFormatter.formatForDisplay(value)
                    : value,
                color: TColors.neutralDarkDark,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 8),
              UiIcons(
                TIcons.arrowRight,
                size: 16,
                color: TColors.primary,
              ),
            ],
          ),
          onTap: () async {
            if (routeName == "/account/edit/name") {
              bool? result =
                  await Navigator.pushNamed(context, routeName, arguments: {
                field: value,
              }) as bool?;

              if (!result!) return;
            } else {
              Navigator.pushNamed(context, "/account/edit/verify_pin",
                  arguments: {
                    field: value,
                    'routeName': routeName,
                  });
            }
          },
        ),
        Divider(
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

  _ItemAccountEditModel copyWith({
    String? icon,
    String? field,
    String? value,
    String? routeName,
  }) {
    return _ItemAccountEditModel(
      icon: icon ?? this.icon,
      field: field ?? this.field,
      value: value ?? this.value,
      routeName: routeName ?? this.routeName,
    );
  }
}
