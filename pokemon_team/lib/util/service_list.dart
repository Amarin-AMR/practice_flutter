import 'package:pokemon_team/models/pokemon_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<PokemonList> fetchPokemonList(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return PokemonList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
