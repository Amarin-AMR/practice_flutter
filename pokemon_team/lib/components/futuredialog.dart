import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon_team/constant.dart';

class DialogPokemon extends StatelessWidget {
  DialogPokemon(
      {super.key,
      required this.imageD,
      required this.name,
      required this.height,
      required this.weight});
  String name;
  String imageD;
  int weight;
  int height;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("images/card_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name.toString().toUpperCase(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                imageD.isNotEmpty
                    ? SvgPicture.network(
                        imageD.toString(),
                        width: 70,
                        height: 70,
                      )
                    : Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Text(
                          // imageD.toString(),
                          'No images',
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Height: $height\nWeight: $weight',
                  textAlign: TextAlign.center,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'cancel',
                      style: TextStyle(
                        fontSize: 18,
                        color: kTextButtonColour,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: CircleAvatar(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Image.asset("images/pokeicon.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
