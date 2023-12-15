import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// General failures
class GenericFailure extends Failure {
  final String? message;

  GenericFailure([this.message]);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

abstract class CacheFailure extends Failure {}

class CacheDataNotFoundFailure extends CacheFailure {
  final String message;

  CacheDataNotFoundFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class CacheStorageFailure extends CacheFailure {
  final String message;

  CacheStorageFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class CacheCurrentWeatherFailure extends CacheFailure {
  final String message;

  CacheCurrentWeatherFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class NoInternetConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class PlatformFailure extends Failure {
  final String message;

  PlatformFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
