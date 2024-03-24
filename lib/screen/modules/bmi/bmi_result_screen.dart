import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final int result;
  final double height;
  final int weight;

  const BMIResultScreen(
      {super.key, required this.result, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('BMI Result'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Weight: $weight',
              style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Height: $height',
              style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
