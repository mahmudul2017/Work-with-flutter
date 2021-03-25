import 'package:flutter/material.dart';

class cardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Container(
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
