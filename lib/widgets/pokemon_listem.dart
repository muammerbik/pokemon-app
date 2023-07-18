import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/services/pokedex_api.dart';
import 'package:pokemon_app/widgets/pokemon_%C4%B1tems.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final Future<List<PokemonModel>> _listFuture;
  @override
  void initState() {
    super.initState();
    _listFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _listFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var _listem = snapshot.data!;

          return GridView.builder(itemCount: _listem.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ScreenUtil().orientation==Orientation.portrait?2:3),
            itemBuilder: (context, index) =>
                PokeListItem(pokemon: _listem[index]),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('hata'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
