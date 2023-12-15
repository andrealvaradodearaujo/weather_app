// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
import 'package:weather_app/core/utils/internet_connection_checker.dart' as _i6;
import 'package:weather_app/features/cities/data/repositories/cities_repository_impl.dart'
    as _i4;
import 'package:weather_app/features/cities/domain/repositories/cities_repository.dart'
    as _i3;
import 'package:weather_app/features/cities/domain/usecases/get_cities_use_case.dart'
    as _i5;
import 'package:weather_app/features/cities/presentation/bloc/cities_bloc.dart'
    as _i13;
import 'package:weather_app/features/weather/data/datasources/weather_local_data_source.dart'
    as _i7;
import 'package:weather_app/features/weather/data/datasources/weather_remote_data_source.dart'
    as _i9;
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart'
    as _i12;
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart'
    as _i11;
import 'package:weather_app/features/weather/domain/usecases/get_current_weather_use_case.dart'
    as _i14;
import 'package:weather_app/features/weather/domain/usecases/get_next_days_forecast_use_case.dart'
    as _i15;
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart'
    as _i17;
import 'package:weather_app/features/weather/presentation/bloc/next_days_forecast/next_days_forecast_bloc.dart'
    as _i16;

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
    gh.factory<_i3.CitiesRepository>(() => _i4.CitiesRepositoryImpl());
    gh.factory<_i5.GetCitiesUseCase>(
        () => _i5.GetCitiesUseCase(gh<_i3.CitiesRepository>()));
    gh.factory<_i6.InternetConnectionChecker>(
        () => _i6.InternetConnectionChecker());
    gh.factory<_i7.WeatherLocalDataSource>(
        () => _i7.WeatherLocalDataSource(gh<_i8.SharedPreferences>()));
    gh.factory<_i9.WeatherRemoteDataSource>(
        () => _i9.WeatherRemoteDataSource(gh<_i10.Dio>()));
    gh.factory<_i11.WeatherRepository>(() => _i12.WeatherRepositoryImpl(
          gh<_i9.WeatherRemoteDataSource>(),
          gh<_i7.WeatherLocalDataSource>(),
          gh<_i6.InternetConnectionChecker>(),
        ));
    gh.factory<_i13.CitiesBloc>(
        () => _i13.CitiesBloc(gh<_i5.GetCitiesUseCase>()));
    gh.factory<_i14.GetCurrentWeatherUseCase>(
        () => _i14.GetCurrentWeatherUseCase(gh<_i11.WeatherRepository>()));
    gh.factory<_i15.GetNextDaysForecastUseCase>(
        () => _i15.GetNextDaysForecastUseCase(gh<_i11.WeatherRepository>()));
    gh.factory<_i16.NextDaysForecastBloc>(
        () => _i16.NextDaysForecastBloc(gh<_i15.GetNextDaysForecastUseCase>()));
    gh.factory<_i17.CurrentWeatherBloc>(
        () => _i17.CurrentWeatherBloc(gh<_i14.GetCurrentWeatherUseCase>()));
    return this;
  }
}
