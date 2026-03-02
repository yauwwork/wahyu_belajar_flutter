import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/tugas11Flutter/produk_model.dart';
import 'package:wahyu_belajar_flutter/tugas11Flutter/tugas11.dart';

class ListSc extends StatefulWidget {
  const ListSc({super.key});

  @override
  State<ListSc> createState() => _ListScState();
}

class _ListScState extends State<ListSc> {
  late List<ProdukModel> dataProduk = [];

  @override
  void initState() {
    super.initState();
    getDataSiswa();
  }

  Future<void> getDataSiswa() async {
    await Future.delayed(Duration(seconds: 3));
    dataProduk = await ProdukController.getAllProduk();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Daftar List Penjual",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: dataProduk.isEmpty || dataProduk == []
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              itemCount: dataProduk.length,
              itemBuilder: (BuildContext context, int index) {
                final items = dataProduk[index];
                return ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    items.nama,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6),
                      Text(items.telepon),
                      Text(items.alamat),
                      Text(items.produk),
                      Divider(height: 8),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
