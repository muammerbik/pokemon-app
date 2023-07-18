import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/constants/constants.dart';
import 'package:pokemon_app/constants/u%C4%B1_helper.dart';
import 'package:pokemon_app/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({super.key,required this.pokemon});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white,
      ),
      child: Padding(
        padding: UiHelper.getDefaultPadding(),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPokeInformationRow('Name', pokemon.name),
            _buildPokeInformationRow('Height', pokemon.height),
            _buildPokeInformationRow('Weight', pokemon.weight),
            _buildPokeInformationRow('Spawn Time', pokemon.spawnTime),
            _buildPokeInformationRow('Weakness', pokemon.weaknesses),
            _buildPokeInformationRow('pRE Evolution', pokemon.spawnTime),
            _buildPokeInformationRow('Next Evolution', pokemon.nextEvolution),
            

          
          ],
        ),
      ),
    );
  }

  _buildPokeInformationRow(String label, dynamic value) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,style: Constants.getInfoLabelTextStyle(),),
        if(value is List && value.isNotEmpty)
        Text(value.join(" , "),style: Constants.getInfoValueTextStyle())
        else if (value==null)
        Text('Not Avaible',style: Constants.getInfoValueTextStyle())
        else Text(value,style: Constants.getInfoValueTextStyle(),),

        
      ],
    );
  }
}
