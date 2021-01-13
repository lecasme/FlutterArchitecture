import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/utils/constants.dart';
import 'package:flutter_architecture/domain/models/pokemon.dart';
import 'package:flutter_architecture/presentation/commons/colors/colors.dart';
import 'package:flutter_architecture/presentation/commons/strings/home_strings.dart';

class HomeWidget extends StatelessWidget {
  final List<Pokemon> pokemons;
  final Function(Pokemon) onPokemonPressed;

  const HomeWidget({Key key, this.pokemons, this.onPokemonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_BLACK_LIGHT,
      child: Column(children: [
        Container(
            padding: const EdgeInsets.only(right: 25, left: 25, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(STR_HOME_WELCOME,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Text(STR_HOME_QUESTION,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            )),
        SizedBox(
          height: 20,
        ),
        Flexible(
            flex: 1,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                      childAspectRatio: 1.4),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        //onTap: () => onPokemonPressed.call(pokemons[index]), // Do something with the selected pokemon
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          height: 120,
                          margin: _edgeInsetsForIndex(index),
                          child: Image.network("$BASE_IMAGE_URL$index.png"),
                        ),
                      );
                    },
                    childCount: pokemons.length,
                  ),
                ),
              ],
            )),
      ]),
    );
  }

  EdgeInsets _edgeInsetsForIndex(int index) {
    if (index % 2 == 0) {
      return EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0, left: 25);
    } else {
      return EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0, right: 25);
    }
  }
}
