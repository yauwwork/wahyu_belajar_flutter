import 'package:flutter/material.dart';

class Tugas2Flutter extends StatelessWidget {
  const Tugas2Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    //Soal Nomor 1 -----------------------------------------
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 247, 255),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [Color(0xff54D151),
              Color(0xff245DE2)
              ],
            ),
          ),
        ), 
        title: Text("Agrova",
        style: TextStyle(
          color: Color.fromARGB(255, 228, 226, 226),
          fontWeight: FontWeight.bold,
          fontSize: 38,
        ),
        ),
        centerTitle: true,
        ),

    //Soal Nomor 2 -----------------------------------------
        body: Column(
          children: [
            Center(
              child: Text(
                "DASHBOARD PENJUAL",
                  style: TextStyle( 
                    color: Color(0xff245DE2),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    ),
                  )
                ),
              Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Color(0xff245DE2),
                ),
                SizedBox(width: 10),
                Text(
                  "workwithyauw@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
              
            Container(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Color(0xff54d151),
                  ),

                  Text(
                    "0813-3123-1234",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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