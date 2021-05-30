abstract class LoginState {
  const LoginState();
}

class LoginInititState extends LoginState {}

class LoginLoadingState extends LoginState {}

class UserLoginSucessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState(this.message);
}
