
import 'package:flutter_architecture/data/entities/response_entity.dart';
import 'package:flutter_architecture/data/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';


part 'rest_client.g.dart';

/// API CLIENT
@RestApi(baseUrl: BASE_URL)
abstract class RestClient {

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient create(){
    final dio = Dio();
    dio.options.connectTimeout = 5000;
    dio.interceptors.add(PrettyDioLogger());
    return RestClient(dio);
  }

  @GET("/pokemon")
  Future<ResponseEntity> getPokemons(@Query("limit") int limit);

}
