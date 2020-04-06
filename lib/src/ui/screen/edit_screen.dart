import 'package:flutter/material.dart';


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


class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context)
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Rearrange Screen"),
      leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.done, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
              title: Text("${dummy_posts[index]["title"]}"),
              trailing: Icon(Icons.menu),
              onTap: () {}
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: dummy_posts.length
    );
  }

}

