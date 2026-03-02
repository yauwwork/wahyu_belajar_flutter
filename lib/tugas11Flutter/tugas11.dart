import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/day16/SQL/database/sqflite.dart';
import 'package:wahyu_belajar_flutter/day16/navigator.dart';
import 'package:wahyu_belajar_flutter/tugas11Flutter/listproduk.dart';
import 'package:wahyu_belajar_flutter/tugas11Flutter/produk_model.dart';

class Tugas11Flutter extends StatefulWidget {
  const Tugas11Flutter({super.key});

  @override
  State<Tugas11Flutter> createState() => _Tugas11FlutterState();
}

class _Tugas11FlutterState extends State<Tugas11Flutter> {
  final TextEditingController namacontroller = TextEditingController();
  final TextEditingController telponcontroller = TextEditingController();
  final TextEditingController alamatcontroller = TextEditingController();
  final TextEditingController produkcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "Input data penjual di Agrova",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: namacontroller,
                decoration: formdecoration(
                  hintText: "Mausukan nama anda",
                  labelText: "Nama",
                ),
              ),

              SizedBox(height: 12),

              TextFormField(
                controller: telponcontroller,
                decoration: formdecoration(
                  hintText: "Mausukan nomor telpon anda",
                  labelText: "Nomor Telpon",
                ),
              ),

              SizedBox(height: 12),

              TextFormField(
                controller: alamatcontroller,
                decoration: formdecoration(
                  hintText: "Mausukan alamat anda",
                  labelText: "Alamat",
                ),
              ),

              SizedBox(height: 12),

              TextFormField(
                controller: produkcontroller,
                decoration: formdecoration(
                  hintText: "Mausukan Produk anda",
                  labelText: "Produk",
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (namacontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Nama Belum Disi")),
                      );
                      return;
                    }
                    if (telponcontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Nomer Harus Disi")),
                      );
                      return;
                    }
                    if (alamatcontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Alamat Belum Tercantum")),
                      );
                      return;
                    }
                    if (produkcontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Mohon Masukan Produk Anda")),
                      );
                      return;
                    }
                    ProdukController.registerProduk(
                      ProdukModel(
                        nama: namacontroller.text,
                        telepon: telponcontroller.text,
                        alamat: alamatcontroller.text,
                        produk: produkcontroller.text,
                      ),
                    );
                    namacontroller.clear();
                    telponcontroller.clear();
                    alamatcontroller.clear();
                    produkcontroller.clear();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text(
                    "Tambah Data",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 4),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {
                    context.push(ListSc());
                  },
                  child: Text("Lihat Data Lebih Lengkap"),
                ),
              ),

              produkWidget(),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration formdecoration({
    required String hintText,
    required String labelText,
  }) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.blueAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.blue, width: 3),
      ),
    );
  }
}

class ProdukController {
  static Future<void> registerProduk(ProdukModel produk) async {
    final dbs = await DBHelper.db();
    await dbs.insert('produk', produk.toMap());
    print(produk.toMap());
  }

  static Future<List<ProdukModel>> getAllProduk() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query("produk");
    print(results.map((e) => ProdukModel.fromMap(e)).toList());
    return results.map((e) => ProdukModel.fromMap(e)).toList();
  }
}

FutureBuilder<List<ProdukModel>> produkWidget() {
  return FutureBuilder<List<ProdukModel>>(
    future: ProdukController.getAllProduk(),

    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      final dataProduk = snapshot.data as List<ProdukModel>;
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
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
                Text("${items.telepon}"),
                Text("${items.alamat}"),
                Text("${items.produk}"),
                Divider(height: 8),
              ],
            ),
          );
        },
      );
    },
  );
}
