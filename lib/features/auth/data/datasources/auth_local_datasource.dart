import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocalDataSource {
  static const _usernameKey = 'stored_username';
  static const _passwordKey = 'stored_password';
  final _storage = const FlutterSecureStorage();

  Future<bool> hasCredentials() async {
    final username = await _storage.containsKey(key: _usernameKey);
    final password = await _storage.containsKey(key: _passwordKey);
    return username && password;
  }

  Future<Map<String, String>?> getCredentials() async {
    final username = await _storage.read(key: _usernameKey);
    final password = await _storage.read(key: _passwordKey);
    if (username == null || password == null) return null;
    return {'username': username, 'password': password};
  }

  Future<void> saveCredentials(String username, String password) async {
    await _storage.write(key: _usernameKey, value: username);
    await _storage.write(key: _passwordKey, value: password);
  }

  Future<void> clearCredentials() async {
    await _storage.delete(key: _usernameKey);
    await _storage.delete(key: _passwordKey);
  }
}
