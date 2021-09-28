import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/BookmarkBloc.dart';
import 'package:simplememo/src/core/Bloc/BookmarkEvent.dart';
import 'package:simplememo/src/ui/theme/light/color.dart';
import 'create_screen.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';

import 'detail_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  MemoBloc _memoBloc;

  @override
  void initState() {
    super.initState();
    _memoBloc = BlocProvider.of<MemoBloc>(context);
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
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<MemoBloc, MemoState>(builder: (context, state) {
      if (state is MemosUnloaded) {
        return Center(child: Text("Loading..."));
      } else if (state is LoadMemosSuccess) {
        if (state.memos.isEmpty) {
          return Center(child: Text("No Data"));
        } else {
          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: ValueKey(state.memos[index].id),
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, AppColor.secondary],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) async {
                      await _memoBloc.add(DeleteMemo(state.memos[index]));
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content:
                              Text("${state.memos[index].title} dismissed")));
                    },
                    child: ListTile(
                      title: Text("${state.memos[index].title}"),
                      trailing: state.memos[index].isBookmarked
                          ? Icon(Icons.star, color: AppColor.secondary)
                          : null,
                      onTap: () {
                        MemoBloc memoBloc = BlocProvider.of<MemoBloc>(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BlocProvider<BookmarkBloc>(
                                      create: (BuildContext context) =>
                                          BookmarkBloc(memoBloc: memoBloc)
                                            ..add(LoadBookmark(
                                                state.memos[index])),
                                      child: DetailScreen(state.memos[index]),
                                    )));
                      },
                    ));
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.memos.length);
        }
      } else if (state is CreateMemoSuccess) {
        return Center(child: Text("CREATED"));
      } else {
        return Center(child: Text("Unknown Error"));
      }
    });
  }
}
