import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  login(String phoneNumber, String password) async {
    bool isLogIn;

    var url = 'http://3.126.221.243:8080/api/v1/user/auth/regular/login';
    Uri uri = Uri.parse(url);
    http.Response response = await http.post(
      uri,
      headers: {
        "Accept": "application/json",
        "Accept-Language": "en",
      },
      body: {
        "password": password == null ? null : password,
        "phone": phoneNumber == null ? null : phoneNumber,
      },
    );

    if (response.statusCode == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = json.decode(response.body)["data"]["access_token"];
      var email = json.decode(response.body)["data"]["email"];
      preferences.setString("token", token);
      preferences.setString("phone", phoneNumber);
      preferences.setString("email", email);
      print("this is My Token");

      final data = json.decode(response.body);
      return data;
    } else {
      var error = json.decode(response.body)["errors"][0]["message"];
      print(error);
      return "${error}";
    }
  }
}
