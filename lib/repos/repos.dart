import 'dart:convert';

import 'package:flutterblocsimplest/models/user_model.dart';
import 'package:http/http.dart';

class UserRepository {
  String endPoint = 'https://reqres.in/api/users?page=2';
  Future<List<UserModel>> getusers() async {
    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];

      List<UserModel> userlist = [];
      for (var user in result) {
        UserModel userone = UserModel.fromJson(user);
        userlist.add(userone);
      }

      return userlist;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
