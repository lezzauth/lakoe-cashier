import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/data/models.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';

const List<LabelValue> configs = [
  LabelValue(
      label: "Deskripsi", value: "/online_shop/ai_configuration/description"),
  LabelValue(
      label: "Gaya bahasa",
      value: "/online_shop/ai_configuration/language_style"),
  LabelValue(label: "SOP", value: "/online_shop/ai_configuration/sop"),
  LabelValue(
      label: "Kata Istilah", value: "/online_shop/ai_configuration/glossary"),
  LabelValue(
    label: "FAQ",
    value: "/online_shop/ai_configuration/faq",
  ),
];

class OnlineShopAIConfigScreen extends StatefulWidget {
  const OnlineShopAIConfigScreen({super.key});

  @override
  State<OnlineShopAIConfigScreen> createState() =>
      _OnlineShopAIConfigScreenState();
}

class _OnlineShopAIConfigScreenState extends State<OnlineShopAIConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Konfigurasi AI",
      ),
      body: ListView(
        children: configs
            .map(
              (config) => Column(
                children: [
                  ListTile(
                    title: TextBodyM(config.label),
                    onTap: () {
                      Navigator.pushNamed(context, config.value);
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    trailing: UiIcons(
                      TIcons.arrowRight,
                      color: TColors.primary,
                      size: 12,
                    ),
                  ),
                  Divider(
                    color: TColors.neutralLightMedium,
                    indent: 20.0,
                    height: 1,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
