import 'dart:wasm';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './syllabusPage.dart';
import './viewallPage.dart';
import './notePage.dart';
import './search_page.dart';
import './chaptersPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFd8e5e1),
          appBar: AppBar(
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  minRadius: 25.0,
                  backgroundColor: Colors.white,
                ),
              )
            ],
            title: Text(
              'noted',
              style: TextStyle(
                  fontSize: 38.0,
                  color: Colors.black45,
                  fontFamily: 'timesnewroman',
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color(0xFFd8e5e1),
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    color: Color(0xFF619b8a),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Search',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: Searchpage()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Syllabus',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: SyllabusPage()));
                  },
                ),
              ],
            ),
          ),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 28.0,
                  right: 10.0,
                  bottom: 10.0,
                  top: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'My Notes',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: ViewallPage()));
                      },
                    )
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1.5,
                      width: MediaQuery.of(context).size.width * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0xfffbfcfc),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(55.0),
                          topRight: Radius.circular(55.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 0.0,
                      right: 0.0,
                      bottom: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 0.0,
                              right: 0.0,
                              bottom: 30.0,
                            ),
                            child: Row(
                              children: <Widget>[
                                CourseCard('Notes.png', 'Computer Architecture',
                                    'Prof XYZ'),
                                CourseCard('Sheets.png', 'Operating System',
                                    'Prof XYZ'),
                                CourseCard('Notes.png', 'Machine Learning',
                                    'Prof XYZ'),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 28.0, vertical: 10.0),
                          child: Text(
                            'More to learn',
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            children: <Widget>[
                              HorizontalCard('Machine Learning',
                                  'John Kumar Doe', 'Book.png'),
                              HorizontalCard('Data Structures and Algorithm',
                                  'John Das Doe', 'Openbook_.png'),
                              HorizontalCard('Computer Architecture',
                                  'John Doe', 'Book.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          "By Prof.$profName",
                          style: TextStyle(
                              fontSize: screenSize > 700 ? 18.0 : 15,
                              fontFamily: 'RobotoMono',
                              color: Colors.grey,
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
                //color: Color(0xFF619b8a).withOpacity(0.11),
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
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String imgPath;
  final String courseName;
  final String teacher;

  CourseCard(this.imgPath, this.courseName, this.teacher);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChaptersPage(courseName)),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfffbfcfc),
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
          height: MediaQuery.of(context).size.height * 0.35,
          //3
          width: MediaQuery.of(context).size.width * 0.45,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            //20 15
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 0.0,
                      bottom: 10.0,
                      top: 15.0,
                    ),
                    //padding: EdgeInsets.only(left: 20.0),
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
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 0.0,
                    bottom: 0.0,
                  ),
                  //padding: EdgeInsets.only(top: 0.0),
                  child: Text(
                    teacher,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'RobotoMono',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      //color: Colors.yellow,
                      image: DecorationImage(
                          image: AssetImage('images/$imgPath'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                //Spacer(),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 90,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "Details",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TwoSideRoundedButton(
                        text: "Read",
                        press: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TwoSideRoundedButton extends StatelessWidget {
  final String text;
  //final double radius;
  final Function press;
  const TwoSideRoundedButton({
    Key key,
    this.text,
    //this.radius,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF619b8a),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
