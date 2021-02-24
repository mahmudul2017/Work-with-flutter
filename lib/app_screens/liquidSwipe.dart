import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyLiquidSwipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final swipeView = [
      Container(
        color: Colors.cyan,
      ),
      Container(
        color: Colors.lime,
      ),
      Container(
        color: Colors.amber,
      ),
      Container(
        color: Colors.blueGrey,
      )
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LiquidSwipe(
          pages: swipeView,
        ),
      ),
    );
  }
}
