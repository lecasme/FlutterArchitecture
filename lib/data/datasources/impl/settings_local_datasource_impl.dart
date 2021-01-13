import 'dart:convert';
import 'package:flutter_architecture/data/entities/pokemon_entity.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../settings_local_datasource.dart';

/// Implementation
class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences preferences;

  SettingsLocalDataSourceImpl({@required this.preferences});

  @override
  Future<void> savePokemons(List<PokemonEntity> pokemons) async {
    preferences.setString("pokemons", json.encode(pokemons));
  }

  @override
  Future<List<PokemonEntity>> getPokemons() async {
    final avatars = preferences.getString("pokemons");
    return (json.decode(avatars) as List)
        ?.map((e) =>
            e == null ? null : PokemonEntity.fromJson(e as Map<String, dynamic>))
        ?.toList();
  }


}
