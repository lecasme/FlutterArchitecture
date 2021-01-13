part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class PokemonLoad extends HomeState {
  final List<Pokemon> pokemons;
  PokemonLoad(this.pokemons);
}

class PokemonSelected extends HomeState {
  final Pokemon pokemon;
  PokemonSelected(this.pokemon);
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
