import 'package:flutter_base_project/domain/entities/entities.dart';

abstract class AuthenticationRepository {
  Future<User> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logOut();
}
