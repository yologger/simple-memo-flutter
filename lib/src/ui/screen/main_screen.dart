import 'package:flutter/material.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'detail_screen.dart';
import 'create_screen.dart';
import 'package:simplememo/src/core/Bloc/MemosBloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("MAIN_SCREEN INIT_STATE");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("MAIN_SCREEN DISPOSE");
  }

  @override
  Widget build(BuildContext context) {
    print("MAIN_SCREEN BUILD");
    return Scaffold(
        floatingActionButton: _buildFAB(context), body: _buildBody(context));
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
    return StreamBuilder<List<MemoEntity>>(
        stream: memosBloc.stream,
        initialData: [],
        builder: (context, snapshot) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${snapshot.data[index].title}"),
                  trailing: snapshot.data[index].isBookMarked
                      ? Icon(Icons.favorite)
                      : null,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(snapshot.data[index])));
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: snapshot.data.length);
        });
  }
}
