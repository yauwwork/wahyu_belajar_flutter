import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/API/get_user.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/models/get_model.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/views/edit15_screen.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/views/login15_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<GetUserModel?> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        backgroundColor: Color(0xff2141D0),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xffffffff),
          ),
        ),
      ),
      body: FutureBuilder<GetUserModel?>(
        future: futureUser,
        builder: (context, snapshot) {
          /// ⏳ LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          /// ❌ ERROR
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          /// ❌ DATA KOSONG
          if (!snapshot.hasData || snapshot.data?.data == null) {
            return const Center(child: Text("Data tidak ditemukan"));
          }

          /// ✅ DATA ADA
          final user = snapshot.data!.data!;

          return Center(
            child: Column(
              children: [
                const SizedBox(height: 20),

                /// 🔥 AVATAR
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.person, size: 50),
                ),

                const SizedBox(height: 16),

                /// 🔥 NAMA
                Text(
                  user.name ?? "-",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                /// 🔥 EMAIL + CHECK ICON
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.email ?? "-",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 18,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                /// 🔥 BUTTON EDIT
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      /// 🔵 EDIT PROFILE (BIRU)
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2141D0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Edit15Screen(
                                  name: user.name ?? "",
                                  email: user.email ?? "",
                                ),
                              ),
                            );

                            if (result == true) {
                              setState(() {
                                futureUser = getUser(); // refresh data
                              });
                            }
                          },
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// 🔴 LOGOUT (MERAH)
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => Login15Page()),
                              (Route) => false,
                            );
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
