import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;


void main() {
  runApp(const MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorApp();
}

class _CalculatorApp extends State<CalculatorApp> {

  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';

  onButionClick(value) {
    //if value is AC
    if(value == "AC") {
      input = '';
      output = '';
    } else if(value == "<") {
      input =input.substring(0, input.length - 1);
    } else if(value == "-") {
      var userInput = input;
      userInput = input.replaceAll("x", "*");
      Parser p = Parser();
      Expression exp = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = exp.evaluate(EvaluationType.Real, cm);
      output = finalValue.toString();
    } else {
      input = input + value;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //input and output area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )),
            Row(
              children: [
                button(text: 'AC', buttonbBgColor: operatorColor, textColor: orangeColor),
                button(text: '<', buttonbBgColor: operatorColor, textColor: orangeColor),
                button(text: '', buttonbBgColor: Colors.transparent, textColor: orangeColor ),
                button(text: '/', buttonbBgColor: operatorColor, textColor: orangeColor),
              ],
            ),

            Row(
              children: [
                button(text: '7'),
                button(text: '8'),
                button(text: '9', buttonbBgColor: Colors.transparent ),
                button(text: 'x', buttonbBgColor: operatorColor, textColor: orangeColor),
              ],
            ),

            Row(
              children: [
                button(text: '4'),
                button(text: '5'),
                button(text: '6', buttonbBgColor: Colors.transparent ),
                button(text: '-', buttonbBgColor: operatorColor, textColor: orangeColor),
              ],
            ),

            Row(
              children: [
                button(text: '1'),
                button(text: '2'),
                button(text: '3', buttonbBgColor: Colors.transparent ),
                button(text: '+', buttonbBgColor: operatorColor, textColor: orangeColor),
              ],
            ),

            Row(
              children: [
                button(text: '%', buttonbBgColor: operatorColor, textColor: orangeColor),
                button(text: '0'),
                button(text: '.', buttonbBgColor: Colors.transparent),
                button(text: '=', buttonbBgColor: orangeColor),
              ],
            )
        ],
      ),
    );
  }

  Widget button({
    text, 
    textColor = Colors.white, 
    buttonbBgColor = buttonColor
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            backgroundColor: buttonColor,
            padding: const EdgeInsets.all(22)
          ),
          onPressed: () => onButionClick(text), 
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

