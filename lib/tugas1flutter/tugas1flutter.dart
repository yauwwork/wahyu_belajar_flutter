import 'package:flutter/material.dart';

class Tugas1Futter extends StatelessWidget {
  const Tugas1Futter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 231, 231),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 108, 108),
        title: Text("Profil Saya"),
        titleTextStyle: TextStyle(fontSize: 38),
        centerTitle: true,
      ),
      body: Column(children: [
        Row(
          children: [
            Text(
              "Nama : Muhamad Wahyu",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        Row(children: [
          Icon(Icons.location_on),
          Text(
            "Jakarta Selatan",
          style: TextStyle(fontSize: 18)
          ,),
            ],
        ),
        Row(children: [
              Expanded(
                child: Text("Saya umur 22 tahun, kegiatan saya saat ini adalah sedang mengikuti pelatihan kerja di PPKD Jakpus",
                            overflow: TextOverflow.visible,
                            maxLines: 4,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                  ),),
              ),
        ],),
  ] ),);
  }
}