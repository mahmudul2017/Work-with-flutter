import 'package:flutter/material.dart';
import 'dart:math';

class MyFirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: Center(
        /* child: Text("Your Lucky Number: ${generateLuckyNumber()}", textDirection: TextDirection.ltr, */
        // Alternatively
          child: Text(generateLuckyNumber(),
          style: TextStyle(color: Colors.black, fontSize: 28.0),
        ),
      ),
    );
  }
}

String generateLuckyNumber() {
  var randomNumber = Random();
  int generateNumber = randomNumber.nextInt(50);
  return "Your Lucky Number: $generateNumber";
}