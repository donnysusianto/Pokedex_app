import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:pokedex_app/models/pokemon.dart';

import 'package:pokedex_app/models/poke_card.dart';
import 'package:pokedex_app/pokemon/pokemons_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<BasePokemon> pokemons = context.select(
      (PokemonsState pokeState) => pokeState.pokemons,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Pokédex'),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: pokemons.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : GridView.count(
              crossAxisCount: 3,
              children: List.generate(
                pokemons.length,
                (index) => PokeCard(pokeURL: pokemons[index].url),
              ),
            ),
    );
  }
}

class _PaddedImage extends StatelessWidget {
  const _PaddedImage({
    Key key,
    @required this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(asset, width: 50.0, height: 50.0),
    );
  }
}
