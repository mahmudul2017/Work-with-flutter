import 'package:flutter/material.dart';
import 'package:flutter_app/page_view/page/firstPage.dart';
import 'package:flutter_app/page_view/page/secondPage.dart';
import 'package:flutter_app/page_view/page/thirdPage.dart';

class pageView extends StatefulWidget {
  @override
  _pageViewState createState() => _pageViewState();
}

class _pageViewState extends State<pageView> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          controller: _controller,
          children: <Widget> [
            firstPage(),
            secondPage(),
            thirdPage(),
          ],
        ),
      ),
    );
  }
}
