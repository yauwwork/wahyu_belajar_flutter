import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wahyu_belajar_flutter/tugas15flutter/API/endpoint.dart';
import 'package:wahyu_belajar_flutter/tugas15flutter/models/login_model.dart';

Future<LoginModel?> loginUser({
  required String email,
  required String password,
}) async {
  final response = await http.post(
    Uri.parse(Endpoint.login),
    headers: {"Accept": "application/json"},
    body: {
      "email": email,
      "password": password,
    },
  );

  print(response.body);

  if (response.statusCode == 200) {
    return LoginModel.fromJson(json.decode(response.body));
  } else {
    final error = LoginModel.fromJson(json.decode(response.body));
    print(error.toString());

    throw Exception(error.message);
  }
}