import 'package:flutter/material.dart';
import 'design_002.dart';

void main() {
  runApp(StreamExample());
}

class StreamExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamExampleHome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}

