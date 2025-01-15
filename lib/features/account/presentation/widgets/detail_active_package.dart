import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lakoe_pos/utils/formatters/formatter.dart';
import 'package:owner_repository/owner_repository.dart';
import 'package:package_repository/package_repository.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_body_m.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/account/presentation/widgets/table_comparison.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class DetailActivePackage extends StatelessWidget {
  const DetailActivePackage({
    super.key,
    required this.index,
    required this.packageActive,
    required this.packageData,
    required this.previousPackage,
    required this.currentPackage,
  });

  final int index;
  final PackageActive? packageActive;
  final List<PackagePriceModel> packageData;
  final PackageModel previousPackage;
  final PackageModel currentPackage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextBodyM(
                "Paket aktif hingga",
                color: TColors.neutralDarkLight,
              ),
              const SizedBox(height: 4),
              (packageActive != null)
                  ? Row(
                      children: [
                        TextHeading3(
                          TFormatter.dateTime(
                            packageActive!.purchase!.endPeriod.toString(),
                            withTime: false,
                          ),
                          color: TColors.neutralDarkDark,
                        ),
                        RemainingPeriodWidget(
                          endPeriod: packageActive!.purchase!.endPeriod,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: const Color(0xFFE8E9F1),
                          highlightColor: const Color(0xFFF8F9FE),
                          child: Container(
                            height: 16,
                            width: 100,
                            decoration: BoxDecoration(
                              color: TColors.neutralLightLightest,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const TextBodyM(" • ", color: TColors.neutralDarkLight),
                        Shimmer.fromColors(
                          baseColor: const Color(0xFFE8E9F1),
                          highlightColor: const Color(0xFFF8F9FE),
                          child: Container(
                            height: 12,
                            width: 120,
                            decoration: BoxDecoration(
                              color: TColors.neutralLightLightest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        PackageComparisonTable(
          packages: packageData,
          peviousPackage: previousPackage,
          currentPackage: currentPackage,
        ),
      ],
    );
  }
}

class RemainingPeriodWidget extends StatefulWidget {
  final DateTime endPeriod;

  const RemainingPeriodWidget({super.key, required this.endPeriod});

  @override
  State<RemainingPeriodWidget> createState() => _RemainingPeriodWidgetState();
}

class _RemainingPeriodWidgetState extends State<RemainingPeriodWidget> {
  Timer? _timer;
  Duration remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    remainingTime = widget.endPeriod.difference(DateTime.now());
    if (remainingTime.inHours < 24) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          remainingTime = widget.endPeriod.difference(DateTime.now());

          if (remainingTime.isNegative) {
            timer.cancel();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Fungsi Menghitung Real Bulan dan Hari
  String _calculateRemainingTime(DateTime endPeriod) {
    final DateTime now = DateTime.now();
    int months = 0;
    int days = 0;
    DateTime tempDate = now;

    // Menghitung bulan secara real
    while (tempDate.day == endPeriod.day && tempDate.isBefore(endPeriod)) {
      final nextMonth =
          DateTime(tempDate.year, tempDate.month + 1, tempDate.day);
      if (nextMonth.isAfter(endPeriod)) break;
      months++;
      tempDate = nextMonth;
    }

    // Menghitung sisa hari secara real setelah bulan penuh
    days = endPeriod.difference(tempDate).inDays;

    if (months > 0 && days > 0) {
      return "$months bulan $days hari";
    } else if (months > 0 && days == 0) {
      return "$months bulan";
    } else {
      return "Sisa $days hari lagi";
    }
  }

  /// Fungsi Menghitung Jam, Menit, Detik untuk Countdown
  String _formatRemainingTime(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    if (duration.inHours > 0) {
      return "$hours jam $minutes menit";
    } else if (duration.inMinutes > 0) {
      return "$minutes menit $seconds detik";
    } else {
      return "$seconds detik";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (remainingTime.inHours >= 24) {
      return TextBodyM(
        " • ${_calculateRemainingTime(widget.endPeriod)}",
        color: TColors.neutralDarkLight,
      );
    } else {
      return TextBodyM(
        " • ${_formatRemainingTime(remainingTime)}",
        color: TColors.error,
      );
    }
  }
}
