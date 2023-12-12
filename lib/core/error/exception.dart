class GenericException implements Exception {}

class ServerException implements Exception {
  final int statusCode;
  final String message;

  ServerException({int? statusCode, String? message})
      : statusCode = statusCode ?? 0,
        message = message ?? 'Server Exception';
}

abstract class CacheException implements Exception {}

class CacheDataNotFoundException implements CacheException {}

class CacheStorageException implements CacheException {}

class CacheCurrentWeatherException implements CacheException {}

class CacheNextDayWeatherModelListException implements CacheException {}