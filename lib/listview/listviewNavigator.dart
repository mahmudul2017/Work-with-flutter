import 'package:flutter/material.dart';
import 'package:flutter_app/listview/listViewDetails.dart';

class listviewNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'ListView',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Demo'),
      ),
      body: _ListViewClass(context),
    );
  }

  ListView _ListViewClass(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text('This is title 0$index',
            style: TextStyle(fontSize: 20, color: Colors.black87),),
          subtitle: Text('This is subTitle',
            style: TextStyle(fontSize: 16, color: Colors.black54),),
          leading: Icon(Icons.thumb_up_alt_outlined),
          trailing: Icon(Icons.double_arrow_sharp),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => listViewDetails(index)));
          },
        );
      },
    );
  }
}

