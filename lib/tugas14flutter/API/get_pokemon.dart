import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon_model.dart';

class PokemonApi {
  static const String baseUrl = "https://pokeapi.co/api/v2/pokemon";

  /// 🔥 SUPPORT INFINITE SCROLL (limit + offset)
  static Future<List<Pokemon>> getPokemons({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      // 1. Ambil list (pakai offset)
      final response = await http.get(
        Uri.parse("$baseUrl?limit=$limit&offset=$offset"),
      );

      if (response.statusCode != 200) {
        throw Exception("Failed to load list");
      }

      final data = json.decode(response.body);
      final List results = data['results'];

      // 2. Ambil detail secara PARALLEL
      List<Future<Pokemon>> futures = results.map((item) async {
        final detailResponse = await http.get(Uri.parse(item['url']));

        if (detailResponse.statusCode != 200) {
          throw Exception("Failed detail");
        }

        final detailData = json.decode(detailResponse.body);
        return Pokemon.fromJson(detailData);
      }).toList();

      // 🔥 PARALLEL EXECUTION
      return await Future.wait(futures);
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
