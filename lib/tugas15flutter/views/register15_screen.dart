import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/day16/SQL/database/preferences.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/API/register.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/models/register_model.dart';

class Register15Page extends StatefulWidget {
  const Register15Page({super.key});

  @override
  State<Register15Page> createState() => _Register15PageState();
}

class _Register15PageState extends State<Register15Page> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isLoading = false;
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  @override
void initState() {
  super.initState();
  PreferenceHandler().init();
}

  Future<void> register() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua field wajib diisi'),
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password dan konfirmasi password tidak sama'),
        ),
      );
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      RegisterModel? response = await registerUser(
        name: nameController.text,
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
            content: Text(response.message ?? 'Register berhasil'),
          ),
        );
        Navigator.pop(context);

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
          content: Text(e.toString()),
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
              const SizedBox(height: 40),

              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2141D0),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Create an account so you can explore all the existing jobs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xff2141D0),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xff2141D0),
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

              const SizedBox(height: 20),

              TextField(
                controller: confirmPasswordController,
                obscureText: isObscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: const Color(0xffEFEFF4),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureConfirmPassword =
                            !isObscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      isObscureConfirmPassword
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

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: isLoading ? null : register,
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
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}