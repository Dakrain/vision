import 'package:flutter_base_project/data/models/auth/user.dart';

abstract class AuthenticationRepository {
  Future<User> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logOut();
}
