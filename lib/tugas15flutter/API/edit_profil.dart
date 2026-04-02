import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wahyu_belajar_flutter/day16/SQL/database/preferences.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/API/endpoint.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/models/profil_model.dart';

Future<ProfileModel?> updateProfile({
  // required String token,
  required String name,
  required String email,
}) async {
  var token = await PreferenceHandler.getToken();

  final response = await http.put(
    Uri.parse(Endpoint.updateProfile), // ✅ endpoint
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: {"name": name, "email": email},
  );

  print("STATUS: ${response.statusCode}");
  print("UPDATE RESPONSE: ${response.body}");

  if (response.statusCode == 200) {
    return ProfileModel.fromJson(json.decode(response.body));
  } else {
    throw Exception("Gagal update profil");
  }
}
