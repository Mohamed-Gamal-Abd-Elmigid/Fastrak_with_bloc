import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String token;
  String phone;
  String email;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      token = preferences.getString("token");
      phone = preferences.getString("phone");
      email = preferences.getString("email");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hi',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            '${email}',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            '${phone}',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
