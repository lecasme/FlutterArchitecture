import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/data/datasources/settings_cloud_datasource.dart';
import 'package:flutter_architecture/data/datasources/settings_local_datasource.dart';
import 'package:flutter_architecture/data/entities/pokemon_entity.dart';
import 'package:flutter_architecture/data/utils/constants.dart';
import 'package:flutter_architecture/data/utils/messages.dart';
import 'package:flutter_architecture/data/utils/network_info.dart';
import 'package:flutter_architecture/domain/models/failure.dart';
import 'package:flutter_architecture/domain/repositories/settings_repository.dart';


class SettingsRepositoryImpl implements SettingsRepository {

  final SettingsCloudDataSource cloud;
  final SettingsLocalDataSource local;
  final NetworkInfo networkInfo;

  SettingsRepositoryImpl(this.cloud, this.local, this.networkInfo);

  @override
  Future<Either<Failure, bool>> getCloudPokemons() async{
    if (await networkInfo.isConnected) {
      try {

        final limit = 151; // Set your own limit or paginate it
        final response = await cloud.getPokemons(limit);
        local.savePokemons(response.results);
        return Right(true);

      } on Exception {
        return Left(Failure(CODE_FAILURE, ERROR_MESSAGE));
      }

    } else {
      return Left(Failure(CODE_OFFLINE, CONNECTION_LOST));
    }
  }

  @override
  Future<Either<Failure, List<PokemonEntity>>> getLocalPokemons() async {
    try {
      //throw Exception("Example error"); Uncomment this to check ErrorPage
      return Right(await local.getPokemons());
    } on Exception {
    return Left(Failure(CODE_ERROR, ERROR_MESSAGE));
    }
  }



}