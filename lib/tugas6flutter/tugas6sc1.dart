import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/tugas6flutter/login.dart';
import 'package:wahyu_belajar_flutter/tugas6flutter/lupapassword.dart';

class Tugas6Flutter extends StatefulWidget {
  const Tugas6Flutter({super.key});

  @override
  State<Tugas6Flutter> createState() => _Tugas6FlutterState();
}

class _Tugas6FlutterState extends State<Tugas6Flutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      
      body: Column(
        children: [ 
          Column(
            children: [
              SizedBox(height:150),
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
              SizedBox(height: 2),
              Text("Terhubung Dengan Sumber Terbaik",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              )
            ],
          ),
        

          SizedBox(height: 80,),
          
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
            height: 308,
            width: 350,

            padding: EdgeInsets.all(24),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                ),
                TextField(
                  
                  decoration: InputDecoration(
                  isDense: true,
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Masukan Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                ),
                TextField(
                  
                  decoration: InputDecoration(
                  isDense: true,
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Masukan Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),

                Align( alignment: Alignment.centerRight,
                
                child:  Row( 
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Text("Lupa Password?",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                ),
                TextButton(
                onPressed: () {
                   Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => LupaPassScreen())
                    );
                }, 
                style: TextButton.styleFrom(
                padding: EdgeInsets.zero, // biar rapet
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  "Buat Ulang",
               style: TextStyle(
               fontSize: 12,
               fontWeight: FontWeight.bold,
               color: Color(0xFF2F6BFF),
                ),
                ),
                )
                ],),
                ),

               SizedBox(height: 12),

             SizedBox(
                width: double.infinity,
                height: 35,
                child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => LoginScreen())
                    );
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20)
                  ),
                ),

                   child: Text("Masuk",
                   style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
                ),
               ),

               SizedBox(height: 12),

               SizedBox(
                width: double.infinity,
                height: 35,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context,
                     MaterialPageRoute(builder: (context) => LoginScreen()), 
                     (route) => false );
                  },
               child: Text(
                "Buat Akun",
                style: TextStyle(fontSize: 16),
               ),
               ),
               )


              ],
          ),
          )

        ],

      )
    );
  }
}