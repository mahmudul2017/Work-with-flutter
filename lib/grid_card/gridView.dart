import 'package:flutter/material.dart';

class gridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: <Widget> [
            Container(
              width: 150,
              height: 200,
              color: Colors.greenAccent,
            ),
            Container(
              width: 150,
              height: 200,
              color: Colors.greenAccent,
            ),
            Container(
              width: 150,
              height: 200,
              color: Colors.greenAccent,
            ),
            Container(
              width: 150,
              height: 200,
              color: Colors.greenAccent,
            ),
            Container(
              width: 150,
              height: 200,
              color: Colors.greenAccent,
            ),
            Container(
              width: 150,
              height: 200,
              color: Colors.greenAccent,
            )
          ],),
        ),
      ),
    );
  }
}
