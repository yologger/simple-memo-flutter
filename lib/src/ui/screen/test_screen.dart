import 'package:flutter/material.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:simplememo/src/core/Service/DBService.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  int count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count = count + 1;
          });
        }
      ),
      body: Wrapper(count),
    );
  }
}

class Wrapper extends StatelessWidget {

  final int count;

  const Wrapper(this.count);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${count}")
    );
  }
}
