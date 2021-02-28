import 'package:flutter/material.dart';
import 'package:flutter_app/state_manage/providerData.dart';
import 'package:flutter_app/state_manage/receiveData.dart';
import 'package:provider/provider.dart';

class providerManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: providerStateful(),
    );
  }
}

class providerStateful extends StatefulWidget {
  @override
  _providerStatefulState createState() => _providerStatefulState();
}

class _providerStatefulState extends State<providerStateful> {
  @override
  Widget build(BuildContext context) {
    final getProviderData = Provider.of<providerData>(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text(getProviderData.value.toString(), style: TextStyle(fontSize: 48, color: Colors.blue, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                    color: Colors.blue,
                    child: Text("Increment", style: TextStyle(fontSize: 18, color: Colors.white),),
                    onPressed: () {
                      getProviderData.IncrementData();
                }),
              ),
              RaisedButton(
                  color: Colors.blue,
                  child: Text("Pass Data", style: TextStyle(fontSize: 18, color: Colors.white),),
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => receiveData()));
              })
            ],
          ),
        ),
      ),
    );
  }
}

