import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  getIt.init();
}