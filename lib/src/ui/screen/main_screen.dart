import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'detail_screen.dart';
import 'create_screen.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
   super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFAB(context),
      body: _buildBody(context),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateScreen()));

//        Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => BlocProvider<MemoBloc>(
//                    create: (context) => MemoBloc(), child: CreateScreen())));
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<MemoBloc, MemoState>(builder: (context, state) {
      print("State has changed to ${state}.");
      if (state is MemosUnloaded) {
        return Center(child: Text("Loading..."));
      } else if (state is MemosLoadSuccess) {
        if (state.memos.isEmpty) {
          return Center(child: Text("No Data"));
        } else {
          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${state.memos[index].title}"),
                  trailing: state.memos[index].isBookmarked
                      ? Icon(Icons.favorite)
                      : null,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(state.memos[index])));
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.memos.length);
        }
      } else if (state is MemoCreateSuccess) {
        return Center(child: Text("CREATED"));
      } else {
        return Center(child: Text("Unknown Error"));
      }
    });
  }
}
