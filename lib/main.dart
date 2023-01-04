import 'package:flutter/material.dart';
import 'package:interview/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Noto Sans',
               primarySwatch: Colors.blue,
      ),
      home: BottomNav(),
    );
  }
}


