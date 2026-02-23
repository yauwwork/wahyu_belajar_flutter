import 'package:flutter/material.dart';

class LupaPassScreen extends StatelessWidget {
  const LupaPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Lupa Password",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
      ),
    );
  }
}