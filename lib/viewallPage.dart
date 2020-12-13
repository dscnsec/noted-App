import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:page_transition/page_transition.dart';
import 'home_page.dart';
import './notePage.dart';
import './chaptersPage.dart';

class ViewallPage extends StatefulWidget {
  @override
  _ViewallPageState createState() => _ViewallPageState();
}

class _ViewallPageState extends State<ViewallPage> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xfffbfcfc),
      /*appBar: AppBar(
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
          'noted',
          style: TextStyle(
              fontSize: 38.0,
              color: Color(0xFF619b8a),
              fontFamily: 'timesnewroman',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xfffbfcfc),
      ),*/
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 30.0,
              bottom: 10.0,
              top: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: HomePage()));
                  },
                ),
                Text(
                  'All Notes',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    CourseCard(
                        'Notes.png', 'Computer Architecture', 'Prof XYZ'),
                    CourseCard('Sheets.png', 'Operating System', 'Prof XYZ'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CourseCard(
                        'Notes.png', 'Computer Architecture', 'Prof XYZ'),
                    CourseCard('Sheets.png', 'Operating System', 'Prof XYZ'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CourseCard(
                        'Notes.png', 'Computer Architecture', 'Prof XYZ'),
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
        padding: EdgeInsets.all(5.0),
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
