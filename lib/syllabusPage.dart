import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'home_page.dart';
import 'package:tree_view/tree_view.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<String> _loadSyllabusAsset() async {
  return await rootBundle.loadString('assets/syllabus.json');
}

Future<Map<String, dynamic>> loadSyllabus() async {
  String data = await _loadSyllabusAsset();
  final jsonSyllabus = jsonDecode(data) as Map<String, dynamic>;
  return jsonSyllabus;
}

class SyllabusPage extends StatefulWidget {
  @override
  _SyllabusPageState createState() => _SyllabusPageState();
}

class _SyllabusPageState extends State<SyllabusPage> {
  Map<String, dynamic> jsonSyllabus;

  List<Parent> getStream() {
    List<Parent> childs = [];
    for (var i = 0; i < jsonSyllabus['syllabus'].length; i++) {
      childs.add(
        Parent(
          parent: SyllabusCard(
            name: jsonSyllabus['syllabus'][i]['stream'],
            level: 0,
          ),
          childList: ChildList(
            children: <Widget>[
              for (var j = 0;
                  j < jsonSyllabus['syllabus'][i]['semester'].length;
                  j++)
                Parent(
                  parent: SyllabusCard(
                    name: "Semester" + ((j + 1).toString()),
                    level: 1,
                  ),
                  childList: ChildList(
                    children: <Widget>[
                      for (var k = 0;
                          k < jsonSyllabus['syllabus'][i]['semester'][j].length;
                          k++)
                        SyllabusCard(
                          name: jsonSyllabus['syllabus'][i]['semester'][j][k],
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
    return FutureBuilder<Map<String, dynamic>>(
      future: loadSyllabus(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          jsonSyllabus = snapshot.data;
          return Scaffold(
            backgroundColor: Color(0xff16697a),
            body: TreeView(
              parentList: getStream(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
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
