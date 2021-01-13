import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/data/utils/constants.dart';
import 'package:flutter_architecture/domain/models/failure.dart';
import 'package:flutter_architecture/domain/models/pokemon.dart';
import 'package:flutter_architecture/domain/usecases/settings_usecase.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SettingsUseCase settingsUseCase;

  HomeBloc(this.settingsUseCase) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadPokemons) {
      final response = await settingsUseCase.getLocalPokemons();
      yield* _eitherPokemonLoadedOrErrorState(response);
    }
  }

  Stream<HomeState> _eitherPokemonLoadedOrErrorState(
      Either<Failure, List<Pokemon>> failureOrLoaded) async* {
    yield* failureOrLoaded.fold(
      (failure) async* {
        switch (failure.code) {
          case CODE_FAILURE:
            yield HomeFailure(failure.message);
            break;
          case CODE_ERROR:
            yield HomeError(failure.message);
            break;
        }
      },
      (pokemons) async* {
        yield PokemonLoad(pokemons);
      },
    );
  }
}
