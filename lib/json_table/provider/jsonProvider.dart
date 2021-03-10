import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/json_table/model/dataTable.dart';

class jsonProvider extends ChangeNotifier {
  myDataTable data;

  Future getData(context) async {
    var response = await DefaultAssetBundle.of(context).loadString('assets/raw/myJson.json');
    //json to string convert
    var myJson = json.decode(response);
    this.data = myDataTable.fromJson(myJson);
    this.notifyListeners();
  }
}