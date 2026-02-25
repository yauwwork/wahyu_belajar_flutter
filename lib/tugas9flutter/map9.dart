import 'package:flutter/material.dart';

class MapT9 extends StatelessWidget {
  MapT9({super.key});

  final List<Map<String, dynamic>> dataPengguna = [
    {
     "Nama" : "Imam",
     "Alamat" : "Jaktim",
     "Pesanan" : "Ayam 15 Kg",
     "Foto" : "https://i.pinimg.com/736x/b8/ea/cc/b8eacc6c797b6c72643c5895d27af57c.jpg"
    },
    {
     "Nama" : "Joshua",
     "Alamat" : "Jakut",
     "Pesanan" : "Lele 20 Kg",
     "Foto" : "https://i.pinimg.com/736x/6a/9e/d1/6a9ed1474dfd220b26d1fd39cc66fbdf.jpg"
    },
    {
    "Nama": "Rizky",
    "Alamat": "Bekasi",
    "Pesanan": "Cabai 10 Kg",
    "Foto": "https://i.pinimg.com/736x/5e/f5/47/5ef54790ca25b57922d3c3e8301dc5bf.jpg"
  },
  {
    "Nama": "Andi",
    "Alamat": "Depok",
    "Pesanan": "Tomat 8 Kg",
    "Foto": "https://i.pinimg.com/736x/d5/a2/27/d5a227bfe3cc89b94e2202a8bf77adf2.jpg"
  },
  {
    "Nama": "Fajar",
    "Alamat": "Bogor",
    "Pesanan": "Padi 50 Kg",
    "Foto": "https://i.pinimg.com/736x/80/f0/11/80f01190c482ef60e67bca2d03bcd04d.jpg"
  },
  {
    "Nama": "Dimas",
    "Alamat": "Tangsel",
    "Pesanan": "Jagung 30 Kg",
    "Foto": "https://i.pinimg.com/736x/bb/a4/fe/bba4fe5c0e00461b625e914db778b514.jpg"
  },
  {
    "Nama": "Rian",
    "Alamat": "Jaktim",
    "Pesanan": "Ikan Nila 12 Kg",
    "Foto": "https://i.pinimg.com/736x/7f/26/1f/7f261ffca4a0b0f0dbaf588dc5e4f06f.jpg"
  },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 255, 237, 237),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 176, 176),
        title: Text("Map",
        style: TextStyle(
          fontSize: 36,
          color: Colors.white
        ),
        ),
      ),

      body: ListView.builder(
        itemCount: dataPengguna.length,
        itemBuilder: (BuildContext context, int index) {
          final data = dataPengguna[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data["Foto"])
            ),
            title: Text(data["Nama"]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data["Alamat"]),
                Text(data["Pesanan"]),
              ],
            ) 
          );
        },
      ),
    );
  }
}