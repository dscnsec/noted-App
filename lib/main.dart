import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import './appInfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noted',
      home: MyHomePage(title: 'noted Home Page'),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff264753),
        body: ListView(
          children: <Widget>[
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 1.0,
                width: MediaQuery.of(context).size.width * 1.0,
                child: Image.asset('images/coverdark.png'),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.83,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Noted',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 3.0,
                        fontFamily: 'productSans',
                        fontSize: 55.0,
                        color: Color(0xFF7178C7),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 35.0),
                      child: Container(
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          appInfoClass.appInfo,
                          style: TextStyle(
                            fontFamily: 'productSans',
                            fontSize: 15.0,
                          ),
                        ),
                      )),*/
                  Padding(
                    padding:
                        EdgeInsets.only(right: 20.0, top: 0.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 15.0),
                            color: Color(0xFFE8C46A),
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
