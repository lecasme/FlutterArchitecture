import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/data/entities/pokemon_entity.dart';
import 'package:flutter_architecture/domain/models/failure.dart';
import 'package:flutter_architecture/domain/repositories/settings_repository.dart';


class SettingsUseCase{

  final SettingsRepository repository;

  SettingsUseCase(this.repository);

  Future<Either<Failure, bool>> getCloudPokemons() {
    return repository.getCloudPokemons();
  }

  Future<Either<Failure, List<PokemonEntity>>> getLocalPokemons() {
    return repository.getLocalPokemons();
  }

}