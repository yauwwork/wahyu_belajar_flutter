import 'package:flutter/material.dart';

class ListT9 extends StatelessWidget {
  ListT9({super.key});

  final List<String> kategoriProduk = [
    "Sayuran",
    "Buah - Buahan",
    "Daging",
    "Ikan",
    "Hasil Laut Lainnya",
    "Telur",
    "Kopi",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 255, 237, 237),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 176, 176),
        title: Text("List View",
        style: TextStyle(
          fontSize: 36,
          color: Colors.white
        ),
        ),
      ),

      body:ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: kategoriProduk.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: 15),
            height: 30,
            color: Color.fromARGB(255, 255, 179, 169),
            child: Text("$index : ${kategoriProduk[index]}"),
          );
        },
      ),
    );
  }
}