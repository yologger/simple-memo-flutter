import 'package:flutter/material.dart';
import 'edit_screen.dart';

class DetailScreen extends StatelessWidget {
  
  const DetailScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      floatingActionButton: _FAB(context),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon:Icon(Icons.done),
            onPressed: () {
              Navigator.of(context).pop();
            }
        )
      ],
      title: Text("Detail screen"),
    );
  }

  Widget _body(BuildContext context) {
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

  Widget _FAB(BuildContext context) {
    return FloatingActionButton(
      // child: Icon(Icons.favorite_border)
      child: Icon(Icons.favorite),
      onPressed: () {

      },
    );
  }
}