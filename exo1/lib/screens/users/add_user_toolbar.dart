import 'package:exo1/domain/user.dart';
import 'package:flutter/material.dart';

class AddUserToolbar extends StatefulWidget {
  AddUserToolbar({required this.onUserSubmitted});

  final ValueSetter<User> onUserSubmitted;

  @override
  _AddUserToolbarState createState() => _AddUserToolbarState();
}

class _AddUserToolbarState extends State<AddUserToolbar> {
  final controller = TextEditingController();
  VoidCallback? addAction;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: controller,
              onChanged: (textValue) {
                setState(() {
                  if (textValue.isEmpty) {
                    addAction = null;
                  } else {
                    addAction = submitUser;
                  }
                });
              },
              onSubmitted: (_) => addAction?.call(),
            ),
          ),
          ElevatedButton.icon(
            onPressed: addAction,
            icon: Icon(Icons.person_add),
            label: Text("Add person"),
          )
        ],
      ),
    );
  }

  void submitUser() {
    var user = User(name: controller.text);
    controller.text = "";
    widget.onUserSubmitted(user);
  }
}
