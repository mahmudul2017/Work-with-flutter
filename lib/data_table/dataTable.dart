import 'package:flutter/material.dart';

class dataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DataTable Demo',
      home: _dataTableState(),
    );
  }
}

class _dataTableState extends StatefulWidget {
  @override
  _dataTableStateState createState() => _dataTableStateState();
}

class _dataTableStateState extends State<_dataTableState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Table'),
      ),
      body: Center(
        child: DataTable(
          headingRowHeight: 48,
          dataRowHeight: 32,
          headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blueGrey),
          columns: [
            DataColumn(label: Text('Name', style: TextStyle(fontSize: 16, color: Colors.white),),),
            DataColumn(label: Text('Year', style: TextStyle(fontSize: 16, color: Colors.white),),),
            DataColumn(label: Text('Role', style: TextStyle(fontSize: 16, color: Colors.white),),),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Royal'), showEditIcon: true),
              DataCell(Text('1982')),
              DataCell(Text('Company')),
            ]),
            DataRow(cells: [
              DataCell(Text('Green'), showEditIcon: true),
              DataCell(Text('2017')),
              DataCell(Text('Limited')),
            ]),
            DataRow(cells: [
              DataCell(Text('England'), showEditIcon: true),
              DataCell(Text('2019')),
              DataCell(Text('British')),
            ]),
            DataRow(cells: [
              DataCell(Text('Australia'), showEditIcon: true),
              DataCell(Text('1887')),
              DataCell(Text('Aussie')),
            ]),
            DataRow(cells: [
              DataCell(Text('Bangladesh'), showEditIcon: true),
              DataCell(Text('1999')),
              DataCell(Text('Tigers')),
            ])
          ],
        ),
      ),
    );
  }
}
