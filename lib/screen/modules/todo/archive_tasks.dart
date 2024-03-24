import 'package:flutter/material.dart';

class ArchiveTasks extends StatelessWidget {
  const ArchiveTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: const Text('Archive Tasks', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0
      ),),
    );
  }
}