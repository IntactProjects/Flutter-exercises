import 'package:exo1/domain/user_repository.dart';
import 'package:exo1/screens/users/user_list_widget.dart';
import 'package:flutter/material.dart';

import '../../domain/user.dart';
import 'add_user_toolbar.dart';

class UsersScreen extends StatelessWidget {
  final _repository = UserRepository.get();

  void addUser(String username) {
    _repository.addUser(new User(name: username));
  }

  void removeUser(User user) {
    _repository.deleteUser(user);
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
              child: StreamBuilder<List<User>>(
                  stream: _repository.observeUsers(),
                  builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error loading users");
                    } else {
                      final users = snapshot.data;
                      if (users != null && users.isNotEmpty) {
                        return UserListWidget(users: users, deleteCallback: removeUser);
                      } else {
                        return Text("No users on the list");
                      }
                    }
                  })),
          AddUserToolbar(addCallback: addUser),
        ],
      ),
    );
  }
}
