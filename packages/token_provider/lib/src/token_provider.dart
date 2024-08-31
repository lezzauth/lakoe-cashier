import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenProvider {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String?> getAuthToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<void> setAuthToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  Future<void> clearAuthToken() async {
    await _storage.delete(key: 'auth_token');
  }

  Future<String?> getCashierToken() async {
    return await _storage.read(key: 'cashier_token');
  }

  Future<void> setCashierToken(String token) async {
    await _storage.write(key: 'cashier_token', value: token);
  }

  Future<void> clearCashierToken() async {
    await _storage.delete(key: 'cashier_token');
  }

  Future<Map<String, String>> allValues() async {
    return await _storage.readAll();
  }
}
