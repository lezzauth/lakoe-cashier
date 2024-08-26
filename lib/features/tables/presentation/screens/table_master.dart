import 'package:flutter/material.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';

class TableMasterScreen extends StatefulWidget {
  const TableMasterScreen({super.key});

  @override
  State<TableMasterScreen> createState() => _TableMasterScreenState();
}

class _TableMasterScreenState extends State<TableMasterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Meja & QR Order",
        actions: [
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            icon: const UiIcons(
              TIcons.download,
              height: 20,
              width: 20,
              color: TColors.primary,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              children: [
                ChoiceChip(
                  label: TextHeading5(
                    "Semua",
                    color: TColors.primary,
                  ),
                  selected: true,
                  onSelected: (value) {},
                ),
                ChoiceChip(
                  label: TextBodyS("Indoor"),
                  selected: false,
                  onSelected: (value) {},
                ),
                ChoiceChip(
                  label: TextBodyS("Outdoor"),
                  selected: false,
                  onSelected: (value) {},
                ),
                ChoiceChip(
                  label: TextBodyS("Lantai 2"),
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          backgroundColor: TColors.neutralLightLightest,
          onRefresh: () async {
            return await Future.delayed(Duration(seconds: 1));
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: TColors.neutralLightMedium,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {},
                  splashColor: TColors.highlightLightest,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: TColors.highlightLightest,
                    ),
                    child: const Center(
                      child: UiIcons(
                        TIcons.tableRestaurant,
                        color: TColors.primary,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  title: TextHeading4(
                    "T-${index + 1}",
                    color: TColors.neutralDarkDarkest,
                  ),
                  subtitle: const TextBodyS(
                    "4 Orang • Indoor",
                    color: TColors.neutralDarkLight,
                  ),
                  trailing: const UiIcons(
                    TIcons.arrowRight,
                    color: TColors.neutralDarkLightest,
                    height: 12,
                    width: 12,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
