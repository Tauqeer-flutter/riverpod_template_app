import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  String authTokenKey = 'auth_token';

  Future<void> saveAuthToken(String token) async {
    await _storage.write(key: authTokenKey, value: token);
  }

  Future<String?> getAuthToken() async {
    return await _storage.read(key: authTokenKey);
  }

  Future<void> deleteAuthToken() async {
    await _storage.delete(key: authTokenKey);
  }

  Future<bool> isLoggedIn() async {
    final token = await getAuthToken();
    return token != null && token.isNotEmpty;
  }
}
