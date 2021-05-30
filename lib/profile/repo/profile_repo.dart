import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  profile(String token) async {
    var url = 'http://3.126.221.243:8080/api/v1/user/profile';
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(
      uri,
      headers: {
        "Accept": "application/json",
        "Accept-Language": "en",
      },
    );

    if (response.statusCode == 200) {
      print('Test My Profile Response');
      print(response.body);
      final data = json.decode(response.body);
      return data;
    } else {
      var error = json.decode(response.body)["errors"][0]["message"];
      print(error);
      return "${error}";
    }
  }
}
