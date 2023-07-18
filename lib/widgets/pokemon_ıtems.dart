import 'package:pokemon_app/constants/constants.dart';
import 'package:pokemon_app/constants/u%C4%B1_helper.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/pages/detail_page.dart';
import 'package:pokemon_app/widgets/poke_%C4%B1mgandball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  // ignore: prefer_const_constructors_in_immutables
  PokeListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        shadowColor: Colors.white,
        color: UiHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UiHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name ?? 'N/A',
                style: Constants.getPokeNameTextStyle(),
              ),
              Chip(
                  label: Text(pokemon.type![0],
                      style: Constants.getchipTextStyle())),
              Expanded(child: PokeImgAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
