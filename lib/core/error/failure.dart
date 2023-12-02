
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
  final int statusCode;
  final String message;

  ServerFailure({required this.statusCode, required this.message});
}

class CacheFailure extends Failure {}

class NoInternetConnectionFailure extends Failure {}

class PlatformFailure extends Failure {
  final String message;

  PlatformFailure({required this.message});

  List<Object> get props => [message];
}
