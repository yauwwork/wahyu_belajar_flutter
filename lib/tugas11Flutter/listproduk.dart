import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/day16/navigator.dart';
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await showEditDialog(context, items);
                          dataProduk = await ProdukController.getAllProduk();
                          setState(() {});
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          await showDeleteDialog(context, items.id!);
                          dataProduk = await ProdukController.getAllProduk();
                          setState(() {});
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Future<void> showEditDialog(BuildContext context, ProdukModel items) async {
    final namaController = TextEditingController(text: items.nama);
    final telponController = TextEditingController(text: items.telepon);
    final alamatController = TextEditingController(text: items.alamat);
    final produkController = TextEditingController(text: items.produk);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Produk"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: namaController,
                decoration: formdecoration(
                  hintText: "Masukan Nama Anda",
                  labelText: "Nama",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: telponController,
                decoration: formdecoration(
                  hintText: "Masukan Nomor Telpon Anda",
                  labelText: "Nomor Telpon",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: alamatController,
                decoration: formdecoration(
                  hintText: "Masukan Alamat Anda",
                  labelText: "Alamat",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: produkController,
                decoration: formdecoration(
                  hintText: "Masukan Produk Anda",
                  labelText: "Produk",
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (items.id == null) {
                  return;
                }
                await ProdukController.updateProduk(
                  ProdukModel(
                    id: items.id,
                    nama: namaController.text,
                    telepon: telponController.text,
                    alamat: alamatController.text,
                    produk: produkController.text,
                  ),
                );
                context.pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Update Produk")));
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteDialog(BuildContext context, int id) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah Anda Ingin Menghapus Produk Ini?"),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                context.pop(true);
              },
              child: Text("Hapus Produk"),
            ),
          ],
        );
      },
    );
    if (confirm == true) {
      await ProdukController.deleteProduk(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Produk Berhasil Dihapus")));
      setState(() {});
    }
  }
}
