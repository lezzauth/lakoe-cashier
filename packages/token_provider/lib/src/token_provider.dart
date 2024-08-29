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

  Future<String?> getAppToken() async {
    return await _storage.read(key: 'app_token');
  }

  Future<void> setAppToken(String token) async {
    await _storage.write(key: 'app_token', value: token);
  }

  Future<void> clearAppToken() async {
    await _storage.delete(key: 'app_token');
  }
}
