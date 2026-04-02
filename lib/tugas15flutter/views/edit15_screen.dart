import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/API/edit_profil.dart';

class Edit15Screen extends StatefulWidget {
  final String name;
  final String email;

  const Edit15Screen({super.key, required this.name, required this.email});

  @override
  State<Edit15Screen> createState() => _Edit15ScreenState();
}

class _Edit15ScreenState extends State<Edit15Screen> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  final TextEditingController dateController = TextEditingController(
    text: "27/01/1995",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "(308) 555-0121",
  );

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    /// 🔥 AUTO ISI DARI PROFILE
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// 🔥 AVATAR
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.person, size: 50),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// NAME
            buildField(
              controller: nameController,
              icon: Icons.person_outline,
              hint: "Nama",
            ),

            const SizedBox(height: 16),

            /// DATE
            buildField(
              controller: dateController,
              icon: Icons.calendar_today_outlined,
              hint: "Tanggal Lahir",
            ),

            const SizedBox(height: 16),

            /// EMAIL
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: "Email",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// PHONE
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text("+62"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "Nomor HP",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// 🔥 SAVE BUTTON (SUDAH API)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: isLoading
                    ? null
                    : () async {
                        try {
                          setState(() => isLoading = true);

                          await updateProfile(
                            name: nameController.text,
                            email: emailController.text,
                          );

                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Berhasil update profil"),
                            ),
                          );

                          Navigator.pop(context, true); // 🔥 trigger refresh
                        } catch (e) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(e.toString())));
                        } finally {
                          setState(() => isLoading = false);
                        }
                      },
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
