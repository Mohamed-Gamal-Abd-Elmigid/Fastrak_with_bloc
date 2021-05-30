import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_bloc/login/bloc/login_block.dart';
import 'package:test_bloc/login/bloc/login_event.dart';
import 'package:test_bloc/login/bloc/login_state.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  LoginBloc loginBloc;

  final msg = BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      if (state is LoginErrorState) {
        return Text(state.message);
      } else if (state is LoginLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container(
          color: Colors.black,
        );
      }
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is UserLoginSucessState) {
            toast();
            Navigator.pushNamed(context, '/home');
          }
        },
        child: Center(
          child: _loginForm(),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _usernameField(),
            _passwordField(),
            SizedBox(
              height: 30,
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      controller: phoneNumber,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: "Phone Number",
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Requird";
        } else if (value.length < 13) {
          return "Not Valid Number";
        }
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.security),
        hintText: "Password",
      ),
      validator: (value) {
        if (value.isEmpty)
          return "Required";
        else if (value.length < 6) {
          return "week password";
        }
      },
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          loginBloc.add(
            LoginButtonPressed(
              phoneNumber.text,
              password.text,
            ),
          );
        } else {
          print("Error In Format");
        }
      },
      child: Text('Login'),
    );
  }

  toast() {
    Fluttertoast.showToast(
      msg: "Sucess",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
