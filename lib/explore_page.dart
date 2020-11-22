import 'package:flutter/material.dart';
import './search_page.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Find your note'),
            leading: Icon(Icons.search),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          )
        ],
      ),
    ));
  }
}
