import 'package:flutter/material.dart';

class SecretScreen extends StatefulWidget {
  SecretScreen({Key key}) : super(key: key);

  @override
  _SecretScreenState createState() => _SecretScreenState();
}

class _SecretScreenState extends State<SecretScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Center(
      child: Text("THIS IS SECRET SCREEN."),
    );
  }
}