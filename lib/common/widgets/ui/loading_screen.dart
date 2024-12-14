import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_l.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: TColors.neutralLightLightest,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: LinearProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(TColors.primary),
                      backgroundColor: TColors.neutralLightMedium,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextBodyL(
                  "Tunggu sebantar, ya!",
                  color: TColors.neutralDarkLight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
