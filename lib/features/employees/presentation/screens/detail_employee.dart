import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:point_of_sales_cashier/common/widgets/appbar/custom_appbar.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_5.dart';
import 'package:point_of_sales_cashier/common/widgets/wrapper/error_wrapper.dart';
import 'package:point_of_sales_cashier/features/employees/application/cubit/employee_detail/employee_detail_cubit.dart';
import 'package:point_of_sales_cashier/features/employees/application/cubit/employee_detail/employee_detail_state.dart';
import 'package:point_of_sales_cashier/features/employees/data/arguments/employee_detail_argument.dart';
import 'package:point_of_sales_cashier/features/employees/data/arguments/employee_edit_argument.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/formatters/formatter.dart';

class DetailEmployeeScreen extends StatelessWidget {
  const DetailEmployeeScreen({super.key, required this.arguments});

  final EmployeeDetailArgument arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeDetailCubit(),
      child: DetailEmployee(arguments: arguments),
    );
  }
}

class DetailEmployee extends StatefulWidget {
  const DetailEmployee({super.key, required this.arguments});

  final EmployeeDetailArgument arguments;

  @override
  State<DetailEmployee> createState() => _DetailEmployeeState();
}

class _DetailEmployeeState extends State<DetailEmployee> {
  bool visiblePIN = false;

  Future<void> _onRefresh() async {
    context.read<EmployeeDetailCubit>().init(widget.arguments.employee.id);
  }

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Detail Kasir",
      ),
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: BlocBuilder<EmployeeDetailCubit, EmployeeDetailState>(
            builder: (context, state) => ErrorWrapper(
                child: switch (state) {
              EmployeeDetailLoadSuccess(:final employee) => Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Column(
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
                                              employee.role == "OWNER"
                                                  ? "Pemilik & Kasir"
                                                  : "Kasir",
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
                                              PhoneNumberFormatter
                                                  .formatForDisplay(
                                                      employee.phoneNumber),
                                              color: TColors.neutralDarkDarkest,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
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
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
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
                                    //   ),]
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        await Navigator.pushNamed(context, "/employee/edit",
                            arguments:
                                EmployeeEditArgument(employee: employee));
                        _onRefresh();
                      },
                      child: const TextActionL(
                        'Ubah Data Karyawan',
                      ),
                    ),
                  ],
                ),
              _ => const Center(
                  child: CircularProgressIndicator(),
                ),
            }),
          ),
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
