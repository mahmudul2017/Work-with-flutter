import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class smartCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: simpleCalculator(),
    );
  }
}

class simpleCalculator extends StatefulWidget {
  @override
  _simpleCalculatorState createState() => _simpleCalculatorState();
}

class _simpleCalculatorState extends State<simpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  btnClick(String btnText) {
    setState(() {
      if (btnText == 'C') {
        equation = '0';
        result = '0';
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (btnText == '⌫') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
        equationFontSize = 48.0;
        resultFontSize = 38.0;
      } else if (btnText == '=') {
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '⁄');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      } else {
        if (equation == '0') {
          equation = btnText;
        } else {
          equation = equation + btnText;
        }
        equationFontSize = 48.0;
        resultFontSize = 38.0;
      }
    });
  }

  Widget createButton(String btnText, double btnHeight, Color btnColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * btnHeight,
      color: btnColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
              color: Colors.white, width: 1, style: BorderStyle.solid),
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: () => btnClick(btnText),
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(
                  fontSize: equationFontSize, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(
                  fontSize: resultFontSize, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.black54,
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(children: [
                      createButton('C', 1, Colors.redAccent),
                      createButton('⌫', 1, Colors.blue),
                      createButton('÷', 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      createButton('7', 1, Colors.black54),
                      createButton('8', 1, Colors.black54),
                      createButton('9', 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      createButton('4', 1, Colors.black54),
                      createButton('5', 1, Colors.black54),
                      createButton('6', 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      createButton('1', 1, Colors.black54),
                      createButton('2', 1, Colors.black54),
                      createButton('3', 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      createButton('.', 1, Colors.black54),
                      createButton('0', 1, Colors.black54),
                      createButton('00', 1, Colors.black54),
                    ]),
                  ],
                ),
              ),
              Container(
                color: Colors.black54,
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      createButton('×', 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      createButton('-', 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      createButton('+', 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      createButton('=', 2, Colors.black54),
                    ])
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
