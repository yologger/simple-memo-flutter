import 'package:flutter/material.dart';
import 'package:simplememo/src/ui/theme/light/color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  Widget _buildAppBar() {
    return AppBar(
      title: _buildSearchBar(),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("Recent"),
          trailing: FlatButton(child: Text("Remove All"))
        ),
        Divider(),
        ListTile(
          title: Text("Ronaldo"),
          trailing: IconButton(
            icon: Icon(Icons.close)
          ),
        ),
        ListTile(
          title: Text("Ronaldo"),
          trailing: IconButton(
              icon: Icon(Icons.close)
          ),
        ),
        ListTile(
          title: Text("Ronaldo"),
          trailing: IconButton(
              icon: Icon(Icons.close)
          ),
        ),
        ListTile(
          title: Text("Ronaldo"),
          trailing: IconButton(
              icon: Icon(Icons.close)
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      cursorColor: AppColor.secondary,
      style: TextStyle(
        color: AppColor.onPrimary,
      ),
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white60),
      ),
    );
  }
}
