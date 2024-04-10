import 'package:flutter/material.dart';
import 'package:movie_info/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "home_page",
      routes: {"home_page": (context) => home_page()},
    );
  }
}
