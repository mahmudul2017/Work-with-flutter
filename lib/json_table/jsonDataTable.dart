import 'package:flutter/material.dart';
import 'package:flutter_app/json_table/provider/jsonProvider.dart';
import 'package:provider/provider.dart';

class jsonDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Data Table'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<jsonProvider> (
        create: (context) => jsonProvider(),
        child: Consumer<jsonProvider> (
          builder: (context, provider, child) {
             if(provider.data == null) {
               provider.getData(context);
               return Center(child: CircularProgressIndicator());
             }
             return SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: SingleChildScrollView(
                 child: DataTable(
                   columns: [
                     DataColumn(label: Text('Verified'), tooltip: 'Verified Player'),
                     DataColumn(label: Text('First Name'), tooltip: 'Verified Player Name'),
                     DataColumn(label: Text('Last Name'), tooltip: 'Verified Player Signature'),
                     DataColumn(label: Text('Email'), tooltip: 'Verified Player Email'),
                     DataColumn(label: Text('Phone'), tooltip: 'Verified Player Phone'),
                   ],
                   rows: provider.data.results.map((data) =>
                       DataRow(cells: [
                         DataCell((data.verified) ? Icon(Icons.verified_user_rounded, color: Colors.green,) : Icon(Icons.verified_user_rounded, color: Colors.red,)),
                         DataCell(Text(data.firstName)),
                         DataCell(Text(data.lastName)),
                         DataCell(Text(data.email)),
                         DataCell(Text(data.phone)),
                     ])
                   ).toList(),
                 ),
               ),
             );
           },
         ),
      ),
    );
  }
}

