import 'package:flutter_architecture/data/entities/response_entity.dart';

abstract class SettingsCloudDataSource{
  Future<ResponseEntity> getPokemons(int limit);
}

