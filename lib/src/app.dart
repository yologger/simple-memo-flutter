import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';
import 'package:simplememo/src/ui/screen/edit_screen.dart';
import 'package:simplememo/src/ui/screen/trash_screen.dart';
import 'package:simplememo/src/ui/screen/remove_screen.dart';
import 'ui/screen/main_screen.dart';
import 'ui/screen/profile_screen.dart';
import 'ui/screen/search_screen.dart';
import 'ui/screen/test_screen.dart';
import 'ui/theme/light/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Global Bloc
    return BlocProvider<MemoBloc>(
        create: (context) => MemoBloc()..add(LoadMemos()),
        child: MaterialApp(
          title: 'Flutter Simple Memo',
          theme: buildTheme(),
          home: TabBarController(),
        ));
  }
}

class TabBarController extends StatelessWidget {
  const TabBarController({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        ));
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildAboutDialog(context),
            );
          },
        ),
      ],
      bottom: TabBar(tabs: <Widget>[
        Tab(icon: Icon(Icons.home), text: 'Main'),
        Tab(icon: Icon(Icons.account_circle), text: 'Profile'),
        Tab(icon: Icon(Icons.error), text: 'Test'),
      ]),
    );
  }

  Widget _buildBody(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        MainScreen(),
        ProfileScreen(),
        TestScreen()
      ],
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text("Edit"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditScreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Remove"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RemoveScreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Trash"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TrashScreen()));
            },
          ),
          Divider(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Cancel'),
        )
      ],
    );
  }
}
