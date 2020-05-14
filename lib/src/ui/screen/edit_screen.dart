import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';
import 'package:simplememo/src/core/Bloc/MemoBloc.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:simplememo/src/ui/component/BottomMenuIconButton.dart';
import 'package:simplememo/src/ui/theme/light/color.dart';



class EditScreen extends StatefulWidget {
  EditScreen({Key key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  List<String> list;
  List<String> selectedList;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      "Ronaldo",
      "Kane",
      "Benzema",
      "Bale",
      "Son",
      "Marcelo",
      "Ramos",
      "Ronaldo",
      "Kane",
      "Benzema",
      "Bale",
      "Son",
      "Marcelo",
      "Ramos"
    ];
    selectedList = [];
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          children: <Widget>[
            _buildListView(),
            _buildCounter(),
            _buildBottomMenus()
          ],
        ));
  }

  Widget _buildListView() {
    return ListView(
        children: List.generate(
      list.length,
      (index) {
        return ListItem(
          list[index],
          Key(list[index]),
        );
      },
    ));
  }

  Widget _buildAppBar() {
    return AppBar(title: Text("Edit"));
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
                  onPressed: () {},
                  icon: Icon(Icons.delete_outline),
                  label: Text("Remove",
                      style: TextStyle(color: AppColor.onSecondary))),
              FlatButton.icon(
                  onPressed: () {},
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
                  child: Text("100"),
                ),
              ),
            )));
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
