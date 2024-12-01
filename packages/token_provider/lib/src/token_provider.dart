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
    final refreshToken = await _storage.read(key: 'auth_refresh_token');
    final refreshExpiry = await _storage.read(key: 'refresh_token_expiry');

    if (refreshExpiry != null &&
        DateTime.now().millisecondsSinceEpoch > int.parse(refreshExpiry)) {
      await clearAuthRefreshToken();
      return null;
    }

    return refreshToken;
  }

  Future<void> setAuthRefreshToken(
      String token, int refreshTokenExpireIn) async {
    await _storage.write(key: 'auth_refresh_token', value: token);
    final expiryTimestamp =
        DateTime.now().millisecondsSinceEpoch + (refreshTokenExpireIn * 1000);
    await _storage.write(
        key: 'refresh_token_expiry', value: expiryTimestamp.toString());
  }

  Future<void> clearAuthToken() async {
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'token_expiry');
  }

  Future<void> clearAuthRefreshToken() async {
    await _storage.delete(key: 'auth_refresh_token');
    await _storage.delete(key: 'refresh_token_expiry');
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
