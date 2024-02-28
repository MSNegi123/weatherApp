abstract class AuthState {}

class InitialAuthState extends AuthState {}

class AuthenticatedState extends AuthState {
  final String displayName;

  AuthenticatedState(this.displayName);
}

class UnauthenticatedState extends AuthState {}