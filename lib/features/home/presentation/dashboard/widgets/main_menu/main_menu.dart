import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:point_of_sales_cashier/common/widgets/icon/ui_icons.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:point_of_sales_cashier/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:point_of_sales_cashier/features/home/data/arguments/open_cashier_pin_argument.dart';
import 'package:point_of_sales_cashier/features/home/presentation/dashboard/widgets/forms/initial_balance_form.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/icon_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/sizes.dart';
import 'package:point_of_sales_cashier/utils/device/device_uility.dart';

class MainMenu extends StatelessWidget {
  final Function()? onTap;

  const MainMenu({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    onCashierOpened() {
      return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return CustomBottomsheet(
            child: Padding(
              padding: TDeviceUtils.getViewInsets(context),
              child: const InitialBalanceForm(),
            ),
          );
        },
      );
    }

    onCashierAlreadyOpened() {
      Navigator.popAndPushNamed(
        context,
        "/cashier/open-cashier-pin",
        arguments: OpenCashierReInitial(),
      );
    }

    return BlocBuilder<CashierCubit, CashierState>(
      builder: (context, state) => GestureDetector(
        onTap:
            state is! CashierOpened ? onCashierOpened : onCashierAlreadyOpened,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            decoration: BoxDecoration(
              gradient: state is CashierOpened
                  ? TColors.greenGradient
                  : TColors.redGradient,
              borderRadius: BorderRadius.circular(
                16.0,
              ),
            ),
            // height: 90.0,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    TImages.mainMenuWaves,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 12,
                            ),
                            child: UiIcons(
                              state is CashierOpened
                                  ? TIcons.lock
                                  : TIcons.cashier,
                              color: TColors.neutralLightLightest,
                            ),
                          ),
                          Text(
                            "Buka Kasir",
                            style: GoogleFonts.inter(
                              fontSize: TSizes.fontSizeBodyL,
                              fontWeight: FontWeight.w700,
                              color: TColors.neutralLightLightest,
                            ),
                          )
                        ],
                      ),
                      if (state is CashierOpened)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                "Kasir: ",
                                style: GoogleFonts.inter(
                                  fontSize: TSizes.fontSizeBodyM,
                                  fontWeight: FontWeight.w400,
                                  color: TColors.neutralLightLight,
                                ),
                              ),
                            ),
                            Text(
                              state.operator.name,
                              style: GoogleFonts.inter(
                                fontSize: TSizes.fontSizeBodyL,
                                fontWeight: FontWeight.w700,
                                color: TColors.neutralLightLightest,
                              ),
                            )
                          ],
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
