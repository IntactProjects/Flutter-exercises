import 'package:exo1/domain/user_repository.dart';
import 'package:exo1/screens/users/user_list_widget.dart';
import 'package:flutter/material.dart';

import 'add_user_toolbar.dart';

class UsersScreen extends StatelessWidget {
  final _repository = UserRepository.get();

  @override
  Widget build(BuildContext context) {
    final users = _repository.getUsers();

    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Column(
        children: [
          Flexible(
            child: UserListWidget(users: users),
          ),
          AddUserToolbar(),
        ],
      ),
    );
  }
}
