import 'package:flutter/material.dart';

class listViewDetails extends StatelessWidget {
  final int index;

  listViewDetails(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Details'),
      ),
      body: Center(
        child: Text('ListView Details #0$index',
        style: TextStyle(fontSize: 24, color: Colors.red, fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
