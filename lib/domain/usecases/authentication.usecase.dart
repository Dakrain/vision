import '../repositories/repositories.dart';

class AuthenticationUseCase {
  final AuthenticationRepository repository;

  AuthenticationUseCase({required this.repository});

  Future<bool> signIn(String email, String password) async {
    throw UnimplementedError();
  }

  Future<bool> signOut() async {
    throw UnimplementedError();
  }
}
