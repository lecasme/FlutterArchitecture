import 'package:flutter_architecture/data/entities/pokemon_entity.dart';

abstract class SettingsLocalDataSource{
  Future<void> savePokemons(List<PokemonEntity> pokemons);
  Future<List<PokemonEntity>> getPokemons();
}

