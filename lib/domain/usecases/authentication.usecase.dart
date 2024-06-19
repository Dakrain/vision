import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/domain/entities/api_error.dart';
import 'package:flutter_base_project/domain/entities/auth/user.dart';
import 'package:flutter_base_project/domain/providers/storage.provider.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

@injectable
class AuthenticationUseCase {
  final AuthenticationRepository repository;
  final StorageProvider storageProvider;

  AuthenticationUseCase({
    required this.repository,
    required this.storageProvider,
  });

  Future<Either<ApiError, User>> loginIn(String email, String password) async {
    try {
      final result = await repository.login(email, password);
      storageProvider.set('token', result.accessToken ?? '');

      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<void> logOut() async {
    storageProvider.delete('token');
  }
}
