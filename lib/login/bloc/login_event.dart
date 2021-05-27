abstract class LoginEvent {}

class StartEvent extends LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String phoneNumber;
  final String password;

  LoginButtonPressed(this.phoneNumber, this.password);
}
