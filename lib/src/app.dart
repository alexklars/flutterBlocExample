import 'package:bloc/src/themes/app_theme.dart';
import 'package:bloc/src/ui/screens/screens.dart';
import 'package:flutter/material.dart';

import 'blocs/blocs.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return UsersProvider(
      child: MaterialApp(
        theme: AppTheme.themeDark,
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          final usersBloc = UsersProvider.of(context);

          usersBloc.fetchUsers();

          return UsersList();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          final userId = int.parse(settings.name.replaceFirst('/', ''));
          return UserDetail(
            userId: userId,
          );
        },
      );
    }
  }
}
