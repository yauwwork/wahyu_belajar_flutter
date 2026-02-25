import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/tugas9flutter/datapenjual.dart';

class ModelT9 extends StatelessWidget {
  const ModelT9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 255, 237, 237),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 176, 176),
        title: Text("Model",
        style: TextStyle(
          fontSize: 36,
          color: Colors.white
        ),
        ),
      ),

      body: ListView.builder(
        itemCount: dataPenjual.length,
        itemBuilder: (BuildContext context, int index) {
          final data = dataPenjual[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data.fotoProduk ?? ''),
            ),
            title: Text(data.nama ?? ''),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(data.alamat ?? ''),
                Text(data.produk ?? '')
              ],
            )
           
          );
        },
      ),
    );
  }
}