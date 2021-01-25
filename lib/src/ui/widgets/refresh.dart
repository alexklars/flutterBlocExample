import 'package:bloc/src/blocs/blocs.dart';
import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({this.child});

  Widget build(context) {
    final bloc = UsersProvider.of(context);

    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await bloc.fetchUsers();
      },
    );
  }
}
