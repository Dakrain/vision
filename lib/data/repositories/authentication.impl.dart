import 'package:flutter_base_project/data/models/auth/user.dart';
import 'package:flutter_base_project/data/services/authentication.service.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../requests/requests.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationImpl implements AuthenticationRepository {
  final AuthenticationService _service;

  AuthenticationImpl({required AuthenticationService service})
      : _service = service;

  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final request = LoginRequest(email: email, password: password);
      final result = await _service.login(request);

      if (result.isSuccess) {
        return result.data!;
      } else {
        throw result.error ?? Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> register(String email, String password) {
    throw UnimplementedError();
  }
}
