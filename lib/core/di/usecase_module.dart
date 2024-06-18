import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/domain/providers/storage.provider.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UsecaseModule {
  AuthenticationUseCase provideAuthenUsecase(
          AuthenticationRepository repository, StorageProvider storage) =>
      AuthenticationUseCase(repository: repository, storageProvider: storage);
}
