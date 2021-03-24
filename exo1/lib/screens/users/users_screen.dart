import 'package:exo1/domain/user.dart';
import 'package:exo1/domain/user_repository.dart';
import 'package:exo1/screens/users/user_list_widget.dart';
import 'package:flutter/material.dart';

import 'add_user_toolbar.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final _repository = UserRepository.get();

  @override
  Widget build(BuildContext context) {
    var users = _repository.getUsers();

    _repository.observeUsers().listen((event) {
      setState(() {
          users = event;
      });
    });

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
