import 'package:flutter/material.dart';
import 'package:pokemon_team/models/pokemon_info.dart';
import 'package:pokemon_team/components/futuredialog.dart';
import 'package:pokemon_team/constant.dart';
import 'package:pokemon_team/util/service_info.dart';

class ShowPokemon extends StatefulWidget {
  const ShowPokemon({super.key, required this.url});
  final String url;
  @override
  State<ShowPokemon> createState() => ShowPokemonState();
}

class ShowPokemonState extends State<ShowPokemon> {
  Future<PokemonInfo>? pokemonInfo;
  @override
  void initState() {
    var url = widget.url;
    pokemonInfo = fetchPokemonInfo(url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Icon(
        Icons.view_stream,
        color: kViewIconColour,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return FutureBuilder(
              future: pokemonInfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  int? weight = data.weight;
                  int? height = data.height;
                  String? name = data.name;
                  // String? imageF = data.sprites!.frontDefault;
                  String? imageD =
                      data.sprites!.other!.dreamWorld!.frontDefault;
                  return DialogPokemon(
                    imageD: imageD.toString(),
                    name: name.toString().toUpperCase(),
                    height: height!.toInt(),
                    weight: weight!.toInt(),
                  );
                } else if (snapshot.hasError) {
                  return Text('{$snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        );
      },
    );
  }
}
