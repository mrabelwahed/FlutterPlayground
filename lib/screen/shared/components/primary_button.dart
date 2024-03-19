import 'package:flutter/material.dart';

Widget primaryButton({
  double width = double.infinity,
  Color color =  Colors.blue,
  required String title,
  required VoidCallback function
}) => Container(
      width: width,
      color: color,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );