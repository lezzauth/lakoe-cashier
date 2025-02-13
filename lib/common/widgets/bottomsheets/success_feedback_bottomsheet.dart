import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class SuccessFeedbackBottomsheet {
  static void show(
    BuildContext context, {
    bool openInFeedbackScreen = true,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CustomBottomsheet(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      TImages.feedbackSuccess,
                      height: 72,
                    ),
                    const SizedBox(height: 16),
                    TextHeading3(
                      "Terimakasih atas masukannya",
                      color: TColors.neutralDarkDark,
                    ),
                    const SizedBox(height: 4),
                    TextBodyM(
                      "Masukan kamu udah kita terima dan akan kita pelajari. Yuk, tetap pakai Lakoe POS dan bantu kami jadi lebih baik!",
                      color: TColors.neutralDarkDark,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (openInFeedbackScreen) Navigator.pop(context);
                    },
                    child: const TextActionL("Oke, Sip!"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
