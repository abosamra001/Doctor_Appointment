import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenStorage {
  static final _storage = const FlutterSecureStorage();

  static Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  static Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: 'token');
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  static Future<bool> hasValidToken() async {
    try {
      final token = await getToken();

      if (token == null || token.isEmpty) return false;

      if (JwtDecoder.isExpired(token)) {
        await deleteToken();
        return false;
      }

      return true;
    } catch (e) {
      await deleteToken();
      return false;
    }
  }
}
