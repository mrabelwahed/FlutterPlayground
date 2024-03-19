import 'package:flutter/material.dart';
import 'package:flutter_playground/screen/modules/bmi/bmi_screen.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMIScreen(),
    );
  }

}
