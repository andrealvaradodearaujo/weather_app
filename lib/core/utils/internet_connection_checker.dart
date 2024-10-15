import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

/// A utility class for checking internet connectivity.
@injectable
class InternetConnectionChecker {
  /// Checks if the device has an active internet connection.
  ///
  /// Returns `true` if there is an internet connection, otherwise `false`.
  Future<bool> isInternetAvailable() async {
    var connectivityResults = await Connectivity().checkConnectivity();

    // Verifica se a lista contém mobile ou wifi
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          try {
            var request =
                await HttpClient().headUrl(Uri.parse('https://www.google.com'));
            var response = await request.close();
            var statusCode = response.statusCode;
            return statusCode ==
                HttpStatus.ok; // Verifica a conectividade da internet
          } catch (e) {
            return false; // Falha na requisição HTTP indica falta de conectividade
          }
        } else {
          return false; // Falha na consulta DNS
        }
      } on SocketException catch (_) {
        return false; // Sem conexão com a internet
      }
    } else {
      return false; // Sem conexão de mobile ou wifi
    }
  }
}
