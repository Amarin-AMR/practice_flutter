import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pokemon_team/models/pokemon_info.dart';
import 'package:pokemon_team/models/pokemon_list.dart';

class GetDataProvider with ChangeNotifier {
  PokemonList responseData = PokemonList();
  PokemonInfo responsePokemon = PokemonInfo();
  List<PokemonInfo> teamPokemon = <PokemonInfo>[];
  String name = '';

  // List teampokemon = [];

  bool isLoading = false;

  getMyData() async {
    isLoading = true;
    responseData = await getAllData();
    isLoading = false;
    notifyListeners();
  }

  getPokemonData(String url) async {
    isLoading = true;
    responsePokemon = await getEachData(url);
    isLoading = false;
    notifyListeners();
  }

  getName() async {
    name = responsePokemon.name.toString();
    notifyListeners();
  }

  selectTeam(String url) async {
    isLoading = true;
    responsePokemon = await getEachData(url);
    isLoading = false;
    if (teamPokemon.length <= 5) {
      teamPokemon.contains(responsePokemon)
          ? teamPokemon.remove(responsePokemon)
          : teamPokemon.add(
              responsePokemon,
            );
    } else if (teamPokemon.length == 6) {
      if (teamPokemon.contains(responsePokemon)) {
        teamPokemon.remove(responsePokemon);
      }
    }
    notifyListeners();
  }

  // getTeamInfo() async {
  //   isLoading = true;
  //   responseData = await getAllData();
  //   for (int i = 0; i < 62; i++) {
  //     responsePokemon =
  //         await getEachData(responseData.results![i].url.toString());
  //     responsepoke.add(responsePokemon);
  //     debugPrint(responsepoke.length.toString());
  //   }
  //   isLoading = false;
  //   notifyListeners();
  // }

  Future<PokemonList> getAllData() async {
    try {
      final response = await http.get(
          Uri.parse("https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1300"));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        responseData = PokemonList.fromJson(item);
        notifyListeners();
      } else {
        debugPrint("else");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return responseData;
  }

  Future<PokemonInfo> getEachData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        responsePokemon = PokemonInfo.fromJson(item);
        notifyListeners();
      } else {
        debugPrint("else");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return responsePokemon;
  }
}
