import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';
import 'package:simplememo/src/core/Bloc/BookmarkBloc.dart';
import 'package:simplememo/src/core/Bloc/BookmarkEvent.dart';
import 'package:simplememo/src/core/Bloc/MemoBloc.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:simplememo/src/ui/theme/light/color.dart';

import 'detail_screen.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  List<String> list;
  List<String> selectedList;

  @override
  void initState() {
    super.initState();
    list = ["Ronaldo", "Kane", "Benzema", "Bale", "Son", "Marcelo", "Ramos"];
    selectedList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ReorderableListView(
          onReorder: _onReorder,
          scrollDirection: Axis.vertical,
          children: List.generate(
            list.length,
                (index) {
              return ListItem(
                list[index],
                Key(list[index]),
              );
//              return ListTile(
//                key: ValueKey(list[index]),
//                title: Text("${list[index]}"),
//              );
            },
          )),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(
          () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = list.removeAt(oldIndex);
        list.insert(newIndex, item);
      },
    );
  }

  Widget _buildAppBar() {
    return AppBar(
        title: Text("Edit Screen"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {},
          ),
        ],
    );
  }
}

class ListItem extends StatefulWidget {
  String title;
  Key key;

  ListItem(this.title, this.key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: isSelected ? AppColor.primary[50] : Colors.transparent,
      child: ListTile(
        key: widget.key,
        title: Text("${widget.title}"),
        trailing: Icon(Icons.menu),
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
      ),
    );
  }
}

//class EditScreen extends StatefulWidget {
//  @override
//  _EditScreenState createState() => _EditScreenState();
//}
//
//class _EditScreenState extends State<EditScreen> {
//
//  List<String> alphabetList;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    alphabetList = ["a", "b", "c", "d", "e", "f"];
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(appBar: _buildAppBar(context), body: _buildBody());
//  }
//
//  Widget _buildAppBar(BuildContext context) {
//    return AppBar(
//      title: Text("Reorder"),
//      leading: IconButton(
//          icon: Icon(Icons.close, color: Colors.white),
//          onPressed: () {
//            Navigator.of(context).pop();
//          }),
//      actions: <Widget>[
//        IconButton(
//            icon: Icon(Icons.done, color: Colors.white),
//            onPressed: () {
//              Navigator.of(context).pop();
//            })
//      ],
//    );
//  }
//
//  Widget _buildBody() {
//    return ReorderableListView(
//      onReorder: _onReorder,
//      scrollDirection: Axis.vertical,
//      children: List.generate(
//        alphabetList.length,
//        (index) {
//          return ListTile(
//            key: ValueKey(alphabetList[index]),
//            title: Text("${alphabetList[index]}"),
//          );
//        },
//      ),
//    );
//  }
//
//  void _onReorder(int oldIndex, int newIndex) {
//    setState(
//      () {
//        if (newIndex > oldIndex) {
//          newIndex -= 1;
//        }
//        final String item = alphabetList.removeAt(oldIndex);
//        alphabetList.insert(newIndex, item);
//      },
//    );
//  }
//}
