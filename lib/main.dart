import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/Home.dart';
import 'package:test_bloc/login/UI/login_view.dart';
import 'package:flutter/material.dart';
import 'package:test_bloc/login/bloc/login_block.dart';
import 'package:test_bloc/login/bloc/login_state.dart';
import 'package:test_bloc/login/repo/login_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            LoginInititState(),
            LoginRepo(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        routes: {
          '/': (context) => LoginView(),
          '/home': (context) => Home(),
        },
      ),
    );
  }
}
