import 'package:exo1/domain/user.dart';
import 'package:exo1/domain/user_repository.dart';
import 'package:exo1/screens/users/user_list_widget.dart';
import 'package:flutter/material.dart';

import 'add_user_toolbar.dart';

class UsersScreen extends StatelessWidget {
  final _repository = UserRepository.get();

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
              builder: (context, snapshot) {
                final users = snapshot.data;
                return users != null
                    ? UserListWidget(
                        users: users,
                        onUserDismissed: (user) => _repository.deleteUser(user),
                      )
                    : Center(child: CircularProgressIndicator.adaptive());
              },
            ),
          ),
          AddUserToolbar(
            onUserSubmitted: (user) => _repository.addUser(user),
          ),
        ],
      ),
    );
  }
}
