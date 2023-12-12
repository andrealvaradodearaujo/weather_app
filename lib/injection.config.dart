// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;
import 'package:weather_app/features/data/datasources/weather_local_data_source.dart'
    as _i3;
import 'package:weather_app/features/data/datasources/weather_remote_data_source.dart'
    as _i5;
import 'package:weather_app/features/data/repositories/weather_repository_impl.dart'
    as _i8;
import 'package:weather_app/features/domain/repositories/weather_repository.dart'
    as _i7;
import 'package:weather_app/features/domain/usecases/get_cities_use_case.dart'
    as _i9;
import 'package:weather_app/features/domain/usecases/get_current_weather_use_case.dart'
    as _i10;
import 'package:weather_app/features/domain/usecases/get_next_days_forecast_use_case.dart'
    as _i11;
import 'package:weather_app/features/presentation/bloc/cities/cities_bloc.dart'
    as _i13;
import 'package:weather_app/features/presentation/bloc/current_weather/current_weather_bloc.dart'
    as _i14;
import 'package:weather_app/features/presentation/bloc/next_days_forecast/next_days_forecast_bloc.dart'
    as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.WeatherLocalDataSource>(
        () => _i3.WeatherLocalDataSource(gh<_i4.SharedPreferences>()));
    gh.factory<_i5.WeatherRemoteDataSource>(
        () => _i5.WeatherRemoteDataSource(gh<_i6.Dio>()));
    gh.factory<_i7.WeatherRepository>(() => _i8.WeatherRepositoryImpl(
          gh<_i5.WeatherRemoteDataSource>(),
          gh<_i3.WeatherLocalDataSource>(),
        ));
    gh.factory<_i9.GetCitiesUseCase>(
        () => _i9.GetCitiesUseCase(gh<_i7.WeatherRepository>()));
    gh.factory<_i10.GetCurrentWeatherUseCase>(
        () => _i10.GetCurrentWeatherUseCase(gh<_i7.WeatherRepository>()));
    gh.factory<_i11.GetNextDaysForecastUseCase>(
        () => _i11.GetNextDaysForecastUseCase(gh<_i7.WeatherRepository>()));
    gh.factory<_i12.NextDaysForecastBloc>(
        () => _i12.NextDaysForecastBloc(gh<_i11.GetNextDaysForecastUseCase>()));
    gh.factory<_i13.CitiesBloc>(
        () => _i13.CitiesBloc(gh<_i9.GetCitiesUseCase>()));
    gh.factory<_i14.CurrentWeatherBloc>(
        () => _i14.CurrentWeatherBloc(gh<_i10.GetCurrentWeatherUseCase>()));
    return this;
  }
}
