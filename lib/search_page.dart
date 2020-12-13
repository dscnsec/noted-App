import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './notePage.dart';

class Searchpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 15.0, top: 20.0, left: 28.0),
          /*child: Text(
            'Hi User',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),*/
        ),
        Padding(
          padding: EdgeInsets.only(right: 15.0, top: 10.0, left: 28.0),
          child: Text(
            'Explore Notes',
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: SearchBar()),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  CourseCard('Notes.png', 'Computer Architecture', 'Prof XYZ',
                      '4th Semester'),
                  CourseCard('Sheets.png', 'Operating System', 'Prof XYZ',
                      '4th Semester'),
                ],
              ),
              Row(
                children: <Widget>[
                  CourseCard('Notes.png', 'Computer Architecture', 'Prof XYZ',
                      '4th Semester'),
                  CourseCard('Sheets.png', 'Operating System', 'Prof XYZ',
                      '4th Semester'),
                ],
              ),
              Row(
                children: <Widget>[
                  CourseCard('Notes.png', 'Computer Architecture', 'Prof XYZ',
                      '4th Semester'),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class CourseCard extends StatelessWidget {
  final String imgPath;
  final String courseName;
  final String teacher;
  final String semester;

  CourseCard(this.imgPath, this.courseName, this.teacher, this.semester);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NotePage(imgPath, courseName)),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            //color: Color(0xfffbfcfc),
            color: Color(0xFF619b8a).withOpacity(0.11),
            //color: Colors.grey[200],
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            boxShadow: [
              new BoxShadow(
                offset: Offset(0, 15),
                color: Color(0xff666666).withOpacity(.11),
                blurRadius: 30.0,
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.45,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    //padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      courseName,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          //padding: EdgeInsets.only(top: 0.0),
                          child: Text(
                            teacher,
                            style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          //padding: EdgeInsets.only(left: 0.0),
                          padding: EdgeInsets.only(top: 0.9),
                          child: Text(
                            semester,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'RobotoMono',
                              //fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                /*Padding(
                  padding: EdgeInsets.only(top: 0.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/$imgPath'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalCard extends StatelessWidget {
  final String subjName;
  final String profName;
  final String imgpPath;

  const HorizontalCard(
    this.subjName,
    this.profName,
    this.imgpPath,
  );

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, //
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: Text(
                          subjName,
                          style: TextStyle(
                              fontSize: screenSize > 700 ? 22.0 : 20,
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: Text(
                          "By Prof. $profName",
                          style: TextStyle(
                              fontSize: screenSize > 700 ? 15.0 : 13,
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: screenSize > 700
                  ? MediaQuery.of(context).size.height * 0.2
                  : MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                //color: Colors.red,
                image: DecorationImage(
                    image: AssetImage('images/$imgpPath'), fit: BoxFit.cover),
              ),
            )
          ],
        ),
        height: screenSize > 700
            ? MediaQuery.of(context).size.height * 0.2
            : MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Color(0xfffbfcfc),
          //color: Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          boxShadow: [
            new BoxShadow(
              color: Color(0xffe2e2e2),
              blurRadius: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: 50.0,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            offset: Offset(0, 15),
            color: Color(0xff666666).withOpacity(.11),
            blurRadius: 30.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle:
                        TextStyle(color: Colors.grey, fontFamily: 'RobotoMono'),
                    border: InputBorder.none),
              ),
            ),
          ),
          Container(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      child: Icon(Icons.search),
                      onTap: () {},
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
