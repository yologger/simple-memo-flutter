import 'package:flutter/material.dart';
import 'package:simplememo/src/ui/theme/light/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';
import 'package:simplememo/src/core/Bloc/MemoBloc.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:simplememo/src/ui/component/BottomMenuIconButton.dart';
import 'package:simplememo/src/ui/theme/light/color.dart';

class TrashScreen extends StatefulWidget {
  @override
  _TrashScreenState createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  TrashBloc _trashBloc;
  List<MemoEntity> _memos;
  List<MemoEntity> _selectedMemos;

  @override
  void initState() {
    super.initState();
    _trashBloc = BlocProvider.of<TrashBloc>(context);
    _memos = [];
    _selectedMemos = [];
    _trashBloc.memos.then((memos) {
      setState(() {
        _memos = memos;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
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
      title: Text("TRASH"),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildListView(),
        if (_selectedMemos.length != 0) _buildCounter(),
        if (_selectedMemos.length != 0) _buildBottomMenus()
      ],
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _memos.length,
        itemBuilder: _getListTile);
  }

//  Widget _buildListView() {
//    return BlocBuilder<TrashBloc, TrashState>(builder: (context, state) {
//      print("STATE: ${state}");
//      if (state is MemosInTrashUnloaded) {
//        return Center(child: Text("Loading...!!"));
//      } else if (state is LoadMemosFromTrashSuccess) {
//        _memos = state.memos;
//        print("_MEMOS: ${_memos}");
//        return ListView.builder(
//            itemCount: _memos.length,
//            itemBuilder: _getListTile
//        );
//      } else {
//        return Center(child: Text("Unknown Error"));
//      }
//    });
//  }

//  Widget _getListTile(BuildContext context, int index) {
//    return Container(
//      color: _selectedMemos.any((e) => e.id == _memos[index]) ? Colors.red : Colors.blue,
//      child: ListTile(
//        title: Text("${_memos[index].title}"),
//        subtitle: Text("${_memos[index].content}"),
//        onTap: () {
//          print("${index} is clicked.");
//          if(_selectedMemos.any((e) => e.id == _memos[index].id)) {
//            _selectedMemos.removeWhere((e) => e.id == _memos[index].id);
//            print("SELECTED_MEMOS: ${_selectedMemos}");
//          } else {
//            _selectedMemos.add(_memos[index]);
//            print("SELECTED_MEMOS: ${_selectedMemos}");
//          }
//        },
//      ),
//    );
//  }

  Widget _getListTile(BuildContext context, int index) {
    return Container(
      color: _selectedMemos.any((e) => e.id == _memos[index].id)
          ? AppColor.primary[50]
          : Colors.white,
      child: ListTile(
        title: Text("${_memos[index].title}"),
        subtitle: Text("${_memos[index].content}"),
        onTap: () {
          print("${index} is clicked.");
          if (_selectedMemos.any((e) => e.id == _memos[index].id)) {
            setState(() {
              _selectedMemos.removeWhere((e) => e.id == _memos[index].id);
            });
            print("SELECTED_MEMOS: ${_selectedMemos}");
          } else {
            setState(() {
              _selectedMemos.add(_memos[index]);
            });
            print("SELECTED_MEMOS: ${_selectedMemos}");
          }
        },
      ),
    );
  }

  Widget _buildBottomMenus() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: 100,
          color: AppColor.secondary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    setState(() {
                      _trashBloc.add(DeleteMemosFromTrash(_selectedMemos));
                      _memos.removeWhere((memo) {
                        return _selectedMemos.contains(memo);
                      });
                      _selectedMemos = [];
                    });
                  },
                  icon: Icon(Icons.delete_outline),
                  label: Text("Remove",
                      style: TextStyle(color: AppColor.onSecondary))),
              FlatButton.icon(
                  onPressed: () {
                    _trashBloc.add(RestoreMemosFromTrash(_selectedMemos));
                    setState(() {
                      _memos.removeWhere((memo) {
                        return _selectedMemos.contains(memo);
                      });
                      _selectedMemos = [];
                    });
                  },
                  icon: Icon(Icons.restore),
                  label: Text("Restore")),
            ],
          )),
    );
  }

  Widget _buildCounter() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            margin: EdgeInsets.only(bottom: 120),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(200.0)),
              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
              child: Container(
                width: 55,
                height: 35,
                color: AppColor.secondary,
                child: Center(
                  child: Text("${_selectedMemos.length}"),
                ),
              ),
            )));
  }
}

class ListItem extends StatefulWidget {
  // title, key, onTab
  final String title;
  final Key key;
  final Function onTab;
  final bool isSelected;

  const ListItem({this.title, this.key, this.onTab, this.isSelected});

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
        onTap: widget.onTab,
        // onTap: () {
        //   print("SELECTED!");
        //   setState(() {
        //     isSelected = !isSelected;
        //   });
        // },
      ),
    );
  }
}

class BottomMenuCounter extends StatelessWidget {
  final int counter;

  const BottomMenuCounter({Key key, @required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int length = counter.toString().length;

    return Container(
        margin: EdgeInsets.only(bottom: 120),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(200.0)),
          child: Container(
            width: 35 + ((length * 8).toDouble()),
            height: 35,
            color: AppColor.secondary,
            child: Center(
              child: Text("${counter}"),
            ),
          ),
        ));
  }
}
