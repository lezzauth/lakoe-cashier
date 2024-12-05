import 'package:employee_repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lakoe_pos/common/widgets/icon/ui_icons.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_cubit.dart';
import 'package:lakoe_pos/features/cashier/application/cubit/cashier/cashier_state.dart';
import 'package:lakoe_pos/features/employees/data/arguments/forgot_pin_dto.dart';
import 'package:lakoe_pos/features/employees/presentation/widgets/forms/employee_select.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';
import 'package:lakoe_pos/utils/constants/icon_strings.dart';
import 'package:lakoe_pos/utils/constants/sizes.dart';

class NumberPad extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLength;
  final bool isShowForgot;

  const NumberPad({
    super.key,
    this.controller,
    this.maxLength,
    this.isShowForgot = true,
  });

  @override
  State<NumberPad> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  EmployeeModel? employee;

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  Future<void> _onInit() async {
    context.read<CashierCubit>().getOpenCashier();
  }

  @override
  void dispose() {
    if (widget.controller is TextEditingController) {
      widget.controller?.dispose();
    }
    super.dispose();
  }

  void handleChange(String value) {
    if (widget.controller == null) return;
    if (widget.controller!.text.length == widget.maxLength) return;

    widget.controller!.value =
        TextEditingValue(text: '${widget.controller!.text}$value');
  }

  void handleBackspace() {
    if (widget.controller == null) return;
    if (widget.controller!.text.isEmpty) return;

    String newValue = widget.controller!.text;
    newValue = newValue.substring(0, newValue.length - 1);

    widget.controller!.value = TextEditingValue(text: newValue);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CashierCubit, CashierState>(
      listener: (context, state) {
        if (state is CashierAlreadyOpen) {
          setState(() {
            employee = EmployeeModel(
              id: state.operator.id,
              role: state.operator.role,
              name: state.operator.name,
              phoneNumber: state.operator.phoneNumber,
              emailVerified: state.operator.emailVerified,
              phoneVerified: state.operator.phoneVerified,
              outletId: state.operator.outletId,
              createdAt: state.operator.createdAt,
              updatedAt: state.operator.updatedAt,
            );
          });
        }
      },
      child: BlocBuilder<CashierCubit, CashierState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Pad(
                      onTap: () {
                        handleChange("1");
                      },
                      child: Text("1",
                          style: GoogleFonts.inter(
                            fontSize: TSizes.fontSizeHeading1,
                            fontWeight: FontWeight.w900,
                            color: TColors.neutralDarkDarkest,
                          ))),
                  Pad(
                      onTap: () {
                        handleChange("2");
                      },
                      child: Text("2",
                          style: GoogleFonts.inter(
                            fontSize: TSizes.fontSizeHeading1,
                            fontWeight: FontWeight.w900,
                            color: TColors.neutralDarkDarkest,
                          ))),
                  Pad(
                    onTap: () {
                      handleChange("3");
                    },
                    child: Text(
                      "3",
                      style: GoogleFonts.inter(
                        fontSize: TSizes.fontSizeHeading1,
                        fontWeight: FontWeight.w900,
                        color: TColors.neutralDarkDarkest,
                      ),
                    ),
                  ),
                ],
              ),

              // New Row
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Pad(
                      onTap: () {
                        handleChange("4");
                      },
                      child: Text("4",
                          style: GoogleFonts.inter(
                            fontSize: TSizes.fontSizeHeading1,
                            fontWeight: FontWeight.w900,
                            color: TColors.neutralDarkDarkest,
                          ))),
                  Pad(
                      onTap: () {
                        handleChange("5");
                      },
                      child: Text("5",
                          style: GoogleFonts.inter(
                            fontSize: TSizes.fontSizeHeading1,
                            fontWeight: FontWeight.w900,
                            color: TColors.neutralDarkDarkest,
                          ))),
                  Pad(
                    onTap: () {
                      handleChange("6");
                    },
                    child: Text(
                      "6",
                      style: GoogleFonts.inter(
                        fontSize: TSizes.fontSizeHeading1,
                        fontWeight: FontWeight.w900,
                        color: TColors.neutralDarkDarkest,
                      ),
                    ),
                  ),
                ],
              ),

              // New row

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Pad(
                      onTap: () {
                        handleChange("7");
                      },
                      child: Text("7",
                          style: GoogleFonts.inter(
                            fontSize: TSizes.fontSizeHeading1,
                            fontWeight: FontWeight.w900,
                            color: TColors.neutralDarkDarkest,
                          ))),
                  Pad(
                      onTap: () {
                        handleChange("8");
                      },
                      child: Text("8",
                          style: GoogleFonts.inter(
                            fontSize: TSizes.fontSizeHeading1,
                            fontWeight: FontWeight.w900,
                            color: TColors.neutralDarkDarkest,
                          ))),
                  Pad(
                    onTap: () {
                      handleChange("9");
                    },
                    child: Text(
                      "9",
                      style: GoogleFonts.inter(
                        fontSize: TSizes.fontSizeHeading1,
                        fontWeight: FontWeight.w900,
                        color: TColors.neutralDarkDarkest,
                      ),
                    ),
                  ),
                ],
              ),

              //New row

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Pad(
                    onTap: () {
                      if (employee == null) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          useSafeArea: true,
                          builder: (context) {
                            return CustomBottomsheet(
                              child: EmployeeSelect(
                                value: employee,
                                onChanged: (value) {
                                  Navigator.pop(context);
                                  setState(() {
                                    employee = value;
                                  });
                                  Navigator.pushNamed(
                                    context,
                                    "/employee/forgot/input_otp",
                                    arguments: ForgotPinArguments(
                                      id: value!.id,
                                      phoneNumber: value.phoneNumber,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        Navigator.pushNamed(
                          context,
                          "/employee/forgot/input_otp",
                          arguments: ForgotPinArguments(
                            id: employee!.id,
                            phoneNumber: employee!.phoneNumber,
                          ),
                        );
                      }
                    },
                    color: Colors.transparent,
                    child: !widget.isShowForgot
                        ? SizedBox()
                        : (state is GetCashierInProgress)
                            ? SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    TColors.primary,
                                  ),
                                  strokeWidth: 2.5,
                                ),
                              )
                            : Text(
                                "Lupa?",
                                style: GoogleFonts.inter(
                                  fontSize: TSizes.fontSizeHeading4,
                                  fontWeight: FontWeight.w600,
                                  color: TColors.primary,
                                ),
                              ),
                  ),
                  Pad(
                    onTap: () {
                      handleChange("0");
                    },
                    child: Text(
                      "0",
                      style: GoogleFonts.inter(
                        fontSize: TSizes.fontSizeHeading1,
                        fontWeight: FontWeight.w900,
                        color: TColors.neutralDarkDarkest,
                      ),
                    ),
                  ),
                  Pad(
                    onTap: () {
                      handleBackspace();
                    },
                    child: const UiIcons(
                      TIcons.backspace,
                      size: 24,
                      color: TColors.neutralDarkDarkest,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class Pad extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Color? color;

  const Pad({super.key, required this.child, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(72.0),
            color: color ?? TColors.neutralLightMedium,
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
