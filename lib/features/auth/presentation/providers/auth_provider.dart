import 'package:flutter/foundation.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';

enum AuthStatus { idle, loading, success, failure }

class AuthProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;

  AuthProvider(this._loginUseCase, this._signUpUseCase);

  AuthStatus _status = AuthStatus.idle;
  User? _user;
  String? _error;

  AuthStatus get status => _status;
  User? get user => _user;
  String? get error => _error;

  Future<void> login(String username, String password) async {
    _status = AuthStatus.loading;
    _error = null;
    notifyListeners();

    try {
      _user = await _loginUseCase.execute(username, password);
      _status = AuthStatus.success;
    } catch (e) {
      _error = e.toString();
      _status = AuthStatus.failure;
    }
    notifyListeners();
  }

  Future<void> signUp(String username, String password) async {
    _status = AuthStatus.loading;
    _error = null;
    notifyListeners();

    try {
      _user = await _signUpUseCase.execute(username, password);
      _status = AuthStatus.success;
    } catch (e) {
      _error = e.toString();
      _status = AuthStatus.failure;
    }
    notifyListeners();
  }

  void reset() {
    _status = AuthStatus.idle;
    _user = null;
    _error = null;
    notifyListeners();
  }
}
