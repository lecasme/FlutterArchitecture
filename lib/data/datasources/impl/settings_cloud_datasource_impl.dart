import 'package:flutter_architecture/data/entities/response_entity.dart';
import 'package:flutter_architecture/data/services/clients/rest_client.dart';
import 'package:meta/meta.dart';

import '../settings_cloud_datasource.dart';

/// Implementation
class SettingsCloudDataSourceImpl implements SettingsCloudDataSource{

  final RestClient client;

  SettingsCloudDataSourceImpl({@required this.client});

  @override
  Future<ResponseEntity> getPokemons(int limit) {
    return client.getPokemons(limit);
  }


}