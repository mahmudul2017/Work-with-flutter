import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class jsonParse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: jsonParseData(),
    );
  }
}

class jsonParseData extends StatefulWidget {
  @override
  _jsonParseDataState createState() => _jsonParseDataState();
}

class _jsonParseDataState extends State<jsonParseData> {
  var jsonData;

  Future getData() async {
    var response = await http.get("https://reqres.in/api/users?page=2");

    setState(() {
      var jsonDecode = json.decode(response.body);
      jsonData = jsonDecode["data"];
      print(jsonData);
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: jsonData == null ? 0 : jsonData.length,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text(jsonData[index]["first_name"], style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
            subtitle: Text(jsonData[index]["email"], style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w100),),
        );}
      ),
    );
  }
}

