import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logman/logman.dart';
import 'package:uni_links/uni_links.dart';

class DeeplinkHandler {
  StreamSubscription? _deeplinkSubscription;

  Future<void> init({
    required Function(Uri uri) onDeeplinkReceived,
    required VoidCallback onError,
  }) async {
    try {
      final initialUri = await getInitialUri();
      if (initialUri != null) {
        Logman.instance
            .info("[Deeplink] Initial deeplink detected: $initialUri");
        onDeeplinkReceived(initialUri);
        _disposeListener();
      }
    } catch (e) {
      Logman.instance.error("[Deeplink] Error getting initial deeplink: $e");
      onError();
    }

    _listenToDeeplink(onDeeplinkReceived, onError);
  }

  void _listenToDeeplink(
    Function(Uri uri) onDeeplinkReceived,
    VoidCallback onError,
  ) {
    Logman.instance.info("[Deeplink] Listening to global deeplink...");
    _deeplinkSubscription = uriLinkStream.listen(
      (uri) {
        if (uri != null) {
          Logman.instance.info("[Deeplink] Received deeplink: $uri");
          onDeeplinkReceived(uri);
          _disposeListener();
        }
      },
      onError: (err) {
        Logman.instance.error("[Deeplink] Error in deeplink stream: $err");
        onError();
      },
    );
  }

  void _disposeListener() {
    _deeplinkSubscription?.cancel();
    _deeplinkSubscription = null;
    Logman.instance.info("[Deeplink] Listener disposed.");
  }

  void dispose() {
    _disposeListener();
  }
}
