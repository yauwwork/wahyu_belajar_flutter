import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// ================= MODEL =================
class Pokemon {
  final String name;
  final String image;
  final List<String> types;
  final List<String> abilities;

  Pokemon({
    required this.name,
    required this.image,
    required this.types,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      image: json['sprites']['front_default'] ?? "",
      types: List<String>.from(json['types'].map((e) => e['type']['name'])),
      abilities: List<String>.from(
        json['abilities'].map((e) => e['ability']['name']),
      ),
    );
  }
}

/// ================= API =================
class PokemonApi {
  static const String baseUrl = "https://pokeapi.co/api/v2/pokemon";

  static Future<List<Pokemon>> getPokemons({
    int limit = 20,
    int offset = 0,
  }) async {
    final response = await http.get(
      Uri.parse("$baseUrl?limit=$limit&offset=$offset"),
    );

    final data = json.decode(response.body);
    final List results = data['results'];

    List<Future<Pokemon>> futures = results.map((item) async {
      final detailResponse = await http.get(Uri.parse(item['url']));
      final detailData = json.decode(detailResponse.body);
      return Pokemon.fromJson(detailData);
    }).toList();

    return await Future.wait(futures);
  }
}

/// ================= COLOR =================
Color getPokemonColor(String type) {
  switch (type) {
    case "fire":
      return Colors.redAccent;
    case "water":
      return Colors.blueAccent;
    case "grass":
      return Colors.green;
    case "electric":
      return Colors.amber;
    case "psychic":
      return Colors.purpleAccent;
    case "ice":
      return Colors.cyan;
    case "dragon":
      return Colors.indigo;
    default:
      return Colors.grey;
  }
}

/// ================= CARD =================
class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = getPokemonColor(
      pokemon.types.isNotEmpty ? pokemon.types.first : "unknown",
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PokemonDetailScreen(pokemon: pokemon),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(12),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Text(
                  pokemon.name.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Positioned(
                top: 25,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pokemon.types.map((type) {
                    return Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        type,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              Positioned(
                bottom: 0,
                right: 0,
                child: Hero(
                  tag: pokemon.name,
                  child: Image.network(pokemon.image, height: 80),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= DETAIL =================
class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = getPokemonColor(
      pokemon.types.isNotEmpty ? pokemon.types.first : "unknown",
    );

    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ],
            ),

            Text(
              pokemon.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Hero(
              tag: pokemon.name,
              child: Image.network(pokemon.image, height: 150),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Abilities",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: pokemon.abilities
                          .map((e) => Chip(label: Text(e)))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= SCREEN =================
class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<Pokemon> pokemonList = [];
  bool isLoading = false;
  int offset = 0;

  final ScrollController scrollController = ScrollController();

  String searchQuery = "";
  String selectedCategory = "All";

  List<String> categories = [
    "All",
    "grass",
    "fire",
    "water",
    "electric",
    "psychic",
    "ice",
    "dragon",
  ];

  @override
  void initState() {
    super.initState();
    fetchPokemons();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        fetchPokemons();
      }
    });
  }

  Future<void> fetchPokemons() async {
    if (isLoading) return;

    setState(() => isLoading = true);

    final newData = await PokemonApi.getPokemons(limit: 20, offset: offset);

    setState(() {
      offset += 20;
      pokemonList.addAll(newData);
      isLoading = false;
    });
  }

  List<Pokemon> filterPokemon() {
    return pokemonList.where((pokemon) {
      final matchSearch = pokemon.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      final matchCategory = selectedCategory == "All"
          ? true
          : pokemon.types.contains(selectedCategory);

      return matchSearch && matchCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filterPokemon();

    return Scaffold(
      appBar: AppBar(title: const Text("Pokedex")),
      body: Column(
        children: [
          /// SEARCH
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
              decoration: InputDecoration(
                hintText: "Search Pokemon...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          /// CATEGORY
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;

                return GestureDetector(
                  onTap: () {
                    setState(() => selectedCategory = category);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      category.toUpperCase(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          /// GRID
          Expanded(
            child: GridView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(12),
              physics: const BouncingScrollPhysics(),
              itemCount: filtered.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                if (index < filtered.length) {
                  return PokemonCard(pokemon: filtered[index]);
                } else {
                  return isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
