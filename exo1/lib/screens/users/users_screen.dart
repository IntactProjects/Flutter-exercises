import 'package:exo1/domain/user.dart';
import 'package:exo1/domain/user_repository.dart';
import 'package:exo1/screens/users/user_list_widget.dart';
import 'package:flutter/material.dart';

import 'add_user_toolbar.dart';

class UsersScreen extends StatelessWidget {
  final _repository = UserRepository.get();

  @override
  Widget build(BuildContext context) {
    remove(User user) {
      _repository.deleteUser(user);
    }
    add(String name) {
      _repository.addUser(new User(name: name));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Column(
        children: [
          Flexible(
            child: StreamBuilder<List<User>>(
              stream: _repository.observeUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                Widget childToReturn;
                if (snapshot.error == true) {
                  childToReturn = Text("error in stream");
                } else {
                  final users = snapshot.data;
                  childToReturn = users != null
                      ? UserListWidget(users: users, callback: remove)
                      : CircularProgressIndicator();
                }
                return childToReturn;
              },
            ),
          ),
          AddUserToolbar(callback: add,),
        ],
      ),
    );
  }
}
