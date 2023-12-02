class GenericException implements Exception {}

class ServerException implements Exception {
  final int statusCode;
  final String message;

  ServerException({int? statusCode, String? message})
      : statusCode = statusCode ?? 0,
        message = message ?? 'Server Exception';
}

class CacheException implements Exception {}

