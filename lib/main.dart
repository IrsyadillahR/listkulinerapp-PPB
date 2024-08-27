import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFFF3E0),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 83, 67, 40),
          title: Text("Kuliner Nusantara",
            style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
    );
  }
}