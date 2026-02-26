import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/tugas10flutter/homepage.dart';
import 'package:wahyu_belajar_flutter/tugas10flutter/navigator.dart';

class Tugas10Flutter extends StatefulWidget {
  const Tugas10Flutter({super.key});

  @override
  State<Tugas10Flutter> createState() => _Tugas10FlutterState();
}

class _Tugas10FlutterState extends State<Tugas10Flutter> {

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telponController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      
      body: Column(
        children: [ 
          Column(
            children: [
              SizedBox(height:32),
              Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                            Color(0xFF4CAF50),
                            Color(0xFF2F6BFF),
                          ],
                          begin: AlignmentGeometry.topLeft,
                          end: AlignmentGeometry.bottomRight
                          ),
              ),
              child: Icon(Icons.eco,
              color: Colors.white,
              size: 75,
              ),
                      ),
              Text("Agrova",
              style: TextStyle(
                color: Color(0xFF2F6BFF),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              ),
              Text("Terhubung Dengan Sumber Terbaik",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              )
            ],
          ),
        

          SizedBox(height: 32),
          
          Center(),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(243, 255, 255, 255),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 4),
              )
              ],
            ),
            height: 525,
            width: 350,

            padding: EdgeInsets.all(24),
            
            
            child: Form(
              key: _formKey,
              child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Buat Akun",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),

                SizedBox(height: 20),

                // Text("Nama",
                // textAlign: TextAlign.start,
                // style: TextStyle(
                //   fontSize: 16,
                //   fontWeight: FontWeight.w500,
                // ),
                // ),

                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukan Nama Lengkap Anda",
                    labelText: "Nama",
                    prefixIcon: Icon(Icons.person)
                  ),
                  controller: namaController,
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "Nama Harus Diisi";
                    }
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return "Nama harus mengandung minimal 1 huruf besar";
                    }
                    else {return null;}
                  },
                ),

                SizedBox(height: 12),

                 TextFormField(
                 decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukan email anda",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.mail)
                 ),
                 controller: emailController,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                    return "Email harus diisi";
                   }
                   else if (!value.contains("@")) {
                    return "Email tidak valid";
                   }
                   else {
                    return null;
                   }
                 },
                  ),

                  SizedBox(height: 12),

                  TextFormField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukan nomor telpon anda",
                  labelText: "Nomor Telpon",
                  prefixIcon: Icon(Icons.phone)
                 ),
                 controller: telponController,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                    return "Nomer telpon harus diisi";
                   }
                   if (!RegExp(r'^\d+$').hasMatch(value)) {
                  return "Nomor telepon hanya boleh angka";
                 }
                 }
                  ),

                  SizedBox(height: 12),

                  TextFormField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukan nomor alamat anda",
                  labelText: "Alamat Domisili",
                  prefixIcon: Icon(Icons.pin_drop)
                 ),
                 controller: alamatController,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                    return "Alamat harus diisi bro";
                   }
                 },
                 ),

                 SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Berhasil Tervalidasi");
                        dialogerror(context);
                      } else {
                        print("Tidak Berhasil Divalidasi");
                      }
                    },
                    child: Text("Daftar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    )
                    ),
                )
              ],
            ),
       ),
      ),
     ],
     ), 
     );
  }
  Future<dynamic> dialogerror (BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Selamat Anda Berhasil",
          style: TextStyle(
            fontSize: 24,
          ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Periksa Kembali Data Anda"),
              SizedBox(height: 8),
              Text("Nama : ${namaController.text}"),
              Text("Alamat : ${alamatController.text}"),
              Text("No Telpon : ${telponController.text}"),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: (){
                        context.pop();
                      }, 
                      child: Text("Batal",
                      style: TextStyle(
                        color: Colors.red
                      ),
                      ),
                      ),
                      ),

                      SizedBox(height: 20),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                        context.push(
                          Home10(
                            nama: namaController.text, 
                            alamat: alamatController.text, 
                            telepon: telponController.text),
                        );
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "Konirmasi"
                      )))
                ],
              )
            ],
          ),
        );
      }
      );
  }
}