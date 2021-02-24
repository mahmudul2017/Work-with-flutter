import 'package:flutter/material.dart';
import './chat.dart';
import './contact.dart';
import './support.dart';

class bottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: btmNavStateful(),
    );
  }
}

class btmNavStateful extends StatefulWidget {
  @override
  _btmNavState createState() => _btmNavState();
}

class _btmNavState extends State<btmNavStateful> {
  var _currentIndex = 0;

  var pages = [
    chat(),
    contact(),
    support()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black26,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          title: Text("Chat")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_phone),
          title: Text("Contact")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support),
          title: Text("Support"))
         ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}


