import 'package:exo1/domain/user.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => UserListItem(user: users[index]),
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
