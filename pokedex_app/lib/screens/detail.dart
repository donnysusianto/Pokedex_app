import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/models/ability.dart';
import 'package:pokedex_app/models/type.dart' as type;

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key, @required this.pokemon}) : super(key: key);

  final ApiPokemon pokemon;

  static Route go(ApiPokemon pokemon) {
    return MaterialPageRoute<void>(
      builder: (_) => DetailScreen(pokemon: pokemon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(pokemon.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Wrap(
              children: [
                for (var sprite in pokemon.sprites.props)
                  if (sprite != null) Image.network(sprite),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.cyan,
                      child: _InfoColumn(title: 'Types', items: pokemon.types),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.red,
                      child: _InfoColumn(
                          title: 'Abilities', items: pokemon.abilities),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  const _InfoColumn({
    Key key,
    @required this.title,
    @required this.items,
  }) : super(key: key);

  final String title;
  final List<Object> items;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headline5.copyWith(
          color: Colors.white,
        );

    final textStyle = Theme.of(context).textTheme.subtitle1.copyWith(
          color: Colors.white,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        SizedBox(height: 10),
        for (var item in items)
          if (item is type.Type)
            Text(
              toBeginningOfSentenceCase(item.type.name),
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.0,
              ),
            ),
        for (var item in items)
          if (item is Ability)
            Text(
              toBeginningOfSentenceCase(item.ability.name),
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.0,
              ),
            ),
      ],
    );
  }
}
