import 'package:flutter/material.dart';

class Tugas3Flutter extends StatelessWidget {
  const Tugas3Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 149, 204, 232),
        centerTitle: true,
        title: Text("Input Produk Baru",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),

   //Soal Nomor 1-----------------------------------------------------------------------------------------

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Input Produk Dengan Isi Data Dibawah Ini :",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              ),
              
              SizedBox(height: 20),

   //Soal Nomor 2------------------------------------------------------------------------------------------

              TextField(
                decoration: InputDecoration(
                  labelText: "Nama Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
              
              SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  labelText: "Kategori Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),

              SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  labelText: "Harga Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ), 
                ),

                SizedBox(height: 16),

                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Deskripsi Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),

                SizedBox(height: 30),

                Text("Galeri Produk",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                ),

                SizedBox(height: 16),

    //Soal Nomor 3---------------------------------------------------------------------------------------------------------

                GridView.count(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  
                  children: [
                    bulidstack("Telur", Colors.yellow, Icons.egg),
                    bulidstack("Kopi", Colors.brown,Icons.coffee),
                    bulidstack("Teh", Colors.blue, Icons.emoji_food_beverage),
                    bulidstack("Tanaman Hias", Colors.lightGreen, Icons.grass),
                    bulidstack("Ice Cream", Colors.pink, Icons.icecream),
                    bulidstack("Bunga Hias", const Color.fromARGB(255, 166, 108, 242), Icons.local_florist),
                    
               ],
              ),
            ],
          ),
        ),
      ),
    );
  }

    //Soal Nomor 4-------------------------------------------------------------------------------------------------------_

  Container bulidstack(String title, Color color, IconData icon) {
    return Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10)
                    ),
                     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
                  );
  }
}