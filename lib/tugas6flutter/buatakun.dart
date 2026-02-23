import 'package:flutter/material.dart';

class BuatAkunAcreen extends StatelessWidget {
  const BuatAkunAcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Buat Akun",
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