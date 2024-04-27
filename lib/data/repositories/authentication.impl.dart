import 'package:flutter_base_project/domain/domain.dart';

class AuthenticationImpl implements AuthenticationRepository {
  @override
  bool isSignedIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(String email, String password) {
    throw UnimplementedError();
  }
}
