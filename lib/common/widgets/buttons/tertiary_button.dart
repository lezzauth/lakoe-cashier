import 'package:flutter/material.dart';
import 'package:lakoe_pos/common/widgets/ui/typography/text_action_l.dart';
import 'package:lakoe_pos/utils/constants/colors.dart';

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
    super.key,
    this.isLoading = false,
    this.onPressed,
    this.label = "",
    this.child,
  });

  final bool isLoading;
  final Function()? onPressed;
  final String label;
  final Widget? child;

  Widget _buildChild() {
    if (isLoading) {
      return SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(),
      );
    }

    if (child != null) return child!;

    return TextActionL(
      label,
      color: TColors.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      child: _buildChild(),
    );
  }
}
