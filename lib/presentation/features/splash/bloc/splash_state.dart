part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoaded extends SplashState {
  final bool loaded;
  SplashLoaded(this.loaded);
}

class SplashError extends SplashState {
  final String message;
  SplashError(this.message);
}

class SplashOffline extends SplashState {
  final String message;
  SplashOffline(this.message);
}

