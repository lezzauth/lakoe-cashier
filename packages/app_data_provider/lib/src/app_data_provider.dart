import 'package:app_data_provider/src/models/app_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppDataKeys {
  outletId,
  ownerId,
  activePackage,
  footNote,
  isAutoPrint,
  avatarSvg,
  logoBrand,
  colorBrand,
  flavor,
  billNumber,
  billNumberForOrder,
  hasMadeFirstOrder,
  hasSeenReviewPrompt,
}

class AppDataProvider {
  final SharedPreferencesAsync _storage = SharedPreferencesAsync();

  Future<void> setOutletId(String value) async {
    return await _storage.setString(AppDataKeys.outletId.name, value);
  }

  Future<void> setOwnerId(String value) async {
    return await _storage.setString(AppDataKeys.ownerId.name, value);
  }

  Future<void> setActivePackage(String value) async {
    return await _storage.setString(AppDataKeys.activePackage.name, value);
  }

  Future<void> setFootNote(String value) async {
    return await _storage.setString(AppDataKeys.footNote.name, value);
  }

  Future<void> setIsBillAutoPrint(bool value) async {
    return await _storage.setBool(AppDataKeys.isAutoPrint.name, value);
  }

  Future<void> setAvatar(String svgData) async {
    await _storage.setString(AppDataKeys.avatarSvg.name, svgData);
  }

  Future<void> setColorBrand(String color) async {
    await _storage.setString(AppDataKeys.colorBrand.name, color);
  }

  Future<void> setLogoBrand(String url) async {
    await _storage.setString(AppDataKeys.logoBrand.name, url);
  }

  Future<void> setFlavor(String value) async {
    await _storage.setString(AppDataKeys.flavor.name, value);
  }

  /// Menandai bahwa pengguna sudah layak menerima review setelah order pertama
  Future<void> setFirstOrderCompleted(bool value) async {
    await _storage.setBool(AppDataKeys.hasMadeFirstOrder.name, value);
  }

  /// Menandai bahwa pengguna sudah melihat prompt review (agar tidak muncul lagi)
  Future<void> setReviewPromptSeen(bool value) async {
    await _storage.setBool(AppDataKeys.hasSeenReviewPrompt.name, value);
  }

  Future<void> setValues(AppDataModel values) async {
    await _storage.setString(AppDataKeys.outletId.name, values.outletId);
    await _storage.setString(AppDataKeys.ownerId.name, values.ownerId);
    await _storage.setString(
        AppDataKeys.activePackage.name, values.activePackage);
    await _storage.setString(AppDataKeys.footNote.name, values.footNote);
    await _storage.setBool(AppDataKeys.isAutoPrint.name, values.isAutoPrint);
    await _storage.setString(AppDataKeys.avatarSvg.name, values.avatarSvg);
    await _storage.setString(AppDataKeys.colorBrand.name, values.colorBrand);
    await _storage.setString(AppDataKeys.logoBrand.name, values.logoBrand);
    await _storage.setString(AppDataKeys.flavor.name, values.flavor);
    await _storage.setBool(
        AppDataKeys.hasMadeFirstOrder.name, values.hasMadeFirstOrder);
    await _storage.setBool(
        AppDataKeys.hasSeenReviewPrompt.name, values.hasSeenReviewPrompt);
  }

  Future<String> get outletId async {
    return await _storage.getString(AppDataKeys.outletId.name) ?? "";
  }

  Future<String> get ownerId async {
    return await _storage.getString(AppDataKeys.ownerId.name) ?? "";
  }

  Future<String> get activePackage async {
    return await _storage.getString(AppDataKeys.activePackage.name) ?? "";
  }

  Future<String> get footNote async {
    return await _storage.getString(AppDataKeys.footNote.name) ?? "";
  }

  Future<bool> get isAutoPrint async {
    return await _storage.getBool(AppDataKeys.isAutoPrint.name) ?? false;
  }

  Future<String?> get avatarSvg async {
    return await _storage.getString(AppDataKeys.avatarSvg.name);
  }

  Future<String?> get colorBrand async {
    return await _storage.getString(AppDataKeys.colorBrand.name);
  }

  Future<String?> get logoBrand async {
    return await _storage.getString(AppDataKeys.logoBrand.name);
  }

  Future<String?> get flavor async {
    return await _storage.getString(AppDataKeys.flavor.name);
  }

  /// Mengecek apakah pengguna sudah layak untuk menerima review
  Future<bool> get hasMadeFirstOrder async {
    return await _storage.getBool(AppDataKeys.hasMadeFirstOrder.name) ?? false;
  }

  /// Mengecek apakah pengguna sudah pernah melihat prompt review
  Future<bool> get hasSeenReviewPrompt async {
    return await _storage.getBool(AppDataKeys.hasSeenReviewPrompt.name) ??
        false;
  }

  Future<AppDataModel> get values async {
    final outletId = await _storage.getString(AppDataKeys.outletId.name) ?? "";
    final ownerId = await _storage.getString(AppDataKeys.ownerId.name) ?? "";
    final activePackage =
        await _storage.getString(AppDataKeys.activePackage.name) ?? "";
    final footNote = await _storage.getString(AppDataKeys.footNote.name) ?? "";
    final isAutoPrint =
        await _storage.getBool(AppDataKeys.isAutoPrint.name) ?? false;
    final avatarSvg =
        await _storage.getString(AppDataKeys.avatarSvg.name) ?? "";
    final colorBrand =
        await _storage.getString(AppDataKeys.colorBrand.name) ?? "";
    final logoBrand =
        await _storage.getString(AppDataKeys.logoBrand.name) ?? "";
    final flavor = await _storage.getString(AppDataKeys.flavor.name) ?? "";
    final hasMadeFirstOrder =
        await _storage.getBool(AppDataKeys.hasMadeFirstOrder.name) ?? false;
    final hasSeenReviewPrompt =
        await _storage.getBool(AppDataKeys.hasSeenReviewPrompt.name) ?? false;

    return AppDataModel(
        footNote: footNote,
        isAutoPrint: isAutoPrint,
        outletId: outletId,
        activePackage: activePackage,
        ownerId: ownerId,
        avatarSvg: avatarSvg,
        colorBrand: colorBrand,
        logoBrand: logoBrand,
        flavor: flavor,
        hasMadeFirstOrder: hasMadeFirstOrder,
        hasSeenReviewPrompt: hasSeenReviewPrompt);
  }
}
