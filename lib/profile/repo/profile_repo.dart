import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/profile/repo/profile_model.dart';

class ProfileRepo {
  Future<User> getProfileData(String token) async {
    var url = 'http://3.126.221.243:8080/api/v1/user/profile';
    Uri uri = Uri.parse(url);

    http.Response response = await http.get(
      uri,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer  ${token}",
        "Accept-Language": "ar",
      },
    );

    if (response.statusCode == 200) {
      print('Test My Profile Response');
      var decoded = jsonDecode(response.body);
      return User.fromJson(
        decoded["data"],
      );
    } else {
      var error = json.decode(response.body);
      print(error);
    }
  }
}
