import 'package:flutter/material.dart';

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
    case "dark":
      return Colors.black87;
    default:
      return Colors.grey;
  }
}
