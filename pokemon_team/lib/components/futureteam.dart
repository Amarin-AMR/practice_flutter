import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon_team/constant.dart';
import 'package:pokemon_team/models/pokemon_info.dart';

class FutureTeam extends StatefulWidget {
  FutureTeam({
    super.key,
    required this.pokemonInfo,
  });
  Future<PokemonInfo> pokemonInfo;

  @override
  State<FutureTeam> createState() => _FutureTeamState();
}

class _FutureTeamState extends State<FutureTeam> {
  Future<PokemonInfo>? pokemonInfo;
  @override
  void initState() {
    pokemonInfo = widget.pokemonInfo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: pokemonInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          var name = data.name?.toUpperCase();
          var image = data.sprites?.other?.dreamWorld?.frontDefault;
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(8),
            height: h / 15,
            width: w / 1.5,
            decoration: BoxDecoration(
              color: kBoxDecorationColour,
              borderRadius: BorderRadius.circular(
                30,
              ),
              boxShadow: [
                BoxShadow(
                  color: kBoxShadowColour,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: SvgPicture.network(
                    image.toString(),
                    // width: h / ,
                    // height: w / 20,
                  ),
                ),
                Text(name.toString()),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('{$snapshot.error}');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
