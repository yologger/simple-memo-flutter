import 'package:flutter/material.dart';
import 'package:simplememo/src/core/Bloc/MemosBloc.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _buildBody(context));
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Edit Screen"),
      leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.done, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }

  Widget _buildBody(BuildContext) {
    return StreamBuilder<List<MemoEntity>>(
      stream: memosBloc.stream,
      initialData: [],
      builder: (context, snapshot) {
        return ReorderableListView(
            onReorder: _onReorder,
            scrollDirection: Axis.vertical,
            children: snapshot.data.map((memo) {
              return ListTile(
                key: ValueKey(memo.id.toString()),
                title: Text("${memo.title}"),
                trailing: Icon(Icons.menu),
              );
            }).toList());
      },
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    memosBloc.reorderMemo(oldIndex, newIndex);
  }
}
