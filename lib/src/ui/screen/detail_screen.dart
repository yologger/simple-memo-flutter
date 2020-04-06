import 'package:flutter/material.dart';
import 'package:simplememo/src/core/Bloc/MemosBloc.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';

class DetailScreen extends StatefulWidget {
  final MemoEntity memo;

  const DetailScreen(this.memo, {Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.memo.title;
    contentController.text = widget.memo.content;
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
      appBar: _appBar(context),
      body: _body(context),
      floatingActionButton: _FAB(context),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              int id = widget.memo.id;
              String title = titleController.text;
              String content = contentController.text;
              memosBloc.updateMemo(id, title, content);
              Navigator.of(context).pop();
            })
      ],
      title: Text("${widget.memo.title}"),
    );
  }

  Widget _body(BuildContext context) {
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

  Widget _FAB(BuildContext context) {
    return StreamBuilder<List<MemoEntity>>(
        stream: memosBloc.stream,
        initialData: [],
        builder: (context, snapshot) {
          bool isBookMarked = widget.memo.isBookMarked;

          return FloatingActionButton(
            // child: Icon(Icons.favorite_border)
            child: isBookMarked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: () {
              int id = widget.memo.id;
              memosBloc.toggleBookmark(id);
            },
          );
        });
  }
}
