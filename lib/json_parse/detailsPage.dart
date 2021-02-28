import 'package:flutter/material.dart';

class detailsPage extends StatelessWidget {
  var receiveData;

   detailsPage({this.receiveData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 100,
          child: Image.network(receiveData["avatar"]),
        ),
      ),
    );
  }
}
