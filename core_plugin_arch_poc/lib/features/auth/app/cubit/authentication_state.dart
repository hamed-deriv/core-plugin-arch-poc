part of 'authentication_cubit.dart';

sealed class AuthenticationState {}

final class AuthenticationLoggedOut extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationLoggedIn extends AuthenticationState {
  AuthenticationLoggedIn(this.authorizeEntity);

  final AuthorizeEntity authorizeEntity;
}

final class AuthenticationError extends AuthenticationState {
  AuthenticationError(this.error);

  final String error;
}
