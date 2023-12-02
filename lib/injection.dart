import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import './injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.init();
}