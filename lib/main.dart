import 'package:flutter/material.dart';
import 'package:literasikuu/pages/home.dart';

void main() {
  runApp(const LiterasikuApp());
}

class LiterasikuApp extends StatelessWidget {
  const LiterasikuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
