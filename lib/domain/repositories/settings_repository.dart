import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/data/entities/pokemon_entity.dart';
import 'package:flutter_architecture/domain/models/failure.dart';


abstract class SettingsRepository{

    Future<Either<Failure, bool>> getCloudPokemons();
    Future<Either<Failure, List<PokemonEntity>>> getLocalPokemons();
}