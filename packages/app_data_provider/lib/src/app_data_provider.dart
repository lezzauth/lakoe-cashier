import 'package:app_data_provider/src/models/app_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppDataKeys {
  outletId,
  ownerId,
  footNote,
  isAutoPrint,
  avatarSvg,
  logoBrand,
  colorBrand,
  flavor,
  billNumber,
  billNumberForOrder,
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

  Future<void> setBillNumber(int value) async {
    await _storage.setInt(AppDataKeys.billNumber.name, value);
  }

  Future<void> setBillNumberForOrder(String orderId, int billNumber) async {
    await _storage.setInt("billNumber_$orderId", billNumber);
  }

  Future<int> incrementBillNumberOnPrint(String orderId) async {
    int? existingBillNumber = await getBillNumberForOrder(orderId);

    if (existingBillNumber != null) {
      return existingBillNumber;
    } else {
      int currentBillNumber = await billNumber;
      int newBillNumber = currentBillNumber + 1;
      await setBillNumber(newBillNumber);
      await setBillNumberForOrder(orderId, newBillNumber);
      return newBillNumber;
    }
  }

  Future<void> setValues(AppDataModel values) async {
    await _storage.setString(AppDataKeys.outletId.name, values.outletId);
    await _storage.setString(AppDataKeys.ownerId.name, values.ownerId);
    await _storage.setString(AppDataKeys.footNote.name, values.footNote);
    await _storage.setBool(AppDataKeys.isAutoPrint.name, values.isAutoPrint);
    await _storage.setString(AppDataKeys.avatarSvg.name, values.avatarSvg);
    await _storage.setString(AppDataKeys.colorBrand.name, values.colorBrand);
    await _storage.setString(AppDataKeys.logoBrand.name, values.logoBrand);
    await _storage.setString(AppDataKeys.flavor.name, values.flavor);
    await _storage.setInt(AppDataKeys.billNumber.name, values.billNumber);
    await _storage.setInt(
        AppDataKeys.billNumberForOrder.name, values.billNumberForOrder);
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

  Future<int> get billNumber async {
    return await _storage.getInt(AppDataKeys.billNumber.name) ?? 1;
  }

  Future<int?> getBillNumberForOrder(String orderId) async {
    return _storage.getInt("billNumber_$orderId");
  }

  Future<AppDataModel> get values async {
    final outletId = await _storage.getString(AppDataKeys.outletId.name) ?? "";
    final ownerId = await _storage.getString(AppDataKeys.ownerId.name) ?? "";
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
    final billNumber = await _storage.getInt(AppDataKeys.billNumber.name) ?? 1;
    final billNumberForOrder =
        await _storage.getInt(AppDataKeys.billNumberForOrder.name) ?? 1;

    return AppDataModel(
      footNote: footNote,
      isAutoPrint: isAutoPrint,
      outletId: outletId,
      ownerId: ownerId,
      avatarSvg: avatarSvg,
      colorBrand: colorBrand,
      logoBrand: logoBrand,
      flavor: flavor,
      billNumber: billNumber,
      billNumberForOrder: billNumberForOrder,
    );
  }
}
