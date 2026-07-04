import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  Future<User> execute(String username, String password) {
    return _repository.signUp(username, password);
  }
}
