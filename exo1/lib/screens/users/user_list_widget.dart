import 'package:exo1/domain/user.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({Key? key, required this.users, this.callback})
      : super(key: key);

  final List<User> users;
  final callback;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            callback(user);
          },
          background: Container(
            color: Colors.red, 
            ),
          child: UserListItem(user: user),
        );
      },
    );
  }
}

class UserListItem extends StatelessWidget {
  const UserListItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(user.name),
    );
  }
}
