import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);
}

class MockAuthDataSource implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String username, String password) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => UserModel(id: '1', username: username),
    );
  }
}
