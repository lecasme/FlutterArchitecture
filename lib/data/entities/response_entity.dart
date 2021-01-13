import 'package:flutter_architecture/data/entities/pokemon_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_entity.g.dart';

@JsonSerializable()
class ResponseEntity {

  final int count;
  final String next;
  final String previous;
  final List<PokemonEntity> results;

  ResponseEntity(this.count, this.next, this.previous, this.results);

  factory ResponseEntity.fromJson(Map<String, dynamic> json) => _$ResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseEntityToJson(this);

}