import 'package:flutter/material.dart';
import 'package:pokemon_team/components/futurelist.dart';
import 'package:pokemon_team/components/futureteam.dart';
import 'package:pokemon_team/models/pokemon_info.dart';
import 'package:pokemon_team/screens/provider/getdata.dart';
import 'package:pokemon_team/util/service_info.dart';

class TeamList extends StatefulWidget {
  // static const String id = 'team_screen';
  const TeamList({super.key});

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  List<Future<PokemonInfo>>? pokemonInfo = [];

  @override
  void initState() {
    GetDataProvider().teamPokemon;
    for (int i = 0; i < pokemonURL.length; i++) {
      pokemonInfo?.add(
        fetchPokemonInfo(
          pokemonURL[i],
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Team'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/card_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              for (int i = 0; i < pokemonURL.length; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (i % 2 == 0)
                        ? FutureTeam(pokemonInfo: pokemonInfo![i])
                        : const SizedBox(),
                    if (i % 2 == 1) FutureTeam(pokemonInfo: pokemonInfo![i]),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
