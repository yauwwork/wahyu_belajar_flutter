import 'package:flutter/material.dart';

class CheckBox7 extends StatefulWidget {
  const CheckBox7({super.key});

  @override
  State<CheckBox7> createState() => _CheckBox7State();
}

class _CheckBox7State extends State<CheckBox7> {

bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueAccent,
      //   centerTitle: true,
      //   title: Text("Syarat dan Ketentuan",
      //   style: TextStyle(
      //     fontSize: 24,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //   ),
      //   ),
      // ),
      body: 
          
          Center(

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Saya menyetujui semua persyaratan yang berlaku",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                ),
                Checkbox(value: _isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked = newValue ?? false;
                  });
                },
                activeColor: Colors.blue),

              Text(_isChecked ?
               'Lanjutkan pendaftaran diperbolehkan' 
              : 'Anda belum bisa melanjutkan',
              style: TextStyle(
               color:  _isChecked ? 
                Colors.green :
                Colors.red
              ),
              )
              ],
            ),
          ),
    );
  }
}