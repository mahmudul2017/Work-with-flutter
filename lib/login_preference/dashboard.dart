import 'package:flutter/material.dart';
import 'package:flutter_app/login_preference/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: myDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class myDashboard extends StatefulWidget {
  @override
  _myDashboardState createState() => _myDashboardState();
}

class _myDashboardState extends State<myDashboard> {
  SharedPreferences dashPref;
  String username;

  @override
  void initState() {
    super.initState();
    initDashboard();
  }

  void initDashboard() async {
    dashPref = await SharedPreferences.getInstance();

    setState(() {
      username = dashPref.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User DashBoard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Center(
              child: Text(
                'Welcome to user dashboard....', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                '$username', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
            RaisedButton(
               onPressed: () {
                  dashPref.setBool('login', true);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
             },
            child: Text('LogOut'),)
          ],
        ),
      ),
    );
  }
}


