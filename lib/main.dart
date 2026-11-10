import 'package:flutter/material.dart';
import 'navigation/main_navigation.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Literasiku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFFFFEFA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF344936),
          surface: const Color(0xFFFFFEFA),
        ),
        useMaterial3: true,
      ),
      // initialRoute: AppRoutes.main,
      // routes: AppRoutes.routes,
      home: const LoginPage(),
    );
  }
}
