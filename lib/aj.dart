import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import './home_page.dart';


class aj extends StatefulWidget {
  @override
  _ajState createState() => _ajState();
}

class _ajState extends State<aj> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xfffbfcfc),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff619b8a)),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              minRadius: 25.0,
              backgroundColor: Color(0xFF619b8a),
            ),
          )
        ],
        title: Text(
          'AJ',
          style: TextStyle(
              fontSize: 38.0,
              color: Color(0xFF619b8a),
              fontFamily: 'timesnewroman',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xfffbfcfc),
      ),
      body: ListView(
        children: <Widget>[
          /*Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Dive',
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Deep',
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),*/
          /*Padding(
            padding: EdgeInsets.zero,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  //padding: EdgeInsets.all(15.0),
                  padding: EdgeInsets.only(
                    left: 28.0,
                    right: 28.0,
                    bottom: 10.0,
                    top: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Syllabus of 2nd Semester:',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
          ),*/
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    CourseCard(
                        'Notes.png','Aj','Uttam K. Roy'),

                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
