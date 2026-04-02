import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wahyu_belajar_flutter/day16/SQL/database/preferences.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/API/endpoint.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/models/get_model.dart';

// class Repository {

// }
Future<GetUserModel?> getUser() async {
  var token = await PreferenceHandler.getToken();

  final response = await http.get(
    Uri.parse(Endpoint.profile), // ✅ FIX endpoint
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token", // ✅ FIX header
    },
  );

  log("PROFILE RESPONSE: ${response.body}");

  if (response.statusCode == 200) {
    return GetUserModel.fromJson(json.decode(response.body));
  } else {
    final error = GetUserModel.fromJson(json.decode(response.body));
    log(error.toString());

    throw Exception(error.message);
  }
}
