import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Welcome to Web Technology"),
        centerTitle: true,
      ),
      body: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(color: Colors.green, width: 5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(255),
              blurRadius: 10,
              offset: Offset(20, 20),
            ),
          ],
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.red, Colors.yellow, Colors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}