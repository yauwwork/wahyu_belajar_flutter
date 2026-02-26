import 'package:flutter/material.dart';

class Home10 extends StatelessWidget {
  const Home10({super.key, required this.nama, required this.alamat, required this.telepon});
  final String nama;
  final String alamat;
  final String telepon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text("Home Page",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
      ),


      
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              
              children: [
                  Text(
                    "Hallo $nama \n"
                    "Selamat datang di Agrova",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}