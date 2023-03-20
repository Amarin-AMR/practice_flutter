import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_team/constant.dart';
import 'package:pokemon_team/models/pokemon_list.dart';
import 'package:pokemon_team/components/dialog.dart';
import 'package:pokemon_team/screens/teamscreen/teamlist_screen.dart';
import 'package:pokemon_team/util/service_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> teamPokemon = [];
List<String> pokemonURL = [];
var url = 'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1300';

class FutureList extends StatefulWidget {
  const FutureList({
    super.key,
    // required this.pokemonInfo,
  });
  // Future<PokemonList> pokemonInfo;

  @override
  State<FutureList> createState() => _FutureListState();
}

class _FutureListState extends State<FutureList> {
  Future<PokemonList>? futurePokemon;
  final ScrollController scrollController = ScrollController();
  int listMax = 20;

  @override
  void initState() {
    futurePokemon = fetchPokemonList(url);
    _loadTeam();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          _getMoreData();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getMoreData() {
    listMax = listMax + 20;
    setState(() {});
  }

  void selectPokemon(String name) async {
    final prefs = await SharedPreferences.getInstance();
    if (teamPokemon.length <= 5) {
      teamPokemon.contains(name)
          ? teamPokemon.remove(name)
          : teamPokemon.add(
              name,
            );
    } else if (teamPokemon.length == 6) {
      if (teamPokemon.contains(name)) {
        teamPokemon.remove(name);
      }
    }
    setState(
      () {
        prefs.setStringList('team', teamPokemon);
      },
    );
  }

  void getPokemonURL(String url) async {
    final prefs = await SharedPreferences.getInstance();
    if (pokemonURL.length <= 5) {
      pokemonURL.contains(url)
          ? pokemonURL.remove(url)
          : pokemonURL.add(
              url,
            );
    } else if (pokemonURL.length == 6) {
      if (pokemonURL.contains(url)) {
        pokemonURL.remove(url);
      }
    }
    setState(
      () {
        prefs.setStringList('url', pokemonURL);
      },
    );
  }

  void _loadTeam() async {
    final prefs = await SharedPreferences.getInstance();
    setState(
      () {
        teamPokemon = (prefs.getStringList('team') ?? []);
        pokemonURL = (prefs.getStringList('url') ?? []);
        debugPrint(teamPokemon.toString());
        debugPrint(pokemonURL.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: FutureBuilder(
            future: futurePokemon,
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  {
                    return const Center(
                      child: Text('Loading'),
                    );
                  }
                case ConnectionState.done:
                  {
                    return ListView.builder(
                      controller: scrollController,
                      // key: const PageStorageKey<String>('controllerA'),
                      shrinkWrap: true,
                      itemCount: listMax,
                      itemBuilder: (context, index) {
                        if (index == listMax - 1) {
                          return const CupertinoActivityIndicator(
                            radius: 20.0,
                            color: kLoaderColour,
                          );
                        }
                        var data = snapshot.data!;
                        var pokemon = data.results![index];
                        return Card(
                          elevation: 8.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 6.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: teamPokemon.contains('${pokemon.name}')
                                  ? kSelectedCardColour
                                  : kCardColour,
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              leading: CircleAvatar(
                                backgroundColor: kLeadListTileColour,
                                child: teamPokemon.contains('${pokemon.name}')
                                    ? const Image(
                                        image: AssetImage(
                                          'images/pokeball.png',
                                        ),
                                        height: 50,
                                        width: 50,
                                      )
                                    : const SizedBox(),
                              ),
                              title: Text(
                                pokemon.name.toString(),
                                style: TextStyle(
                                  color: teamPokemon.contains('${pokemon.name}')
                                      ? kTextSelectedColour
                                      : kTextCardColour,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: ShowPokemon(
                                url: pokemon.url.toString(),
                              ),
                              onTap: () {
                                setState(
                                  () {
                                    selectPokemon(
                                      pokemon.name.toString(),
                                    );
                                    getPokemonURL(
                                      pokemon.url.toString(),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
              }
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    kAppBarColour,
                  ),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  setState(
                    () {
                      teamPokemon.clear();
                      pokemonURL.clear();
                      prefs.setStringList('team', teamPokemon);
                      prefs.setStringList('url', pokemonURL);
                      debugPrint('$teamPokemon\n$pokemonURL');
                    },
                  );
                },
                child: const Text('clear'),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    kAppBarColour,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeamList(),
                    ),
                  );
                },
                child: const Text('confirm team'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
