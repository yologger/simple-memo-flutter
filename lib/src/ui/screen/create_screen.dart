import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  MemoBloc _memoBloc;

  @override
  void initState() {
    super.initState();
    _memoBloc = BlocProvider.of<MemoBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

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
        Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.done, color: Colors.white),
              onPressed: () async {
                String title = titleController.text;
                String content = contentController.text;
                MemoEntity new_memo = MemoEntity(title: title, content: content);
                await _memoBloc.add(CreateMemo(new_memo));
                Navigator.of(context).pop();
              },
            );
          },
        )
      ],
    );;
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
            controller: titleController,
            decoration: InputDecoration(
                hintText: 'Title',
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0))),
        Expanded(
          child: Container(
              child: TextField(
            controller: contentController,
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


