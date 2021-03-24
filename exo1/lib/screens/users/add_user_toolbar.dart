import 'package:exo1/domain/user.dart';
import 'package:exo1/domain/user_repository.dart';
import 'package:flutter/material.dart';

class AddUserToolbar extends StatefulWidget {
  @override
  _AddUserToolbarState createState() => _AddUserToolbarState();
}

class _AddUserToolbarState extends State<AddUserToolbar> {
  var newUser = '';
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _controller,
            onChanged: (String value) {
              setState(() {
                newUser = value;
              });
            },
          )),
          ElevatedButton.icon(
            onPressed: newUser.length != 0
                ? () {
                    UserRepository.get().addUser(new User(name: newUser));
                    _controller.clear();
                    setState(() {
                      newUser = '';
                    });
                  }
                : null,
            icon: Icon(Icons.person_add),
            label: Text("Add person"),
          )
        ],
      ),
    );
  }
}
