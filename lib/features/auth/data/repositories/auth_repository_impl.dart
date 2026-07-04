import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._localDataSource);

  @override
  Future<User> login(String username, String password) async {
    final stored = await _localDataSource.getCredentials();
    if (stored == null) {
      throw Exception('No account found. Please sign up first.');
    }
    if (stored['username'] != username || stored['password'] != password) {
      throw Exception('Invalid username or password.');
    }
    return User(id: '1', username: username);
  }

  @override
  Future<User> signUp(String username, String password) async {
    await _localDataSource.saveCredentials(username, password);
    return User(id: '1', username: username);
  }

  @override
  Future<bool> hasCredentials() {
    return _localDataSource.hasCredentials();
  }
}
