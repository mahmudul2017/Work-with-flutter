import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          color: Colors.lime,
          // height: 100.0,
          // width: 200.0,
          padding: EdgeInsets.only(left: 24.0, top: 48.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Flutter Row 1",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                        )
                    ),
                  ),
                  Expanded(
                    child: Text("Flutter Row 2",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic)),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Royal Green Ltd",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Expanded(
                    child: Text("Motijheel-1000",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic)
                    ),
                 )
               ],
            ),
              MyImageAsset(),

              MyRaisedButton()
         ],
      )),
    );
  }
}

class MyImageAsset extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/navigation.jpeg');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
      margin: EdgeInsets.all(20.0),
    );
  }
}

class MyRaisedButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.0),
      width: 200.0,
      height: 40.0,
      child: RaisedButton(
          color: Colors.white,
          child: Text(
            "Button Click",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                fontSize: 18.0),
          ),
          elevation: 6.0,
          onPressed: () {
            onButtonPress(context);
          }),
      );
  }

  void onButtonPress(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Are You Want To Exit?"),
      content: Text("Smile Please..."),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
    });
  }
}