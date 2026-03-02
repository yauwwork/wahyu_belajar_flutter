import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/day16/SQL/database/siswa_controller.dart';
import 'package:wahyu_belajar_flutter/day16/SQL/models/siswa_model.dart';
import 'package:wahyu_belajar_flutter/utils/decoration_form.dart';

class CrSiswa extends StatefulWidget {
  const CrSiswa({super.key});

  @override
  State<CrSiswa> createState() => _CrSiswaState();
}

class _CrSiswaState extends State<CrSiswa> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController kelascontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: namecontroller,
              decoration: decorationConstant(hintText: "Masukan Nama Siswa"),
            ),

            SizedBox(height: 8),

            TextFormField(
              controller: kelascontroller,
              decoration: decorationConstant(hintText: "Masukan Kelas Siswa"),
            ),

            SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (namecontroller.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Nama Belum Disi BOSSS!")),
                    );
                    return;
                  }
                  if (kelascontroller.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Kelasnya Isi dulu BOSS!")),
                    );
                    return;
                  }
                  SiswaController.registerSiswa(
                    SiswaModel(
                      nama: namecontroller.text,
                      kelas: kelascontroller.text,
                    ),
                  );
                  namecontroller.clear();
                  kelascontroller.clear();
                  setState(() {});
                },
                child: Text("Tambah Siswa"),
              ),
            ),

            SizedBox(height: 24),

            siswaWidget(),
          ],
        ),
      ),
    );
  }
}

FutureBuilder<List<SiswaModel>> siswaWidget() {
  return FutureBuilder<List<SiswaModel>>(
    future: SiswaController.getAllSiswa(),

    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      final dataSiswa = snapshot.data as List<SiswaModel>;
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dataSiswa.length,
        itemBuilder: (BuildContext context, int index) {
          final items = dataSiswa[index];
          return ListTile(title: Text(items.nama), subtitle: Text(items.kelas));
        },
      );
    },
  );
}
