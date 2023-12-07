// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_app/features/data/datasources/weather_remote_data_source.dart'
    as _i3;
import 'package:weather_app/features/data/repositories/weather_repository_impl.dart'
    as _i6;
import 'package:weather_app/features/domain/repositories/weather_repository.dart'
    as _i5;
import 'package:weather_app/features/domain/usecases/get_cities_use_case.dart'
    as _i7;
import 'package:weather_app/features/domain/usecases/get_current_weather_use_case.dart'
    as _i8;
import 'package:weather_app/features/domain/usecases/get_next_days_forecast_use_case.dart'
    as _i9;
import 'package:weather_app/features/presentation/bloc/cities/cities_bloc.dart'
    as _i11;
import 'package:weather_app/features/presentation/bloc/current_weather/current_weather_bloc.dart'
    as _i12;
import 'package:weather_app/features/presentation/bloc/next_days_forecast/next_days_forecast_bloc.dart'
    as _i10;

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
    gh.factory<_i3.WeatherRemoteDataSource>(
        () => _i3.WeatherRemoteDataSource(gh<_i4.Dio>()));
    gh.factory<_i5.WeatherRepository>(
        () => _i6.WeatherRepositoryImpl(gh<_i3.WeatherRemoteDataSource>()));
    gh.factory<_i7.GetCitiesUseCase>(
        () => _i7.GetCitiesUseCase(gh<_i5.WeatherRepository>()));
    gh.factory<_i8.GetCurrentWeatherUseCase>(
        () => _i8.GetCurrentWeatherUseCase(gh<_i5.WeatherRepository>()));
    gh.factory<_i9.GetNextDaysForecastUseCase>(
        () => _i9.GetNextDaysForecastUseCase(gh<_i5.WeatherRepository>()));
    gh.factory<_i10.NextDaysForecastBloc>(
        () => _i10.NextDaysForecastBloc(gh<_i9.GetNextDaysForecastUseCase>()));
    gh.factory<_i11.CitiesBloc>(
        () => _i11.CitiesBloc(gh<_i7.GetCitiesUseCase>()));
    gh.factory<_i12.CurrentWeatherBloc>(
        () => _i12.CurrentWeatherBloc(gh<_i8.GetCurrentWeatherUseCase>()));
    return this;
  }
}
