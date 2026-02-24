import 'package:flutter/material.dart';

class about8 extends StatefulWidget {
  const about8({super.key});

  @override
  State<about8> createState() => _about8State();
}

class _about8State extends State<about8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text("Tentang Aplikasi",
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),

      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsetsGeometry.all(30)),

            SizedBox(height: 24),

            Text("Agrova",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            ),

            Text("Terhubung Dengan Sumber Terbaik",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
            ),

            SizedBox(height: 24),

            Text("Agrova Adalah aplikasi katalog produk yang mempertemukan produsen lokal dengan konsumen luas",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
            ),
          ],
        ),
      ),
    );
  }
}