import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/SQL/database/preferences.dart';
import 'package:wahyu_belajar_flutter/tugas10flutter/homepage.dart';
import 'package:wahyu_belajar_flutter/tugas11flutter/loginagrova.dart';
import 'package:wahyu_belajar_flutter/tugas11flutter/navigator.dart';

class SplashSc11 extends StatefulWidget {
  const SplashSc11({super.key});

  @override
  State<SplashSc11> createState() => _SplashSc11State();
}

class _SplashSc11State extends State<SplashSc11> {
  @override
  void initState() {
    super.initState();
    autologin();
  }

  void autologin() async {
    await Future.delayed(Duration(seconds: 3));
    bool? data = await PreferenceHandler.getIsLogin();
    print(data);
    print("Hai, Yauw");
    if (data == true) {
      context.pushAndRemoveAll(Home10(nama: '', alamat: '', telepon: ''));
    } else {
      context.pushAndRemoveAll(LoginAgrovaPage());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4CAF84),
              Color(0xFF2F80ED),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // LOGO
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.eco,
                size: 80,
                color: Color(0xFF4CAF84),
              ),
            ),

            SizedBox(height: 30),

            Text(
              "Agrova",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            Text(
              "Terhubung dengan sumber terbaik",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}