import 'package:bloc/src/models/models.dart';
import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  final User user;

  UserListTile({this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/${user.id}');
      },
      leading: ExcludeSemantics(
        child: CircleAvatar(
          child: Text('${this.user.name.substring(0, 2)}'),
          backgroundColor: Colors.grey[300],
        ),
      ),
      title: Text(user.name),
      subtitle: Text(user.company.name),
    );
  }
}
