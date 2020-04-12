import 'package:flutter/material.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'detail_screen.dart';
import 'create_screen.dart';
import 'package:simplememo/src/core/Bloc/MemoBloc.dart';

class TrashScreen extends StatefulWidget {
  @override
  _TrashScreenState createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context)
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
        title: Text("Remove Screen"),
        actions: <Widget>[
          FlatButton(
            child: Text("Remove All"),
            textColor: Colors.white,
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            onPressed: () {},
          ),
        ],
    );
  }


  Widget _buildBody(BuildContext context) {
//    return StreamBuilder<List<MemoEntity>>(
//        stream: memosBloc.deletedStream,
//        initialData: [],
//        builder: (context, snapshot) {
//          return ListView.separated(
//              itemBuilder: (context, index) {
//                return ListTile(
//                  title: Text("${snapshot.data[index].title}"),
//                  trailing: Row(
//                    mainAxisSize: MainAxisSize.min,
//                    children: <Widget>[
//                      IconButton(
//                        icon: Icon(Icons.close),
//                        onPressed: () {
//                          memosBloc.removeMemo(snapshot.data[index].id);
//                        },
//                      ),
//                      IconButton(
//                        icon: Icon(Icons.restore_from_trash),
//                        onPressed: () {
//                          memosBloc.removeMemo(snapshot.data[index].id);
//                        },
//                      ),
//                    ],
//                  )
//                );
//              },
//              separatorBuilder: (context, index) => const Divider(),
//              itemCount: snapshot.data.length);
//        });
  }
}
