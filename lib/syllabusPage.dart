import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'home_page.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:timelines/timelines.dart';

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
  int stream = 3, sem = 2;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: loadSyllabus(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          jsonSyllabus = snapshot.data;
          return Scaffold(
            backgroundColor: Color(0xff16697a),
            body: Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Timeline.tileBuilder(
                theme: TimelineThemeData(
                  nodePosition: 0.1,
                  indicatorTheme: IndicatorThemeData(
                    position: 0,
                    size: 25,
                    color: Color(0xfffcca46),
                  ),
                  connectorTheme: ConnectorThemeData(
                    thickness: 5,
                    color: Color(0xfffcca46),
                    indent: 4.0,
                  ),
                ),
                builder: TimelineTileBuilder.fromStyle(
                  contentsBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 10.0,
                      right: 10.0,
                      bottom: 50.0,
                    ),
                    child: Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        elevation: 6.0,
                        shadowColor: Colors.white,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            jsonSyllabus['syllabus'][stream]['semester'][sem]
                                [index],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount:
                      jsonSyllabus['syllabus'][stream]['semester'][sem].length,
                ),
              ),
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
