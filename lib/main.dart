import 'package:flutter/material.dart';
import './app_screens/first_screen.dart';
import './app_screens/home.dart';
import './app_screens/liquidSwipe.dart';
import './app_screens/sharedPreference.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'bottom_navigation/bottomNavigation.dart';
import 'json_parse/jsonParse.dart';

// Normal Way Function Call
/* void main() {
  runApp(MyFirstFlutterClass());
} */

// Advance Way Function Call [Function Expression] Or [Flat Arrow]
/*void main() => runApp(
     MaterialApp(
       debugShowCheckedModeBanner: false,
       // title: "Basic ListView",
       title: "Long ListView App",
       home: Scaffold(
         appBar: AppBar(
           // title: Text("Basic ListView"),
           title: Text("Long ListView"),
         ),
         body: getLongListView(),
         floatingActionButton: FloatingActionButton(
           onPressed: () {
             debugPrint("FAB Clicked...");
           },
           child: Icon(Icons.add),
           tooltip: "Add One More Item",
         ),
       ),
     )
);*/

// For First Screen Class
/*class MyFirstFlutterClass extends StatelessWidget {
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
}*/

void main() => runApp(jsonParse());

class MyHomeClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Home Page",
      home: Home(),
    );
  }
}

Widget getListView() {
  var listView = ListView(
    children: <Widget> [
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Mango Drinks"),
        subtitle: Text("Wonderful things of life"),
        trailing: Icon(Icons.wb_sunny),
        onTap: () {
          debugPrint("Mango Drinks Clicked");
        },
      ),

      ListTile(
          leading: Icon(Icons.landscape),
          title: Text("Orange Drinks"),
          subtitle: Text("Wonderful things of life"),
          trailing: Icon(Icons.wb_sunny),
      ),

      ListTile(
          leading: Icon(Icons.landscape),
          title: Text("Apple Drinks"),
          subtitle: Text("Wonderful things of life"),
          trailing: Icon(Icons.wb_sunny),
      ),

      Text( 
        "Malta Drinks",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.cyan,
          fontSize: 16.0,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic
          ),
        ),

      Container(
        margin: EdgeInsets.all(20.0),
        color: Colors.lime,
        width: 400.0,
        alignment: Alignment.center,
        height: 50.0,
        child: Text(
          "PineApple Drinks",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700
         ),
         // textAlign: TextAlign.center
        ),
      )
    ],
  );
  return listView;
}

List<String> getDataSource() {
  var itemCounts = List<String>.generate(150, (counter) => "Item $counter");
  return itemCounts;
}

Widget getLongListView() {
  var itemLists = getDataSource();

  var longLists = ListView.builder(
      itemCount: (itemLists.length),
      itemBuilder: (context, index) {
         return ListTile(
           leading: Icon(Icons.arrow_right),
           title: Text(itemLists[index]),
           onTap: () {
             showSnackBar(context, itemLists[index]);
             debugPrint("Clicked at $index");
           },
         );
      });
  return longLists;
}

void showSnackBar(BuildContext context, String items) {
  var snackBar = SnackBar(content:
     Text("SnackBar Click at $items"),
     action: SnackBarAction(
      label: "Undo",
      onPressed: () {
        debugPrint("Undo an item at $items");}
    ),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}