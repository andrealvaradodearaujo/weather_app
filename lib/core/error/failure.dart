
abstract class Failure{
  final List properties;
  Failure([this.properties = const <dynamic>[]]);
}

// General failures
class GenericFailure extends Failure {
  final String? message;

  GenericFailure([this.message]);
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});
}

abstract class CacheFailure extends Failure {}

class CacheDataNotFoundFailure extends CacheFailure {
  final String message;

  CacheDataNotFoundFailure({required this.message});
}

class CacheStorageFailure extends CacheFailure {
  final String message;

  CacheStorageFailure({required this.message});
}

class CacheCurrentWeatherFailure extends CacheFailure {
  final String message;

  CacheCurrentWeatherFailure({required this.message});
}

class NoInternetConnectionFailure extends Failure {}

class PlatformFailure extends Failure {
  final String message;

  PlatformFailure({required this.message});

  List<Object> get props => [message];
}
