import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'screens/home.dart';
import 'pokemon/pokemon_api.dart';
import 'package:pokedex_app/pokemon/pokemons_state.dart';

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokemonsState(PokemonApi()),
      child: MaterialApp(
        title: 'Pokédex Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
