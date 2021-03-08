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

  late List<User> users;

  @override
  void initState() {
    super.initState();
    users = _repository.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Column(
        children: [
          Flexible(
            child: UserListWidget(users: users),
          ),
          AddUserToolbar(onUserSubmitted: addUser),
        ],
      ),
    );
  }

  void addUser(User user) {
    _repository.addUser(user);
    setState(() {
      users = _repository.getUsers();
    });
  }
}
