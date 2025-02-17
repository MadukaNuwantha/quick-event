import 'package:flutter/material.dart';

void main() {
  runApp(const QuickEvent());
}

class QuickEvent extends StatelessWidget {
  const QuickEvent({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Event',
      home: Scaffold(),
    );
  }
}
