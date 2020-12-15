import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import './appInfo.dart';
import './home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noted',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'noted Home Page'),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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
        body: Column(
          children: <Widget>[
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Image.asset('images/coverdark.png'),
              ),
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    color: Color(0xFF29998C),
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}


