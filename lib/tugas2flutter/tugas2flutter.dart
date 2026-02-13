import 'package:flutter/material.dart';

class Tugas2Flutter extends StatelessWidget {
  const Tugas2Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Soal nomor 1-----------------------------------------------------------
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 66, 66, 255),
        title: Text("Profil Penjual",
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 36,
        ),
        ),
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 238, 238),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 200,
                    height: 250,

            //Soal Nomor 2------------------------------------------------------------------
                    child: Column(
                      children: [
                        Text("Agrova", 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        ),

              // Soal nomor 3---------------------------------------------------------------------------
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 152, 152, 255),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Padding(padding: 
                                    EdgeInsetsGeometry.symmetric( horizontal: 16),),
                                    Icon(Icons.mail),
                                    Text("Email : ilhamqurban@gmail.com",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 152, 152, 255),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(padding: 
                                      EdgeInsetsGeometry.symmetric( horizontal: 16),
                                      ),
                                      Icon(Icons.phone),
                                      Text("Nomor Telpon : 0813-1242-1234",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                      )
                                    ],
                                  ),
                              ),
                            )
                          ],
                        ),

                   //Soal Nomor 4--------------------------------------------------
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 152, 152, 255),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Padding(padding: 
                                    EdgeInsetsGeometry.symmetric(horizontal: 16),
                                    ),
                                    Icon(Icons.location_city),
                                    Text("Kemang, Jakarta Selatan",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ), 

            // Soal Nomor 5--------------------------------------------------------------------
            SizedBox(height: 20,),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      width: 170,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 211, 51, 171),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("Instagram", textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Spacer(),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 25),
                      width: 170,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 10, 199, 82),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("WhatsApp", textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    )
                  ],
                )
                  ],
                )
              ],
            ),

            //Soal Nomor 6-------------------------------------------------------------------
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 152, 152, 255),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("Agrova dari kata 'Agriculture' 'Variation' yang berati beragam produk hasil bumi. Agrova dibuat sebagai wadah untul memperkenalkan produk hasil lokal.",
                  textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            //Soal Nomor 7---------------------------------------------------------------------
            SizedBox(height: 20,),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: 220,
                  width: 220,
                  child: Image.asset("assets/images/download.jpg"),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(240, 197, 197, 241),
    );
  }
}