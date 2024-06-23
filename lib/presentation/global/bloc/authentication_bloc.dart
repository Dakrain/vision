import 'package:flutter_base_project/domain/usecases/authentication.usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base_project/domain/entities/auth/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@singleton
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationUseCase useCase;

  AuthenticationBloc(this.useCase) : super(const AuthenticationState.unAuthenticated()) {
    on<AuthenticationEvent>((event, emit) {});
    on<_AuthenticatedEvent>((event, emit) => emit(
          AuthenticationState.authenticated(user: event.user),
        ));

    on<_LogOutEvent>((event, emit) {
      useCase.logOut();

      emit(const AuthenticationState.unAuthenticated());
    });
  }
}
