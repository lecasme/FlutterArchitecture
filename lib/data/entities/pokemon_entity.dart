import 'package:flutter_architecture/domain/models/pokemon.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_entity.g.dart';

@JsonSerializable()
class PokemonEntity extends Pokemon{

  final String name;
  final String url;

  PokemonEntity(this.name, this.url) : super(name, url);

  factory PokemonEntity.fromJson(Map<String, dynamic> json) => _$PokemonEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonEntityToJson(this);


}
