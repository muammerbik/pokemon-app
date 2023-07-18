import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/constants/u%C4%B1_helper.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/services/pokedex_api.dart';

class PokeImgAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(alignment: Alignment.bottomRight,
          child: Image.asset(
          
            PokeApi.pokebollimages,
            width: UiHelper.calculatePokeImagAndBall(),
            height: UiHelper.calculatePokeImagAndBall(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => Icon(Icons.ac_unit_sharp),
                imageUrl: pokemon.img ?? '',
                width: UiHelper.calculatePokeImagAndBall(),
                height: UiHelper.calculatePokeImagAndBall(),
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) => CircularProgressIndicator(color:UiHelper.getColorFromType(pokemon.type![0]),),
              
                  ),
          ),
        ),
      ],
    );
  }
}
