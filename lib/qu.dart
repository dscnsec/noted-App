import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'home_page.dart';


class Qu extends StatefulWidget {
  @override
  _QuState createState() => _QuState();
}

class _QuState extends State<Qu> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xfffbfcfc),
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onPageChanged: (int page, int total) {
          print('page change: $page/$total');
        },
      ).fromAsset('assets/pdf/sample.pdf'),

            );
  }
}