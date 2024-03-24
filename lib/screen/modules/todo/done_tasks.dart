import 'package:flutter/material.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: const Text('Done Tasks', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0
      ),),
    );
  }
}