import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wahyu_belajar_flutter/tugas15flutter/API/endpoint.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/models/profil_model.dart';

Future<ProfileModel?> getProfile(String token) async {
  final response = await http.get(
    Uri.parse(Endpoint.profile), // ✅ pastikan ini BUKAN /register
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token", // 🔑 penting
    },
  );

  print(response.body);

  if (response.statusCode == 200) {
    return ProfileModel.fromJson(json.decode(response.body));
  } else {
    throw Exception("Gagal ambil profil");
  }
}
