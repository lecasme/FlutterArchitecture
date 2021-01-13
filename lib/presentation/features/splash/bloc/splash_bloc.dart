import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/utils/constants.dart';
import 'package:flutter_architecture/domain/models/failure.dart';
import 'package:flutter_architecture/domain/usecases/settings_usecase.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SettingsUseCase settingsUseCase;

  SplashBloc(this.settingsUseCase) : super(SplashInitial());

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is LoadPokemons) {
      final response = await settingsUseCase.getCloudPokemons();
      yield* _eitherLoadedOrErrorState(response);
    }
  }

  Stream<SplashState> _eitherLoadedOrErrorState(
      Either<Failure, bool> failureOrLoaded) async* {
    yield* failureOrLoaded.fold(
      (failure) async* {
        switch (failure.code) {
          case CODE_FAILURE:
            yield SplashError(failure.message);
            break;
          case CODE_ERROR:
            yield SplashError(failure.message);
            break;
          case CODE_OFFLINE:
            yield SplashOffline(failure.message);
            break;
        }
      },
      (loaded) async* {
        yield SplashLoaded(loaded);
      },
    );

  }

}
