import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class PopupConfirmation extends StatefulWidget {
  const PopupConfirmation({
    super.key,
    required this.title,
    required this.message,
    required this.labelButtonPrimary,
    required this.labelButtonSecondary,
    required this.discardAction,
    required this.saveAction,
    this.isDiscardActionLoading = false,
    this.isSaveActionLoading = false,
  });

  final String title;
  final String message;
  final String labelButtonPrimary;
  final String labelButtonSecondary;
  final Function() discardAction;
  final Function() saveAction;
  final bool isDiscardActionLoading;
  final bool isSaveActionLoading;

  @override
  State<PopupConfirmation> createState() => _ChangesConfirmationState();
}

class _ChangesConfirmationState extends State<PopupConfirmation> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[600],
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: TColors.neutralLightLightest,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextHeading2(
              widget.title,
            ),
            const SizedBox(height: 8),
            TextBodyM(
              widget.message,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: widget.discardAction,
                      child: widget.isDiscardActionLoading
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                color: TColors.primary,
                                strokeWidth: 2,
                              ),
                            )
                          : TextActionL(
                              widget.labelButtonSecondary,
                            ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: widget.saveAction,
                      child: widget.isSaveActionLoading
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                color: TColors.neutralLightLightest,
                                strokeWidth: 2,
                              ),
                            )
                          : TextActionL(
                              widget.labelButtonPrimary,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
