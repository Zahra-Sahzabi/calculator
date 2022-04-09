// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                   padding: const EdgeInsets.only(right: 12),
                   alignment: Alignment(1.0, 1.0),
                  child: Text(
                    _history,
                    style: const TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  alignment: Alignment(1.0, 1.0),
                  child: Text(
                    _expression,
                    style: const TextStyle(
                        fontSize: 70.0, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    Button(onPressed:allClear, buttonChild: 'AC', color: Colors.amber, ),
                    Button(onPressed: clear, buttonChild: 'C', color: Colors.amber),
                    Button(onPressed: numClick, buttonChild: '%', color: Colors.orange),
                    Button(onPressed: numClick, buttonChild: '/', color: Colors.orange)
                  ],
                ),
                Row(
                  children: [
                    Button(
                        onPressed: numClick, buttonChild: '7', color: Colors.white38),
                    Button(
                        onPressed: numClick, buttonChild: '8', color: Colors.white38),
                    Button(
                        onPressed: numClick, buttonChild: '9', color: Colors.white38),
                    Button(onPressed: numClick, buttonChild: '*', color: Colors.orange)
                  ],
                ),
                Row(
                  children: [
                    Button(
                        onPressed: numClick, buttonChild: '4', color: Colors.white38),
                    Button(
                        onPressed: numClick, buttonChild: '5', color: Colors.white38),
                    Button(
                        onPressed: numClick, buttonChild: '6', color: Colors.white38),
                    Button(onPressed: numClick, buttonChild: '-', color: Colors.orange)
                  ],
                ),
                Row(
                  children: [
                    Button(
                        onPressed: numClick, buttonChild: '1', color: Colors.white38),
                    Button(
                        onPressed: numClick, buttonChild: '2', color: Colors.white38),
                    Button(
                        onPressed: numClick, buttonChild: '3', color: Colors.white38),
                    Button(onPressed: numClick, buttonChild: '+', color: Colors.orange)
                  ],
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 8, 3),
                        height: 80,
                        width: 177,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white38,
                        ),
                        child: MaterialButton(
                          onPressed: null,
                          child: Text(
                            '0',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )),
                    Button(
                        onPressed: numClick, buttonChild: '.', color: Colors.white38),
                    Button(onPressed: evaluate, buttonChild: '=', color: Colors.orange),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
