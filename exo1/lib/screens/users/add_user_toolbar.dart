import 'package:flutter/material.dart';

class AddUserToolbar extends StatefulWidget {
  const AddUserToolbar({Key? key, this.callback});
  final callback;

  @override
  _AddUserToolbarState createState() => _AddUserToolbarState();
}

class _AddUserToolbarState extends State<AddUserToolbar> {
  final TextEditingController _controller = TextEditingController();
  var userName = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _controller,
              onChanged: (String textValue) {
                setState(() {
                  userName = textValue;
                });
              },
            ),
          ),
          ElevatedButton.icon(
            onPressed: userName.length != 0
                ? () {
                    widget.callback(userName);
                    setState(() {
                      userName = '';
                    });
                    _controller.clear();
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
