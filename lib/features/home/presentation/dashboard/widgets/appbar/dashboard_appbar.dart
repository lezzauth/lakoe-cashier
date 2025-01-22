import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_cubit.dart';
import 'package:lakoe_pos/features/account/application/cubit/owner_state.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:app_data_provider/app_data_provider.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDataProvider appDataProvider = AppDataProvider();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              TImages.primaryLogoLakoe,
              height: 20,
              width: 77.1,
            ),
            BlocBuilder<OwnerCubit, OwnerState>(
              builder: (context, state) {
                if (state is OwnerLoadSuccess) {
                  final profile = state.owner;
                  return Wrap(
                    spacing: 20.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      UiIcons(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/orders",
                            arguments: {
                              "previousScreen": "Homepage",
                            },
                          );
                          // Navigator.pushNamed(context, "/notifications");
                        },
                        TIcons.bill,
                        color: TColors.neutralDarkDark,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.pushNamed(context, "/account"),
                        child: FutureBuilder<String?>(
                          future: appDataProvider.avatarSvg,
                          builder: (context, snapshot) {
                            return Container(
                              width: 32,
                              height: 32,
                              decoration: ShapeDecoration(
                                color: profile.packageName == "GROW"
                                    ? Color(0xFF00712D)
                                    : profile.packageName == "PRO"
                                        ? Color(0xFF9306AF)
                                        : Color(0xFFFD6E00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(4),
                                  ),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  if (snapshot.hasData &&
                                      snapshot.data != null &&
                                      snapshot.data!.isNotEmpty)
                                    SvgPicture.string(
                                      snapshot.data!,
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.cover,
                                    )
                                  else
                                    Positioned(
                                      left: 1,
                                      top: 1,
                                      child: Image.asset(
                                        TImages.defaultAvatar,
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                  Positioned(
                                    left: 20,
                                    top: 20,
                                    child: Image.asset(
                                      profile.packageName == "GROW"
                                          ? TImages.growLogo
                                          : profile.packageName == "PRO"
                                              ? TImages.proLogo
                                              : TImages.liteLogo,
                                      width: 12,
                                      height: 12,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68.0);
}
