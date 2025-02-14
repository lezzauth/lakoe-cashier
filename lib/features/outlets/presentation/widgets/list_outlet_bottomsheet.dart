import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/bottomsheets/vote_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/form/custom_radio.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:outlet_repository/outlet_repository.dart';

class ListOutletBottomsheet {
  static void show(BuildContext context, {required OutletModel outlet}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return CustomBottomsheet(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextHeading2("Daftar Outlet"),
                    ),
                    SizedBox(height: 12),
                    InkWell(
                      splashColor: TColors.neutralLightLight,
                      highlightColor: TColors.neutralLightMedium,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 20.0,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: TColors.neutralLightDark,
                              child: UiIcons(
                                TIcons.store,
                                size: 16,
                                color: TColors.neutralDarkDark,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextHeading4(
                                    "Outlet Utama",
                                    color: TColors.neutralDarkDark,
                                  ),
                                  const SizedBox(height: 2),
                                  TextBodyS(
                                    outlet.address!,
                                    color: TColors.neutralDarkLightest,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            CustomRadio(
                              value: "selectedOutlet",
                              groupValue: "selectedOutlet",
                              onChanged: (value) {},
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: TColors.neutralLightLight,
                      highlightColor: TColors.neutralLightMedium,
                      onTap: () {
                        Navigator.pop(context);
                        VoteBottomSheetHelper.show(
                          context: context,
                          title: "Butuh fitur multi-outlet?",
                          featureName: "MultiOutlet",
                          featureDesc:
                              "multi-outlet agar kamu bisa mengelola beberapa cabang lebih mudah",
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 20.0,
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: TColors.primary,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: TColors.neutralLightLightest,
                                child: UiIcons(
                                  TIcons.add,
                                  size: 16,
                                  color: TColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextHeading4(
                                "Tambah Outlet Cabang",
                                color: TColors.neutralDarkDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
