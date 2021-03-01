import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared pref login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginState(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class loginState extends StatefulWidget {
  @override
  _loginStateState createState() => _loginStateState();
}

class _loginStateState extends State<loginState> {
  // retrieve the user current value from TextField
  final username_controller =  TextEditingController();
  final password_controller = TextEditingController();

  SharedPreferences loginPref;
  bool newUser;
  bool isUserNameValidate = false;
  bool isUserPassValidate = false;

  @override
  void initState() {
    super.initState();
    check_if_already_exist();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Login',  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text('Flutter Shared Preference Demo',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: username_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  errorText: isUserNameValidate ? 'Please enter a Username' : null,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                child: TextField(
                  controller: password_controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    errorText: isUserPassValidate ? 'Please enter a Password' : null
                  ),
               ),
            ),
            RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  String username = username_controller.text;
                  String password = password_controller.text;

                  var validateNameReturn = validateTextField(username);
                  validatePassTextField(password);
                  print('return value: $validateNameReturn and isUserNameValidate: $isUserNameValidate');

                  if(username != '' && password != '') {
                    print('Successful $validateNameReturn');
                    loginPref.setBool("login", false);

                    loginPref.setString('username', username);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashboard()));
                  }
                },
              child: Text('login', style: TextStyle(fontSize: 18,),),
            )
          ],
        ),
      ),
    );
  }

  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isUserNameValidate = true;
      });
      return false;
    }
    setState(() {
      isUserNameValidate = false;
    });
    return true;
  }

  bool validatePassTextField(String userPass) {
    if (userPass.isEmpty) {
      setState(() {
        isUserPassValidate = true;
      });
      return false;
    }
    setState(() {
      isUserPassValidate = false;
    });
    return true;
  }

  void check_if_already_exist() async {
    loginPref = await SharedPreferences.getInstance();
    newUser = (loginPref.getBool('LogIn')) ?? true;

    print(newUser);
    if(!newUser) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashboard()));
    }
  }

  @override
  void dispose() {
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }
}




