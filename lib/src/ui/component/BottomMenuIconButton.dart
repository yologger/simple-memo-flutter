import 'package:flutter/material.dart';


class BottomMenuIconButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onPressed;

  const BottomMenuIconButton({
    Key key, 
    @required this.icon, 
    @required this.text, 
    @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(4.0), child: icon),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}
