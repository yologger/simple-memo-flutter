import 'package:flutter/material.dart';
import 'detail_screen.dart';
import 'create_screen.dart';
import '../theme/light/color.dart';

const dummy_posts = [
  {
    "id": 1,
    "title": "Ronaldo",
    "content": "What I need to buy....",
    "isBookmarked": true
  },
  {
    "id": 2,
    "title": "Ramos",
    "content": "What I need to buy....",
    "isBookmarked": false
  },
  {
    "id": 3,
    "title": "Kane",
    "content": "What I need to buy....",
    "isBookmarked": false
  },
  {
    "id": 4,
    "title": "Benzema",
    "content": "What I need to buy....",
    "isBookmarked": false
  }
];

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _buildFAB(context),
        body: _buildBody(context)
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateScreen()));
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${dummy_posts[index]["title"]}"),
            trailing: Icon(Icons.favorite),
            onTap: () {
              // print("${index} is tapeed.");
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: dummy_posts.length
    );
  }
}
