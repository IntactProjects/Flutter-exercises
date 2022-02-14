import 'package:flutter/material.dart';

import '../../domain/user_repository.dart';

class AddUserToolbar extends StatefulWidget {

  const AddUserToolbar({Key? key, required this.addCallback}) : super(key: key);

  final Function(String) addCallback;

  @override
  State<StatefulWidget> createState() => _AddUserToolbarState();
}

class _AddUserToolbarState extends State<AddUserToolbar> {
  final userFormController = TextEditingController();
  bool buttonEnabled = false;

  @override
  void initState() {
    super.initState();

    userFormController.addListener(() {
      setState(() {
        buttonEnabled = userFormController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    userFormController.dispose();
    super.dispose();
  }

  void addCurrentUserValue() {
    widget.addCallback(userFormController.text);
    userFormController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(child: TextField(
            controller: userFormController,
            onSubmitted: (value) {
              addCurrentUserValue();
            }
          )),
          ElevatedButton.icon(
            onPressed: buttonEnabled ? () { addCurrentUserValue(); } : null,
            icon: Icon(Icons.person_add),
            label: Text("Add person"),
          )
        ],
      ),
    );
  }
}
