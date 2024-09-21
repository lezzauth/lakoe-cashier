import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_m.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_2.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';

class ChangesConfirmation extends StatefulWidget {
  const ChangesConfirmation({
    super.key,
    required this.messageChanges,
    required this.discardAction,
    required this.saveAction,
  });

  final String messageChanges;
  final Function() discardAction;
  final Function() saveAction;

  @override
  State<ChangesConfirmation> createState() => _ChangesConfirmationState();
}

class _ChangesConfirmationState extends State<ChangesConfirmation> {
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
            const TextHeading2(
              "Ada yang berubah...",
            ),
            const SizedBox(height: 8),
            TextBodyM(
              "Kamu telah melakukan perubahan ${widget.messageChanges.toLowerCase()}.",
            ),
            const SizedBox(height: 8),
            const TextBodyM(
              "Mau disimpan atau diabaikan?",
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
                      child: const TextActionL(
                        "Abaikan",
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
                      child: const TextActionL(
                        "Simpan",
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
