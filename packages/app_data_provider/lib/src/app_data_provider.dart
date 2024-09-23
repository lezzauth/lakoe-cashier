import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppDataProvider {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String?> getOutletId() async {
    return await _storage.read(key: 'outlet_id');
  }

  Future<void> setOutletId(String token) async {
    await _storage.write(key: 'outlet_id', value: token);
  }

  Future<void> clearOutletId() async {
    await _storage.delete(key: 'outlet_id');
  }

  Future<String?> getOwnerId() async {
    return await _storage.read(key: 'owner_id');
  }

  Future<void> setOwnerId(String token) async {
    await _storage.write(key: 'owner_id', value: token);
  }

  Future<void> clearOwnerId() async {
    await _storage.delete(key: 'owner_id');
  }

  Future<Map<String, String>> allValues() async {
    return await _storage.readAll();
  }

  Future<void> clear() async {
    await clearOutletId();
    await clearOwnerId();
  }
}
