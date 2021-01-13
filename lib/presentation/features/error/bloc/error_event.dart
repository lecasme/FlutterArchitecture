part of 'error_bloc.dart';

@immutable
abstract class ErrorEvent {}

class ApplicationRestart extends ErrorEvent {}