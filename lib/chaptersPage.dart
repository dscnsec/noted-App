import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './viewallPage.dart';
import './notePage.dart';
import './search_page.dart';

class ChaptersPage extends StatefulWidget {
  final String subjName;
  final String imgPath;

  const ChaptersPage(this.imgPath, this.subjName);
  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  @override
  Widget build(BuildContext context) {
    String imagePath = widget.imgPath;
    return Scaffold(
      backgroundColor: Color(0xfffbfcfc),
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
                  widget.subjName,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
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
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                HorizontalCard('Chapter Name', 'profName', 'Openbook_.png'),
                HorizontalCard('Chapter Name', 'profName', 'Openbook_.png'),
              ],
            ),
          ),
        ],
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
