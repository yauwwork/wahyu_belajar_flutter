import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/SQL/database/preferences.dart';
import 'package:wahyu_belajar_flutter/SQL/database/sqflite.dart';
import 'package:wahyu_belajar_flutter/SQL/models/user_models.dart';
import 'package:wahyu_belajar_flutter/tugas10flutter/homepage.dart';
import 'package:wahyu_belajar_flutter/tugas10flutter/navigator.dart';

class LoginAgrovaPage extends StatefulWidget {
  const LoginAgrovaPage({super.key});

  @override
  State<LoginAgrovaPage> createState() => _LoginAgrovaPageState();
}

class _LoginAgrovaPageState extends State<LoginAgrovaPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// LOGO
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4CAF50),
                      Color(0xFF2196F3),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.eco,
                  color: Colors.white,
                  size: 50,
                ),
              ),

              const SizedBox(height: 15),

              /// TITLE
              const Text(
                "Agrova",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F5BD3),
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Terhubung dengan sumber terbaik",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),

              /// CARD LOGIN
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// EMAIL
                    const Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "kambingjantan@gmail.com",
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(vertical: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    // TextField(
                    //   controller: emailController,
                    //   decoration: InputDecoration(
                    //     hintText: "kambingjantan@gmail.com",
                    //     prefixIcon: const Icon(Icons.email_outlined),
                    //     filled: true,
                    //     fillColor: Colors.grey[100],
                    //     contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(height: 20),

                    /// PASSWORD
                    const Text(
                      "Password",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: passwordController,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        hintText: "Masukan Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(vertical: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Lupa Password?",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// BUTTON MASUK
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          final UserModel? login = await DBHelper.loginUser(
                            email: emailController.text, 
                            password: passwordController.text);
                        
                        if (login != null) {
                          PreferenceHandler().storingIsLogin(true);
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content:Text("Login berhasil")));
                          await Future.delayed(Duration(seconds: 2));
                          context.push(Home10(alamat: "",nama: "", telepon: "",));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login Gagal, email atau password tidak terdaftar",
                              ),
                              ),
                          );
                        }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.zero,
                          elevation: 0,
                        ),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF2F5BD3),
                                Color(0xFF4C7DF0),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Center(
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// BUTTON BUAT AKUN
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text("Login Dengan Google"),
                      ),
                    ),

                    SizedBox(height: 8),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          DBHelper.registerUser
                          (
                          UserModel(
                            email: emailController.text,
                            password: passwordController.text,
                          
                          ));

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Pendaftaran Berhasil")),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text("Daftar"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}