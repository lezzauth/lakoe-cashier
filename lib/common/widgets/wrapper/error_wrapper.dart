import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lakoe_pos/common/widgets/error_display/error_display.dart';
import 'package:lakoe_pos/common/widgets/ui/bottomsheet/custom_bottomsheet.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

class ErrorWrapper extends StatefulWidget {
  const ErrorWrapper({
    super.key,
    this.connectionIssue = false,
    this.fetchError = false,
    this.actionError = false,
    this.actionErrorDisplay,
    this.fetchErrorDisplay,
    this.onRefresh,
    required this.child,
  });

  final bool connectionIssue;
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

    if (oldWidget.fetchError == false && widget.fetchError == true) {
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

    if (oldWidget.connectionIssue == false && widget.connectionIssue == true) {
      SchedulerBinding.instance.addPostFrameCallback(
        (timeStamp) {
          _showConnectionErrorModal();
        },
      );
    }
  }

  Future<void> openSettings() async {
    final intent = AndroidIntent(
      action: 'android.settings.SETTINGS',
      flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
    );
    await intent.launch();
  }

  void _showFetchErrorModal() {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {},
          child: CustomBottomsheet(
            hasGrabber: false,
            child: widget.fetchErrorDisplay ??
                ErrorDisplay(
                  imageSrc: TImages.generalIllustration,
                  title: "Ups, Terjadi sedikit kesalahan!",
                  description:
                      "Kamu bisa mencobanya lagi dengan tekan tombol dibawah ini, ya",
                  actionTitlePrimary: "Coba Lagi",
                  onActionPrimary: () async {
                    Navigator.pop(context);
                    await Future.delayed(Duration(seconds: 2));
                    if (widget.onRefresh != null) {
                      widget.onRefresh!();
                    }
                  },
                ),
          ),
        );
      },
    );
  }

  void _showConnectionErrorModal() {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {},
          child: CustomBottomsheet(
            hasGrabber: false,
            child: ErrorDisplay(
              imageSrc: TImages.noConnection,
              title: "Koneksi internet aman ngga?",
              description:
                  "Coba cek WiFi atau kuota internet kamu dulu terus bisa dicoba lagi, ya!",
              actionTitlePrimary: "Pengaturan",
              onActionPrimary: () {
                Navigator.pop(context);
                openSettings();
              },
              actionTitleSecondary: "Coba Lagi",
              onActionSecondary: () async {
                Navigator.pop(context);
                await Future.delayed(Duration(seconds: 2));
                if (widget.onRefresh != null) {
                  widget.onRefresh!();
                }
              },
            ),
          ),
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
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {},
          child: CustomBottomsheet(
            hasGrabber: false,
            child: widget.actionErrorDisplay ??
                ErrorDisplay(
                  imageSrc: TImages.generalIllustration,
                  title: "Maaf, servernya lagi sibuk, nih!",
                  description: "Kamu bisa mencobanya beberapa saat lagi, ya",
                  actionTitlePrimary: "Tutup",
                  onActionPrimary: () {
                    Navigator.pop(context);
                  },
                ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
