import 'package:flutter/material.dart';

class DropDown7 extends StatefulWidget {
  const DropDown7({super.key});

  @override
  State<DropDown7> createState() => _DropDown7State();
}

String ? selected7;

class _DropDown7State extends State<DropDown7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueAccent,
      //   centerTitle: true,
      //   title: Text("Kategori Produk",
      //   style: TextStyle(
      //     fontSize: 24,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //   ),
      //   ),
      // ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Text("Pilih Kategori Produk Anda",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                ),

                DropdownButton <String>(
                  value: selected7,
                  hint: Text("Pilih Kategori Produk"),
                  items: {'Ikan', 'Sayur', 'Buah', 'Daging', 'Telur', 'Hasil Laut Lain'}.map((String val) {
                    return DropdownMenuItem(value: val, child: Text(val));
                  }). toList (),
                  onChanged: (val) {
                    setState (() {
                      selected7 = val;
                    },);
                  }
                  )
          ],
        ),
      )
    );
  }
}