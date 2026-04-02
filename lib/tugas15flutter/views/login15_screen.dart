import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/day16/SQL/database/preferences.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/API/login.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/models/login_model.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/views/register15_screen.dart';

class Login15Page extends StatefulWidget {
  const Login15Page({super.key});

  @override
  State<Login15Page> createState() => _Login15PageState();
}

class _Login15PageState extends State<Login15Page> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool isObscurePassword = true;

  @override
  void initState() {
    super.initState();
    PreferenceHandler().init();
  }

  Future<void> login() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email dan password wajib diisi'),
        ),
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      LoginModel? response = await loginUser(
        email: emailController.text,
        password: passwordController.text,
      );

      if (response != null) {
        await PreferenceHandler().storingIsLogin(true);

        if (response.data?.token != null) {
          await PreferenceHandler().storingToken(
            response.data!.token!,
          );
        }

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? 'Login berhasil'),
          ),
        );

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const HomePage(),
        //   ),
        // );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceAll('Exception: ', '')),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              const Text(
                'Login here',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2141D0),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Welcome back you’ve\nbeen missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 50),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xff2141D0),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xff2141D0),
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: isObscurePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: const Color(0xffEFEFF4),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                    icon: Icon(
                      isObscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // pindah ke halaman forgot password
                  },
                  child: const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: Color(0xff2141D0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: isLoading ? null : login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2141D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 30),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Register15Page(),
                    ),
                  );
                },
                child: const Text(
                  'Create new account',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Or continue with',
                style: TextStyle(
                  color: Color(0xff2141D0),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialButton(Icons.g_mobiledata),
                  const SizedBox(width: 12),
                  socialButton(Icons.facebook),
                  const SizedBox(width: 12),
                  socialButton(Icons.apple),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialButton(IconData icon) {
    return Container(
      width: 60,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xffEFEFF4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon),
    );
  }
}
