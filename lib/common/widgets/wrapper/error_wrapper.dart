import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:point_of_sales_cashier/common/widgets/error_display/error_display.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_action_l.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class ErrorWrapper extends StatefulWidget {
  const ErrorWrapper({
    super.key,
    this.fetchError = false,
    this.actionError = false,
    this.actionErrorDisplay,
    this.fetchErrorDisplay,
    this.onRefresh,
    required this.child,
  });

  final bool fetchError;
  final bool actionError;
  final Widget? fetchErrorDisplay;
  final Widget? actionErrorDisplay;
  final Widget child;
  final Future<void> Function()? onRefresh;

  @override
  State<ErrorWrapper> createState() => _ErrorWrapperState();
}

class _ErrorWrapperState extends State<ErrorWrapper> {
  @override
  void didUpdateWidget(ErrorWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the fetchError has changed from false to true
    if (oldWidget.fetchError == false && widget.fetchError == true) {
      // Show a modal bottom sheet if fetchError is true
      SchedulerBinding.instance.addPostFrameCallback(
        (timeStamp) {
          _showFetchErrorModal();
        },
      );
    }

    if (oldWidget.actionError == false && widget.actionError == true) {
      SchedulerBinding.instance.addPostFrameCallback(
        (timeStamp) {
          _showActionErrorModal();
        },
      );
    }
  }

  void _showFetchErrorModal() {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      builder: (context) {
        return widget.fetchErrorDisplay ??
            ErrorDisplay(
              description: "Terjadi kesalahan saat mendapatkan data!",
              imageSrc: TImages.storagePermission,
              title: "Gagal mendapatkan data",
              actionTitle: "Refresh",
              onAction: () async {
                if (widget.onRefresh != null) {
                  await widget.onRefresh!();
                }

                if (!context.mounted) return;
                Navigator.pop(context);
              },
            );
      },
    );
  }

  void _showActionErrorModal() {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      builder: (context) {
        return widget.actionErrorDisplay ??
            ErrorDisplay(
              description: "Terjadi kesalahan saat melakukan aksi!",
              imageSrc: TImages.storagePermission,
              title: "Gagal melakukan aksi",
              actionTitle: "Tutup",
              onAction: () {
                Navigator.pop(context);
              },
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}