import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/domain/models/pokemon.dart';
import 'package:flutter_architecture/presentation/features/home/bloc/home_bloc.dart';
import 'package:flutter_architecture/presentation/features/home/widgets/home_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_architecture/presentation/commons/widgets/snackbar.dart';

import '../../../../injection.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: buildBody(context));
  }

  final homeBloc = sl<HomeBloc>();
  List<Pokemon> pokemons = List();

  BlocProvider<HomeBloc> buildBody(BuildContext context) {
    return BlocProvider(
        create: (_) => homeBloc,
        child: createListener());
  }

  /// BlocListener widget in order to DO THINGS in response to state changes in our DataBloc
  BlocListener<HomeBloc, HomeState> createListener() {
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {

          if (state is PokemonSelected) {
            Scaffold.of(context).showSnackBar(Snackbar.getSimpleSnackbar(state.pokemon.name));
          } else if (state is PokemonLoad) {
            setState(() {
              this.pokemons = state.pokemons;
            });
          } else if (state is HomeError) {
            Navigator.of(context).pushNamed('/error');
          }

        },
        child: createBuilder());
  }

  /// BlocBuilder widget in order to RENDER WIDGETS in response to state changes in our DataBloc
  BlocBuilder<HomeBloc, HomeState> createBuilder() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        final main = HomeWidget(pokemons: this.pokemons);

        if (state is HomeInitial) {
          _loadPokemons();
          return main;
        }else {
          return main;
        }

      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    homeBloc.close();
  }

  void _loadPokemons() {
    homeBloc.add(LoadPokemons());
  }

}
