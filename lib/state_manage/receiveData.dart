import 'package:flutter/material.dart';
import 'package:flutter_app/state_manage/providerData.dart';
import 'package:provider/provider.dart';

class receiveData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getProviderData = Provider.of<providerData>(context);

    return Scaffold(
      body: Center(
          child: Text(getProviderData.value.toString(), style: TextStyle(fontSize:48, color: Colors.blue),)),
    );
  }
}
