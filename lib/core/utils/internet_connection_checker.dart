import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

/// A utility class for checking internet connectivity.
class InternetConnectionChecker {
  /// Checks if the device has an active internet connection.
  ///
  /// Returns `true` if there is an internet connection, otherwise `false`.
  static Future<bool> isInternetAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          try {
            // Try making an HTTP request to a known server
            var request = await HttpClient().headUrl(Uri.parse('https://www.google.com'));
            var response = await request.close();
            var statusCode = response.statusCode;
            return statusCode == HttpStatus.ok; // Indicates there is internet connectivity
          } catch (e) {
            return false; // HTTP request error indicates lack of internet connectivity
          }
        } else {
          return false; // No valid response from DNS query
        }
      } on SocketException catch (_) {
        return false; // No internet connection
      }
    } else {
      return false; // No internet connection
    }
  }
}