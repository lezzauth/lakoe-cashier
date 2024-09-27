import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/features/employees/data/arguments/employee_detail_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class DetailEmployeeScreen extends StatefulWidget {
  const DetailEmployeeScreen({super.key, required this.arguments});

  final EmployeeDetailArgument arguments;

  @override
  State<DetailEmployeeScreen> createState() => _DetailEmployeeScreenState();
}

class _DetailEmployeeScreenState extends State<DetailEmployeeScreen> {
  bool visiblePIN = false;
  @override
  Widget build(BuildContext context) {
    final employee = widget.arguments.employee;
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Detail Karyawan",
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                employee.profilePicture == null
                    ? SvgPicture.asset(
                        TImages.contactAvatar,
                        height: 80,
                        width: 80,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                          employee.profilePicture!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                const SizedBox(height: 16),
                TextHeading2(
                  employee.name,
                  color: TColors.neutralDarkDark,
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TColors.neutralLightMedium,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Column(
                      children: [
                        Container(
                          color: TColors.neutralLightLight,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              const Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: TextBodyL(
                                  "Posisi",
                                  fontWeight: FontWeight.w600,
                                  color: TColors.neutralDarkDarkest,
                                ),
                              ),
                              const TextBodyL(
                                ":",
                                fontWeight: FontWeight.w600,
                                color: TColors.neutralDarkDarkest,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: TextBodyL(
                                  employee.role,
                                  color: TColors.neutralDarkDarkest,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: TColors.neutralLightLightest,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              const Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: TextBodyL(
                                  "No. HP",
                                  fontWeight: FontWeight.w600,
                                  color: TColors.neutralDarkDarkest,
                                ),
                              ),
                              const TextBodyL(
                                ":",
                                fontWeight: FontWeight.w600,
                                color: TColors.neutralDarkDarkest,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: TextBodyL(
                                  employee.phoneNumber,
                                  color: TColors.neutralDarkDarkest,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: TColors.neutralLightLight,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              const Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: TextBodyL(
                                  "Email",
                                  fontWeight: FontWeight.w600,
                                  color: TColors.neutralDarkDarkest,
                                ),
                              ),
                              const TextBodyL(
                                ":",
                                fontWeight: FontWeight.w600,
                                color: TColors.neutralDarkDarkest,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: TextBodyL(
                                  employee.email == null
                                      ? "-"
                                      : employee.email!,
                                  color: TColors.neutralDarkDarkest,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   color: TColors.neutralLightLightest,
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 12, vertical: 8),
                        //   child: Row(
                        //     children: [
                        //       const Flexible(
                        //         flex: 2,
                        //         fit: FlexFit.tight,
                        //         child: TextBodyL(
                        //           "PIN",
                        //           fontWeight: FontWeight.w600,
                        //           color: TColors.neutralDarkDarkest,
                        //         ),
                        //       ),
                        //       const TextBodyL(
                        //         ":",
                        //         fontWeight: FontWeight.w600,
                        //         color: TColors.neutralDarkDarkest,
                        //       ),
                        //       const SizedBox(width: 8),
                        //       Flexible(
                        //         flex: 3,
                        //         child: Row(
                        //           children: [
                        //             Expanded(
                        //               child: TextBodyL(
                        //                 !visiblePIN ? "••••••" : "999222",
                        //                 color: TColors.neutralDarkDarkest,
                        //               ),
                        //             ),
                        //             UiIcons(
                        //               onTap: () {
                        //                 setState(() {
                        //                   visiblePIN = !visiblePIN;
                        //                 });
                        //               },
                        //               !visiblePIN
                        //                   ? TIcons.eyeClose
                        //                   : TIcons.eye,
                        //               height: 20,
                        //               width: 20,
                        //               color: TColors.neutralDarkLight,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   color: TColors.neutralLightLight,
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 12, vertical: 8),
                        //   child: const Row(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Flexible(
                        //         flex: 2,
                        //         fit: FlexFit.tight,
                        //         child: TextBodyL(
                        //           "Hak Akses",
                        //           fontWeight: FontWeight.w600,
                        //           color: TColors.neutralDarkDarkest,
                        //         ),
                        //       ),
                        //       TextBodyL(
                        //         ":",
                        //         fontWeight: FontWeight.w600,
                        //         color: TColors.neutralDarkDarkest,
                        //       ),
                        //       SizedBox(width: 8),
                        //       Flexible(
                        //         flex: 3,
                        //         fit: FlexFit.tight,
                        //         child: Wrap(
                        //           spacing: 4,
                        //           runSpacing: 4,
                        //           children: [
                        //             Tag(label: "Penjualan"),
                        //             Tag(label: "Kelola Produk"),
                        //             Tag(label: "Supplier"),
                        //             Tag(label: "QR Order & Meja"),
                        //             Tag(label: "Laporan"),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: OutlinedButton(
                onPressed: () {/* ... */},
                child: const TextActionL('Ubah Data Karyawan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String label;
  const Tag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: TColors.neutralLightMedium,
      ),
      child: TextHeading5(
        label,
        color: TColors.neutralDarkDark,
      ),
    );
  }
}
