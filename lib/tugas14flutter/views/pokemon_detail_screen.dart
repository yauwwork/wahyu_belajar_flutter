import 'package:flutter/material.dart';
import 'package:wahyu_belajar_flutter/tugas14flutter/models/pokemon_model.dart';
import 'package:wahyu_belajar_flutter/tugas14flutter/utils/pokemon_color.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = getPokemonColor(
      pokemon.types.isNotEmpty ? pokemon.types.first : "unknown",
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: color,

        /// 🔥 PINDAHIN TAB KE APPBAR (INI KUNCI)
        appBar: AppBar(
          backgroundColor: color,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text(
            pokemon.name.toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),

          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: "About"),
              Tab(text: "Stats"),
            ],
          ),
        ),

        body: Column(
          children: [
            const SizedBox(height: 10),

            /// IMAGE
            Hero(
              tag: pokemon.name,
              child: Image.network(pokemon.image, height: 150),
            ),

            const SizedBox(height: 20),

            /// CONTENT
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),

                /// 🔥 TAB VIEW
                child: TabBarView(
                  children: [
                    /// ABOUT
                    ListView(
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

                        const SizedBox(height: 20),

                        const Text(
                          "Types",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),

                        Wrap(
                          spacing: 8,
                          children: pokemon.types
                              .map((e) => Chip(label: Text(e)))
                              .toList(),
                        ),
                      ],
                    ),

                    /// STATS
                    ListView(
                      children: pokemon.stats.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 90,
                                child: Text(entry.key.toUpperCase()),
                              ),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: entry.value / 200,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(entry.value.toString()),
                            ],
                          ),
                        );
                      }).toList(),
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
