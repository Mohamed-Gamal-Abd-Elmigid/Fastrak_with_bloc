import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/login/bloc/login_event.dart';
import 'package:test_bloc/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/login/repo/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo repo;
  LoginBloc(LoginState LoginInititState, this.repo) : super(LoginInititState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    var pref = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield LoginInititState();
    } else if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      var data = await repo.login(event.phoneNumber, event.password);
      print(data);
      yield UserLoginSucessState();
    } else
      yield LoginErrorState("Login Error");
  }
}
