import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'home_page.dart';
import 'package:tree_view/tree_view.dart';

class SyllabusPage extends StatefulWidget {
  @override
  _SyllabusPageState createState() => _SyllabusPageState();
}

class _SyllabusPageState extends State<SyllabusPage> {
  String jsonSyllabus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff16697a),
      body: TreeView(
        parentList: [
          Parent(
            parent: SyllabusCard(
              name: "Computer Science",
              level: 0,
            ),
            childList: ChildList(
              children: [
                Parent(
                  parent: SyllabusCard(
                    name: "Semester 1",
                    level: 1,
                  ),
                  childList: ChildList(
                    children: <Widget>[
                      SyllabusCard(
                        name: "Data Structure and Analysis",
                        level: 2,
                      ),
                      SyllabusCard(
                        name: "Computer Organization",
                        level: 2,
                      ),
                    ],
                  ),
                ),
                SyllabusCard(
                  name: "Semester 2",
                  level: 1,
                ),
                SyllabusCard(
                  name: "Semester 3",
                  level: 1,
                ),
                SyllabusCard(
                  name: "Semester 4",
                  level: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SyllabusCard extends StatelessWidget {
  const SyllabusCard({
    @required this.name,
    @required this.level,
  });

  final String name;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: (level * 40) + 8.0,
        right: 8.0,
        top: 8.0,
        bottom: 0.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        elevation: 6.0,
        shadowColor: Colors.white,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
