class Pokemon {
  final String name;
  final String image;
  final List<String> types;
  final List<String> abilities;

  /// 🔥 TAMBAHAN
  final Map<String, int> stats;

  Pokemon({
    required this.name,
    required this.image,
    required this.types,
    required this.abilities,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      image: json['sprites']['front_default'] ?? "",
      types: List<String>.from(json['types'].map((e) => e['type']['name'])),
      abilities: List<String>.from(
        json['abilities'].map((e) => e['ability']['name']),
      ),

      /// 🔥 PARSE STATS
      stats: {
        for (var stat in json['stats']) stat['stat']['name']: stat['base_stat'],
      },
    );
  }
}
