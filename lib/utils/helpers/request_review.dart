import 'package:app_data_provider/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:lakoe_pos/common/widgets/buttons/tertiary_button.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_2.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';
import 'package:logman/logman.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestReview {
  static final InAppReview _inAppReview = InAppReview.instance;

  static Future<void> request(BuildContext context) async {
    final appData = AppDataProvider();
    bool hasSeenReview = await appData.hasSeenReviewPrompt;
    bool isEligible = await appData.hasMadeFirstOrder;

    if (!isEligible || hasSeenReview) {
      Logman.instance.info(
        "⏳ User is not eligible or has already received a review prompt.",
      );
      return;
    }

    try {
      if (await _inAppReview.isAvailable()) {
        await _inAppReview.requestReview();
        await appData.setReviewPromptSeen(true);
      } else {
        if (!context.mounted) return;
        _showReviewBottomSheet(context);
      }
    } catch (e) {
      Logman.instance.error("Error saat meminta review: $e");
    }
  }

  static void _showReviewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CustomBottomsheet(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        TImages.generalIllustration,
                        height: 100,
                      ),
                    ),
                    TextHeading2(
                      "Sudah nge-review Lakoe?",
                      color: TColors.neutralDarkDark,
                    ),
                    SizedBox(height: 4),
                    TextBodyM(
                      "Kalau ada waktu luang, yuk berikan ulasan di Play Store. Ulasan dari Anda sangat membantu kami untuk terus mengembangkan aplikasi ini.",
                      color: TColors.neutralDarkDark,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TertiaryButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextActionL("Nanti Saja"),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          _openPlayStore();
                          await AppDataProvider().setReviewPromptSeen(true);
                        },
                        child: TextActionL("Beri Ulasan di Play Store"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void _openPlayStore() async {
    const String appId = "com.lakoe.app";
    final String url = "https://play.google.com/store/apps/details?id=$appId";
    final Uri parsedUrl = Uri.parse(url);

    if (await canLaunchUrl(parsedUrl)) {
      await launchUrl(parsedUrl);
    } else {
      Logman.instance.error("Can't open Play Store.");
    }
  }
}
