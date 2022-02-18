import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'package:clima_calc/apps/calculator/components/button.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  String _history = '';
  String _expression = '';

  void click(String text) {
    switch (text) {
      case 'x':
        text = '*';
        break;
      case '.':
        if (_expression.contains('.')) text = '';
        break;
    }
    setState(() => _expression += text);
  }

  void clearAll(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void calculate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
      if (_expression == 'Infinity') _expression = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          //color: Colors.amber,
          margin: const EdgeInsets.fromLTRB(10, 0, 15, 0),
          alignment: Alignment.centerRight,
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _history,
                style: const TextStyle(
                  fontSize: 26,
                ),
              ),
              Text(
                _expression,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.black87,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: 'ac',
                      callback: clearAll,
                      textColor: Colors.deepOrange,
                    ),
                    CustomButton(
                      text: 'c',
                      callback: clear,
                      textColor: Colors.orange,
                    ),
                    CustomButton(text: '%', callback: click),
                    CustomButton(text: '/', callback: click),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: '7',
                      callback: click,
                      textColor: Colors.white,
                    ),
                    CustomButton(
                      text: '8',
                      callback: click,
                      textColor: Colors.white,
                    ),
                    CustomButton(
                      text: '9',
                      callback: click,
                      textColor: Colors.white,
                    ),
                    CustomButton(text: 'x', callback: click),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: '4',
                      callback: click,
                      textColor: Colors.white,
                    ),
                    CustomButton(
                      text: '5',
                      callback: click,
                      textColor: Colors.white,
                    ),
                    CustomButton(
                      text: '6',
                      callback: click,
                      textColor: Colors.white,
                    ),
                    CustomButton(text: '-', callback: click),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: '1',
                      callback: click,
                      textColor: Colors.white,
                    ),
                    CustomButton(
                      text: '2',
                      callback: click,
                      textColor: Colors.white,
                    ),
                    CustomButton(
                      text: '3',
                      callback: click,
                      textColor: Colors.white,
                    ),
                    CustomButton(text: '+', callback: click),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextButton(onPressed: null, child: Text('')),
                    CustomButton(
                      text: '0',
                      callback: click,
                      textColor: Colors.white,
                    ),
                    CustomButton(text: '.', callback: click),
                    CustomButton(text: '=', callback: calculate),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
