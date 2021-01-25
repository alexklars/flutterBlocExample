import 'dart:async';
import 'dart:convert';

import 'package:bloc/src/models/models.dart';
import 'package:http/http.dart' show Client;

final _rootUrl = 'https://jsonplaceholder.typicode.com';

class UsersApiProvider {
  Client client = Client();

  Future<List<User>> fetchUsers() async {
    final response = await client.get('$_rootUrl/users');
    List users = json.decode(response.body);

    return users.map<User>((json) => User.fromJson(json)).toList();
  }
}
