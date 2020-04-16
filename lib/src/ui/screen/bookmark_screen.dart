import 'package:flutter/material.dart';
import 'package:simplememo/src/ui/theme/light/color.dart';

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("bookmark"),
      ),
    );
  }
}
