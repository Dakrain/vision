part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unAuthenticated() = _UnAuthenticated;
  const factory AuthenticationState.authenticated({required User user}) =
      _Authenticated;
  const factory AuthenticationState.authenticating() = _Authenticating;
}
