import 'package:flutter/material.dart';

class Switch7 extends StatefulWidget {
  const Switch7({super.key});

  @override
  State<Switch7> createState() => _Switch7State();
}

class _Switch7State extends State<Switch7> {

  bool onOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: onOff ? Colors.blueGrey : Colors.blue,
      //   centerTitle: true,
      //   title: Text("Pilih Mode",
      //   style: TextStyle(
      //     fontSize: 24,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //   ),
      //   ),
      //  ),

       body: Container(
                    color: onOff ? const Color.fromARGB(255, 43, 64, 67) :const Color.fromARGB(255, 178, 229, 255),
         child: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
            
              children: [
                Text("Pilih Mode Aplikasi Anda",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),
                ),
                Switch(
                value: onOff, 
                onChanged: (bool? Value) {
                  setState(() {
                    onOff = Value ?? false;
                  });
                }
                ),
                Text(onOff ?
                "Mode Gelap" : "Mode Terang",
                style: TextStyle(
                  color: onOff ?
                  Colors.white : 
                  Colors.black
                ),
                )
              ],
            ),
          ),
         ),
       ),
      );
  }
}