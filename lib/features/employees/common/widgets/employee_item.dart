import 'package:app_data_provider/app_data_provider.dart';
import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_s.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_4.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({
    super.key,
    required this.data,
    this.onTap,
  });
  final EmployeeModel data;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final AppDataProvider appDataProvider = AppDataProvider();

    String roleName = "Kasir";

    if (data.role == "OWNER") {
      roleName = "Pemilik & Kasir";
    } else {
      roleName = "Kasir";
    }

    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: data.role == "OWNER"
              ? FutureBuilder<String?>(
                  future: appDataProvider.avatarSvg,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data!.isNotEmpty) {
                      return Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: TColors.neutralLightMedium,
                            width: 1.0,
                          ),
                        ),
                        child: ClipOval(
                          child: SvgPicture.string(
                            snapshot.data!,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                    return SvgPicture.asset(
                      TImages.contactAvatar,
                      height: 40,
                      width: 40,
                    );
                  },
                )
              : (data.profilePicture != null
                  ? Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        data.profilePicture!,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    )
                  : SvgPicture.asset(
                      TImages.contactAvatar,
                      height: 40,
                      width: 40,
                    )),
          title: TextHeading4(data.name),
          subtitle: TextBodyS(
            roleName,
            color: TColors.neutralDarkLight,
          ),
          trailing: const UiIcons(
            TIcons.arrowRight,
            size: 16,
            color: TColors.neutralDarkLightest,
          ),
        ),
        const Divider(
          color: TColors.neutralLightMedium,
          indent: 16.0,
          height: 1,
        ),
      ],
    );
  }
}
