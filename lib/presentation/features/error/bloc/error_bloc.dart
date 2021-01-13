import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'error_event.dart';
part 'error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(ErrorInitial());

  @override
  Stream<ErrorState> mapEventToState(
    ErrorEvent event,
  ) async* {
    if (event is ApplicationRestart) {
      yield ErrorRestart();
    }
  }
}
