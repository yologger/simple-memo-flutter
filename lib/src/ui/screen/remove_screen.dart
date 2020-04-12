import 'package:flutter/material.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'detail_screen.dart';
import 'create_screen.dart';
import 'package:simplememo/src/core/Bloc/MemoBloc.dart';

class RemoveScreen extends StatefulWidget {
  @override
  _RemoveScreenState createState() => _RemoveScreenState();
}

class _RemoveScreenState extends State<RemoveScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        floatingActionButton: _buildFAB(context),
        body: _buildBody(context)
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Remove Screen")
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateScreen()));
      },
    );
  }

  Widget _buildBody(BuildContext context) {
//    return StreamBuilder<List<MemoEntity>>(
//        stream: memosBloc.stream,
//        initialData: [],
//        builder: (context, snapshot) {
//          return ListView.separated(
//              itemBuilder: (context, index) {
//                return ListTile(
//                  title: Text("${snapshot.data[index].title}"),
//                  trailing: IconButton(
//                    icon: Icon(Icons.close),
//                    onPressed: () {
//                      memosBloc.removeMemo(snapshot.data[index].id);
//                    },
//                  ),
//                );
//              },
//              separatorBuilder: (context, index) => const Divider(),
//              itemCount: snapshot.data.length);
//        });
  }
}
