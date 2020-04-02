import 'package:flutter/material.dart';
import 'package:simplememo/src/ui/screen/rearrange_screen.dart';
import 'package:simplememo/src/ui/screen/remove_screen.dart';
import 'ui/screen/main_screen.dart';
import 'ui/screen/profile_screen.dart';
import 'ui/screen/search_screen.dart';
import 'ui/theme/light/theme.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple Memo',
      theme: buildTheme(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: TabBarController(),
    );
  }
}

class TabBarController extends StatelessWidget {
  const TabBarController({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
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
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              MainScreen(),
              ProfileScreen(),
            ],
          ),
        ));
  }

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: Center(child: Text('Edit List')),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(),
          ListTile(
            title: Text("Rearrange"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RearrangeScreen()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Remove"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RemoveScreen()));
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
          textColor: Theme
              .of(context)
              .primaryColor,
          child: const Text('Cancel'),
        )
      ]
      ,
    );
  }
}
