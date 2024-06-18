part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.authenticated(User user) =
      _AuthenticatedEvent;
  const factory AuthenticationEvent.authenticateStarted() =
      _AuthenticateStartedEvent;
  const factory AuthenticationEvent.logOut() = _LogOutEvent;
}
