import 'dart:async';

import 'package:bloc/src/models/models.dart';

import 'users_api_provider.dart';

class Repository {
  UsersApiProvider _usersApiProvider = UsersApiProvider();

  Future<List<User>> fetchUsers() {
    return _usersApiProvider.fetchUsers();
  }
}
