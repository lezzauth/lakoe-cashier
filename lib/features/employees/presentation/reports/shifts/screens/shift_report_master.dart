import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/appbar/custom_appbar.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_heading_3.dart';
import 'package:lakoe_pos/features/employees/presentation/reports/shifts/widgets/list_item_shift.dart';

class ShiftReportScreen extends StatefulWidget {
  const ShiftReportScreen({super.key});

  @override
  State<ShiftReportScreen> createState() => _ShiftReportScreenState();
}

class _ShiftReportScreenState extends State<ShiftReportScreen> {
  ShiftHistory shiftActive = ShiftHistory(
    date: DateTime.now().toString(),
    cashierName: "Dwi Prasetyo",
  );

  List<ShiftHistory> shiftHistories = [
    ShiftHistory(date: "2025-01-25T14:27:11.185Z", cashierName: "Dwi Prasetyo"),
    ShiftHistory(date: "2025-01-24T14:27:11.185Z", cashierName: "Dwi Prasetyo"),
    ShiftHistory(date: "2025-01-23T14:27:11.185Z", cashierName: "Dwi Prasetyo"),
    ShiftHistory(date: "2025-01-22T14:27:11.185Z", cashierName: "Dwi Prasetyo"),
    ShiftHistory(date: "2025-01-21T14:27:11.185Z", cashierName: "Dwi Prasetyo"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: 'Laporan Shift',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextHeading3("Shift Berjalan"),
                  ),
                  SizedBox(height: 8),
                  ListItemShift(
                    isActive: true,
                    shift: shiftActive,
                    onTap: () {
                      Navigator.pushNamed(context, "/shift-report/detail");
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextHeading3("Shift Berjalan"),
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: shiftHistories.length,
                      itemBuilder: (context, i) {
                        return ListItemShift(
                          shift: shiftHistories[i],
                          onTap: () {
                            Navigator.pushNamed(
                                context, "/shift-report/detail");
                          },
                        );
                      }),
                ],
              ),
            ],
          ),
        ));
  }
}

class ShiftHistory {
  final String date;
  final String cashierName;

  ShiftHistory({
    required this.date,
    required this.cashierName,
  });
}
