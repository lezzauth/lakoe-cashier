import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenProvider {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<String?> getAuthToken() async {
    final token = await _storage.read(key: 'auth_token');
    final expiry = await _storage.read(key: 'token_expiry');

    if (expiry != null &&
        DateTime.now().millisecondsSinceEpoch > int.parse(expiry)) {
      await clearAuthToken();
      return null;
    }

    return token;
  }

  Future<void> setAuthToken(String token, int tokenExpireIn) async {
    await _storage.write(key: 'auth_token', value: token);
    final expiryTimestamp =
        DateTime.now().millisecondsSinceEpoch + (tokenExpireIn * 1000);
    await _storage.write(
        key: 'token_expiry', value: expiryTimestamp.toString());
  }

  Future<String?> getAuthRefreshToken() async {
    return await _storage.read(key: 'auth_refresh_token');
  }

  Future<void> setAuthRefreshToken(String token) async {
    await _storage.write(key: 'auth_refresh_token', value: token);
  }

  Future<void> clearAuthToken() async {
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'token_expiry');
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

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
