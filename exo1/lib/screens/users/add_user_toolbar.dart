import 'package:flutter/material.dart';

class AddUserToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(child: TextField()),
          ElevatedButton.icon(
            onPressed: null,
            icon: Icon(Icons.person_add),
            label: Text("Add person"),
          )
        ],
      ),
    );
  }
}
