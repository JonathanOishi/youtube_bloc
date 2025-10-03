import 'package:flutter/material.dart';
import 'package:youtube_bloc_pattern/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterTube',
      home: Home(),
    );
  }
}
