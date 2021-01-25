import 'package:bloc/src/blocs/blocs.dart';
import 'package:bloc/src/models/models.dart';
import 'package:bloc/src/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  Widget build(context) {
    final bloc = UsersProvider.of(context);

    return Scaffold(
      body: buildList(bloc),
    );
  }

  Widget buildList(UsersBloc bloc) {
    return StreamBuilder(
      stream: bloc.users,
      builder: (context, AsyncSnapshot<List<User>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Refresh(
          child: ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              return UserListTile(
                user: snapshot.data[index],
              );
            },
            separatorBuilder: (context, index) => CustomDivider(),
          ),
        );
      },
    );
  }
}
