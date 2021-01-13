import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_architecture/presentation/features/error/bloc/error_bloc.dart';
import 'package:flutter_architecture/presentation/features/home/bloc/home_bloc.dart';
import 'package:flutter_architecture/presentation/features/splash/bloc/splash_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasources/impl/settings_cloud_datasource_impl.dart';
import 'data/datasources/impl/settings_local_datasource_impl.dart';
import 'data/datasources/settings_cloud_datasource.dart';
import 'data/datasources/settings_local_datasource.dart';
import 'data/repositories/settings_repository_impl.dart';
import 'data/services/clients/rest_client.dart';
import 'data/utils/network_info.dart';
import 'domain/repositories/settings_repository.dart';
import 'domain/usecases/settings_usecase.dart';


final sl = GetIt.instance;

Future<void> init() async{

  // Features
  _initFeatures();

  // UseCases
  _initUseCases();

  // Repositories
  _initRepositories();

  // DataSource
  _initDataSources();

  // Core
  _initCore();

  //Rest Client
  _initRestClient();

  // External (cant move to another async method)
  final preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);

  // Keyboard
  final keyboardVisibilityController = KeyboardVisibilityController();
  keyboardVisibilityController.onChange.listen((bool visible) {});
  sl.registerLazySingleton(() => keyboardVisibilityController);

}

void _initFeatures(){

  sl.registerFactory(() => SplashBloc(sl()));
  sl.registerFactory(() => HomeBloc(sl()));
  sl.registerFactory(() => ErrorBloc());

}

void _initUseCases(){

  // Settings
  sl.registerLazySingleton(() => SettingsUseCase(sl()));

}

void _initRepositories(){

  // Settings
  sl.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(sl(), sl(), sl()));

}

void _initDataSources(){

  // Settings
  sl.registerLazySingleton<SettingsCloudDataSource>(() => SettingsCloudDataSourceImpl(client: sl()));
  sl.registerLazySingleton<SettingsLocalDataSource>(() => SettingsLocalDataSourceImpl(preferences: sl()));

}


void _initCore(){

  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  
}

void _initRestClient(){

  sl.registerLazySingleton(() => RestClient.create());

}

