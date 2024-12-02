import 'package:flutter/material.dart';

void main() {
  runApp(const CarrotCloneApp());
}

class CarrotCloneApp extends StatelessWidget {
  const CarrotCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello App Bar'),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.amber),
          child: const Center(
            child: Text('Hello Body'),
          ),
        ),
      ),
    );
  }
}
