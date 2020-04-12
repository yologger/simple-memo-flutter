import 'package:flutter/material.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:simplememo/src/core/Service/DBService.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          // DBHelper().createMemo(memo);
        }
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("THIS IS TEST PAGE"),
            RaisedButton(
              child: Text("getAllMemos"),
              onPressed: () {
                // DBHelper().getAllMemos();
              },
            )
          ],
        )
      )
    );
  }
}
