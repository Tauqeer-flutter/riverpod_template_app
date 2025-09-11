import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();

  // Auth token key
  String authTokenKey = 'auth_token';

  // Save auth token
  Future<void> saveAuthToken(String token) async {
    await _storage.write(key: authTokenKey, value: token);
  }

  // Get auth token
  Future<String?> getAuthToken() async {
    return await _storage.read(key: authTokenKey);
  }

  // Delete auth token
  Future<void> deleteAuthToken() async {
    await _storage.delete(key: authTokenKey);
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await getAuthToken();
    return token != null && token.isNotEmpty;
  }
}
