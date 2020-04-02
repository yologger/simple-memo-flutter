import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context)
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.done, color: Colors.white),
            onPressed: () {
              // Save Data
              Navigator.of(context).pop();
            },
        )
      ],
      title: Text("Edit screen"),
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
