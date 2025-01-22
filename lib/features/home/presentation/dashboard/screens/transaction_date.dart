import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class TransactionDateScreen extends StatefulWidget {
  const TransactionDateScreen({super.key});

  @override
  State<TransactionDateScreen> createState() => _TransactionDateScreenState();
}

class _TransactionDateScreenState extends State<TransactionDateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColors.neutralLightLightest,
        appBar: CustomAppbar(
          title: "Tanggal Transaksi",
          actions: [
            TextButton(
              onPressed: () {},
              child: TextActionL(
                "SIMPAN",
                color: TColors.primary,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
              calendarViewMode: CalendarDatePicker2Mode.scroll,
              dayTextStyle: GoogleFonts.inter(
                fontSize: TSizes.fontSizeHeading4,
                color: TColors.neutralDarkMedium,
                fontWeight: FontWeight.w600,
              ),
              selectedDayTextStyle: GoogleFonts.inter(
                fontSize: TSizes.fontSizeHeading4,
                fontWeight: FontWeight.w600,
                color: TColors.neutralLightLightest,
              ),
              controlsTextStyle: GoogleFonts.inter(
                fontSize: TSizes.fontSizeHeading4,
                color: TColors.neutralDarkDarkest,
                fontWeight: FontWeight.w600,
              ),
              weekdayLabels: [
                "MIN",
                "SEN",
                "SEL",
                "RAB",
                "KAM",
                "JUM",
                "SAB",
              ],
              firstDayOfWeek: 1,
              weekdayLabelTextStyle: GoogleFonts.inter(
                color: TColors.neutralDarkLightest,
                fontWeight: FontWeight.w600,
                fontSize: TSizes.fontSizeCaptionM,
              ),
              hideScrollViewMonthWeekHeader: true,
              selectedRangeDayTextStyle: GoogleFonts.inter(
                fontSize: TSizes.fontSizeHeading4,
                fontWeight: FontWeight.w600,
                color: TColors.primary,
              ),
              hideScrollViewTopHeaderDivider: true,
            ),
            value: [],
            // value: ,
            // onValueChanged: (dates) => _dates = dates,
          ),
        ));
  }
}
