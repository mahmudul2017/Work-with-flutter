import 'package:flutter/material.dart';

class stateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: statefulManagement(),
    );
  }
}

class statefulManagement extends StatefulWidget {
  @override
  _statefulManagementState createState() => _statefulManagementState();
}

class _statefulManagementState extends State<statefulManagement> {
  int value = 0;

  IncrementValue() {
    setState(() {
      value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text(value.toString(), style: TextStyle(fontSize: 48, color: Colors.blue, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text("Increment", style: TextStyle(fontSize: 18, color: Colors.white),),
                  onPressed: () {
                    IncrementValue();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

