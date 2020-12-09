import 'package:flutter/material.dart';
import './home_page.dart';

class NotePage extends StatefulWidget {
  final String subjName;
  final String imgPath;

  const NotePage(this.imgPath, this.subjName);
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    String imagePath = widget.imgPath;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35.0),
                    bottomRight: Radius.circular(35.0)),
                image: DecorationImage(
                    image: AssetImage("images/Book.png"), fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, top: 5.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.subjName,
                    style: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  //Content will come down here
                  // Padding(
                  //   padding: EdgeInsets.only(right: 15.0),
                  //   child: Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       '''''',
                  //       textAlign: TextAlign.left,
                  //     ),
                  //   ),
                  // ),
                  RaisedButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15.0),
                      color: Color(0xFF29998C),
                      child: Text(
                        "Return to pathway",
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
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
            ),
          ),
        ],
      ),
    );
  }
}
