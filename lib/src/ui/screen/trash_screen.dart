import 'package:flutter/material.dart';

class TrashScreen extends StatefulWidget {
  @override
  _TrashScreenState createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TrashScreen"),),
      body: Center(
        child: Text("TrashScreen"),
      )
    );
  }
}
