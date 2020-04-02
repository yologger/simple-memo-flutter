import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("CREATE SCREEN"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.done, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
            decoration: InputDecoration(
                hintText: 'Title',
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0))),
        Expanded(
          child: Container(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: InputBorder.none,
              hintText: 'Content',
            ),
          )),
        ),
      ],
    );
  }
}
