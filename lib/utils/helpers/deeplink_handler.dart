import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logman/logman.dart';
import 'package:uni_links/uni_links.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeeplinkHandler {
  StreamSubscription? _deeplinkSubscription;

  Future<void> init({
    required Function(Uri uri) onDeeplinkReceived,
    required VoidCallback onError,
  }) async {
    final hasBeenHandled = await DeeplinkPrefs.hasDeeplinkBeenHandled();
    if (!hasBeenHandled) {
      try {
        final initialUri = await getInitialUri();
        if (initialUri != null) {
          Logman.instance
              .info("[Deeplink] Initial deeplink detected: $initialUri");
          await DeeplinkPrefs.markDeeplinkHandled();
          onDeeplinkReceived(initialUri);
        }
      } catch (e) {
        Logman.instance.error("[Deeplink] Error getting initial deeplink: $e");
        onError();
      }
    }

    _listenToDeeplink(onDeeplinkReceived, onError);
  }

  void _listenToDeeplink(
    Function(Uri uri) onDeeplinkReceived,
    VoidCallback onError,
  ) {
    Logman.instance.info("[Deeplink] Listening for global deeplink...");
    _deeplinkSubscription = uriLinkStream.listen(
      (uri) async {
        if (uri != null) {
          Logman.instance.info("[Deeplink] Received deeplink: $uri");
          await DeeplinkPrefs.markDeeplinkHandled();
          onDeeplinkReceived(uri);
        }
      },
      onError: (err) {
        Logman.instance.error("[Deeplink] Error in deeplink stream: $err");
        onError();
      },
    );
  }

  void dispose() {
    _deeplinkSubscription?.cancel();
    _deeplinkSubscription = null;
    Logman.instance.info("[Deeplink] Listener disposed.");
  }
}

class DeeplinkPrefs {
  static const String _hasHandledDeeplinkKey = 'hasHandledDeeplink';

  static Future<void> markDeeplinkHandled() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasHandledDeeplinkKey, true);
  }

  /// Mengecek apakah deeplink sudah pernah diproses
  static Future<bool> hasDeeplinkBeenHandled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasHandledDeeplinkKey) ?? false;
  }

  /// Reset status deeplink (misalnya setelah logout)
  static Future<void> resetDeeplinkStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_hasHandledDeeplinkKey);
  }
}
