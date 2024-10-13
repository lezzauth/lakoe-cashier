import 'package:app_data_provider/src/models/app_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppDataKeys {
  outletId,
  ownerId,
  footNote,
  isBillAutoPrint,
  avatarSvg,
}

class AppDataProvider {
  final SharedPreferencesAsync _storage = SharedPreferencesAsync();

  Future<void> setOutletId(String value) async {
    return await _storage.setString(AppDataKeys.outletId.name, value);
  }

  Future<void> setOwnerId(String value) async {
    return await _storage.setString(AppDataKeys.ownerId.name, value);
  }

  Future<void> setFootNote(String value) async {
    return await _storage.setString(AppDataKeys.footNote.name, value);
  }

  Future<void> setIsBillAutoPrint(bool value) async {
    return await _storage.setBool(AppDataKeys.isBillAutoPrint.name, value);
  }

  Future<void> setAvatar(String svgData) async {
    await _storage.setString(AppDataKeys.avatarSvg.name, svgData);
  }

  Future<void> setValues(AppDataModel values) async {
    await _storage.setString(AppDataKeys.outletId.name, values.outletId);
    await _storage.setString(AppDataKeys.ownerId.name, values.ownerId);
    await _storage.setString(AppDataKeys.footNote.name, values.footNote);
    await _storage.setBool(
        AppDataKeys.isBillAutoPrint.name, values.isBillAutoPrint);
  }

  Future<String> get outletId async {
    return await _storage.getString(AppDataKeys.outletId.name) ?? "";
  }

  Future<String> get ownerId async {
    return await _storage.getString(AppDataKeys.ownerId.name) ?? "";
  }

  Future<String> get footNote async {
    return await _storage.getString(AppDataKeys.footNote.name) ?? "";
  }

  Future<String> get isBillAutoPrint async {
    return await _storage.getString(AppDataKeys.isBillAutoPrint.name) ?? "";
  }

  Future<String?> get avatarSvg async {
    return await _storage.getString(AppDataKeys.avatarSvg.name);
  }

  Future<AppDataModel> get values async {
    final outletId = await _storage.getString(AppDataKeys.outletId.name) ?? "";
    final ownerId = await _storage.getString(AppDataKeys.ownerId.name) ?? "";
    final footNote = await _storage.getString(AppDataKeys.footNote.name) ?? "";
    final isBillAutoPrint =
        await _storage.getBool(AppDataKeys.isBillAutoPrint.name) ?? false;
    final avatarSvg =
        await _storage.getString(AppDataKeys.avatarSvg.name) ?? "";

    return AppDataModel(
      footNote: footNote,
      isBillAutoPrint: isBillAutoPrint,
      outletId: outletId,
      ownerId: ownerId,
      avatarSvg: avatarSvg,
    );
  }
}
