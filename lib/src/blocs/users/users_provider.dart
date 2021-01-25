import 'package:flutter/material.dart';

import '../blocs.dart';

class UsersProvider extends InheritedWidget {
  final UsersBloc bloc;

  UsersProvider({Key key, Widget child})
      : bloc = UsersBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static UsersBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UsersProvider>().bloc;
  }
}
