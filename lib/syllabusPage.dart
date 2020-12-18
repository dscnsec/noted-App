import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'home_page.dart';
import 'package:tree_view/tree_view.dart';
import 'dart:convert';


class SyllabusPage extends StatefulWidget {
  @override
  _SyllabusPageState createState() => _SyllabusPageState();
}

class _SyllabusPageState extends State<SyllabusPage> {
  Map<String, dynamic> jsonSyllabus;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });
    loadJson();
  }

  loadJson() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/syllabus.json");
    jsonSyllabus = jsonDecode(data) as Map<String, dynamic>;
  }

  List<Parent> getStream() {
    List<Parent> childs = [];
    for (var i = 0; i < 3; i++) {
      childs.add(
        Parent(
          parent: SyllabusCard(
            name: jsonSyllabus['syllabus'][i]['stream'],
            level: 0,
          ),
          childList: ChildList(
            children: <Widget>[
              for (var j = 0; j < 3; j++)
                Parent(
                  parent: SyllabusCard(
                    name: "Semester" + ((j + 1).toString()),
                    level: 1,
                  ),
                  childList: ChildList(
                    children: <Widget>[
                      for (var k = 0; k < 3; k++)
                        SyllabusCard(
                          name: jsonSyllabus['syllabus'][k]['semester'][j][k],
                          level: 2,
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff16697a),
      body: TreeView(
        parentList: getStream(),

        //     [
        //   Parent(
        //     parent: SyllabusCard(
        //       name: "Computer Science",
        //       level: 0,
        //     ),
        //     childList: ChildList(
        //       children: [
        //         Parent(
        //           parent: SyllabusCard(
        //             name: "Semester 1",
        //             level: 1,
        //           ),
        //           childList: ChildList(
        //             children: <Widget>[
        //               SyllabusCard(
        //                 name: "Data Structure and Analysis",
        //                 level: 2,
        //               ),
        //               SyllabusCard(
        //                 name: "Computer Organization",
        //                 level: 2,
        //               ),
        //             ],
        //           ),
        //         ),
        //         SyllabusCard(
        //           name: "Semester 2",
        //           level: 1,
        //         ),
        //         SyllabusCard(
        //           name: "Semester 3",
        //           level: 1,
        //         ),
        //         SyllabusCard(
        //           name: "Semester 4",
        //           level: 1,
        //         ),
        //       ],
        //     ),
        //   ),
        //   Parent(
        //     parent: SyllabusCard(
        //       name: "Computer Science",
        //       level: 0,
        //     ),
        //     childList: ChildList(
        //       children: [
        //         Parent(
        //           parent: SyllabusCard(
        //             name: "Semester 1",
        //             level: 1,
        //           ),
        //           childList: ChildList(
        //             children: <Widget>[
        //               SyllabusCard(
        //                 name: "Data Structure and Analysis",
        //                 level: 2,
        //               ),
        //               SyllabusCard(
        //                 name: "Computer Organization",
        //                 level: 2,
        //               ),
        //             ],
        //           ),
        //         ),
        //         SyllabusCard(
        //           name: "Semester 2",
        //           level: 1,
        //         ),
        //         SyllabusCard(
        //           name: "Semester 3",
        //           level: 1,
        //         ),
        //         SyllabusCard(
        //           name: "Semester 4",
        //           level: 1,
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
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
        top: level == 0 ? 20.0 : 0.0,
        bottom: 0.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        elevation: 9.0,
        shadowColor: Colors.white,
        color: Colors.white.withOpacity(1 - (0.2 * level)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
    );
  }
}
