import 'package:bloc/src/models/models.dart';
import 'package:bloc/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

export 'users_provider.dart';

class UsersBloc {
  final _repository = Repository();
  final _users = BehaviorSubject<List<User>>();

  Stream<List<User>> get users => _users.stream;

  fetchUsers() async {
    final users = await _repository.fetchUsers();
    _users.sink.add(users);
  }

  dispose() {
    _users.close();
  }
}
