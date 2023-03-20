import 'package:pokemon_team/models/pokemon_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<PokemonInfo> fetchPokemonInfo(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return PokemonInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
