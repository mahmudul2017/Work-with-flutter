import 'package:flutter/material.dart';
import './app_screens/first_screen.dart';

// Normal Way Function Call
/*void main() {
  runApp(MyFirstFlutterClass());
}*/

// Advance Way Function Call
// Function Expression
// or Flat Arrow
void main() => runApp(MyFirstFlutterClass());

class MyFirstFlutterClass extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My First App",
      home: Scaffold(
          appBar: AppBar(title: Text("Work with flutter"),),
          body: MyFirstScreen()
      ),
    );
  }
}
