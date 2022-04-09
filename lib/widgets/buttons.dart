// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String buttonChild;
  final Color color;

  const Button({Key? key,required this.onPressed,required this.buttonChild,required this.color}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 8, 3),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: MaterialButton(
        onPressed: () {
          onPressed(buttonChild);
        },
        child: Center(
            child: Text(
          buttonChild,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
