import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import './home_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
              children: <Widget>[
                HorizontalCard('Computer is bad for computers', 'profName',
                    'Openbook_.png'),
                HorizontalCard('Computer is bad for computers', 'profName',
                    'Openbook_.png'),
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
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // PLAY AROUND WITH THIS, MAYBE CHANGE SPACEeVENLY TO SPACEbETWEEN XDXDXD the ROASSST
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
