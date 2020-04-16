import 'package:flutter/material.dart';
import 'package:simplememo/src/ui/theme/light/color.dart';

class TrashScreen extends StatefulWidget {
  @override
  _TrashScreenState createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  List<String> list;
  List<String> selectedList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = ["Ronaldo", "Kane", "Benzema", "Bale", "Son", "Marcelo", "Ramos"];
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
            ListView(
                children: List.generate(
              list.length,
              (index) {
                return ListItem(
                  list[index],
                  Key(list[index]),
                );
              },
            )),
            Align(
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
            ),
            Align(
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
                    ))),
          ],
        ));
  }

  Widget _buildAppBar() {
    return AppBar(title: Text("Trash"));
  }

  Widget _buildBottomButtons() {}
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
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
      ),
    );
  }
}
