import 'package:flutter/material.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text("Input Data dan Daftar Produk",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Input Data Diri Anda",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          ),

          SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              labelText: "Nama Produk",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),
          
          SizedBox(height: 12),

          TextField(
            decoration: InputDecoration(
              labelText: "Alamat Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),
          
          SizedBox(height: 12),

          TextField(
            decoration: InputDecoration(
              labelText: "No Handphone/WhatsApp",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),
          
          SizedBox(height: 12),

          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Deskripsi Produk",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),

           SizedBox(height: 20),

            Text("Daftar Produk",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          ),

          ListTile(
            leading: Icon(Icons.grass, color: Colors.green,),
            title: Text("Bibit Padi Premium"),
            subtitle: Text("Harga RP 15.000/Kg"),
          ),

          Divider(),
          
          ListTile(
            leading: Icon(Icons.set_meal, color: Colors.blue,),
            title: Text("Ikan Pesut Mahakam"),
            subtitle: Text("Harga RP 35.000/Kg"),
          ),

          Divider(),
          
          ListTile(
            leading: Icon(Icons.moped, color: Colors.red,),
            title: Text("Vespa Sprint"),
            subtitle: Text("Harga RP 55.000.000/Unit"),
          ),

          Divider(),
          
          ListTile(
            leading: Icon(Icons.park, color: Colors.yellow,),
            title: Text("Bibit Pohon Sawit"),
            subtitle: Text("Harga RP 10.000/Buah"),
          ),

          Divider(),
          
          ListTile(
            leading: Icon(Icons.pest_control_rodent, color: Colors.blueGrey,),
            title: Text("Mencit untuk pakan hewan"),
            subtitle: Text("Harga RP 5.000/Ekor"),
          ),

          Divider(),
          
          ListTile(
            leading: Icon(Icons.apple, color: Colors.red,),
            title: Text("Apel Malang"),
            subtitle: Text("Harga RP 25.000/Kg"),
          ),

          Divider(),
          
          ListTile(
            leading: Icon(Icons.rocket, color: const Color.fromARGB(255, 31, 248, 255),),
            title: Text("Roket Space X"),
            subtitle: Text("Harga RP 250.000.000.000./Unit"),
          ),

          Divider(),

        ],
      )
    );
  }
}