import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';
import 'package:simplememo/src/core/Bloc/EditBloc.dart';
import 'package:simplememo/src/core/Bloc/EditEvent.dart';
import 'package:simplememo/src/core/Bloc/EditState.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  EditBloc _editBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editBloc = BlocProvider.of<EditBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Edit"),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<EditBloc, EditState>(
      builder: (context, state) {
        if (state is AllMemosUnloaded) {
          return Center(child: Text("Loading..."));
        } else if (state is LoadAllMemosSuccess) {
          return ReorderableListView(
            onReorder: (int oldIndex, int newIndex) {
              print("OLDINDEX: ${oldIndex}");
              print("NEWINDEX: ${newIndex}");
              _editBloc
                  .add(SwapMemos(state.memos[oldIndex], state.memos[newIndex]));
            },
            children: List.generate(state.memos.length, (index) {
              return ListTile(
                title: Text("${state.memos[index].title}"),
                key: UniqueKey(),
                trailing: Icon(Icons.reorder),
              );
            }),
          );
        } else {
          return Center(child: Text("Unknown Error"));
        }
      },
    );
  }


}
