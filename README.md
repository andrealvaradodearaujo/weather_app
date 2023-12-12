# Weather App

The Weather App is a Flutter application that provides real-time weather information and forecasts. It leverages various data sources, both remote and local, to ensure functionality even when the device is offline.

## Features

- **Current Weather:** Get the current weather details for selected cities.
- **Next Days Forecast:** Retrieve the weather forecast for the upcoming days.
- **Offline Support:** The app is designed to work seamlessly offline by caching data locally.

## Project Structure

### Data Sources

#### WeatherLocalDataSource

Creates a local data source and logic for saving/retrieving data from shared preferences to enable offline functionality.

#### WeatherRemoteDataSource

Handles data retrieval from remote servers using APIs. In case of network issues, it falls back to local data.

### Models

- **CurrentWeatherModel:** Represents the model for current weather data.
- **NextDayWeatherModel:** Represents the model for the next day's weather forecast.

### Data Mappers

#### CurrentWeatherModelDataMappers

Provides extension methods to map data from `CurrentWeatherModel` to `CurrentWeather` for easier use in the app.

#### NextDayWeatherModelDataMappers

Extension methods to map data from `NextDayWeatherModel` to `NextDayWeather` for convenient usage.

### Repositories

#### WeatherRepository

Abstract class defining the contract for fetching weather-related data. It includes methods for current weather, next days forecast, and fetching a list of cities.

### Use Cases

#### GetCurrentWeatherUseCase

Fetches the current weather for a specified city.

#### GetNextDaysForecastUseCase

Retrieves the weather forecast for the next days for a given city.

#### GetCitiesUseCase

Fetches a list of supported cities.

### BLoCs

#### CitiesBloc

Handles state management for the Cities page, including searching for cities and initializing the city list.

#### CurrentWeatherBloc

Manages the state for the Current Weather page, handling data loading, success, and error states.

#### NextDaysForecastBloc

Manages the state for the Next Days Forecast page, handling data loading, success, and error states.

## Usage

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Launch the app using `flutter run`.

Feel free to contribute or report issues!
