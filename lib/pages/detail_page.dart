import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/constants/constants.dart';
import 'package:pokemon_app/constants/u%C4%B1_helper.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/widgets/poke_information.dart';
import 'package:pokemon_app/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    const String pokebollimages = 'images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? buildPortraitBody(context, pokebollimages)
        : buildLandscapeBody(context, pokebollimages);
  }

  Scaffold buildLandscapeBody(BuildContext context, String pokebollimages) {
    return Scaffold(
      backgroundColor: UiHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: UiHelper.getDefaultPadding(),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 20.w),
          ),
        
          Expanded(child: Row(children: [
            Expanded(flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                PokeTypeName(pokemon: pokemon),
                 Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                        imageUrl: pokemon.img ?? '',
                        height: 0.25.sw,
                        fit: BoxFit.fitHeight),
                  ),
                
              ],),
            ),
            Expanded(
              flex: 5,
              child: PokeInformation(pokemon: pokemon,))
          ],))
        ],
      )),
    );
  }

  Scaffold buildPortraitBody(BuildContext context, String pokebollimages) {
    return Scaffold(
      backgroundColor: UiHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UiHelper.getDefaultPadding(),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 24.w),
          ),
          PokeTypeName(pokemon: pokemon),
          SizedBox(height: 20.h),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    pokebollimages,
                    fit: BoxFit.fitHeight,
                    height: 0.15.sh,
                  )),
              Positioned(
                child: PokeInformation(pokemon: pokemon),
                right: 0,
                left: 0,
                bottom: 0,
                top: 0.12.sh,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: pokemon.id!,
                  child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight),
                ),
              )
            ],
          )),
        ],
      )),
    );
  }
}
