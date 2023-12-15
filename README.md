# Weather App

Welcome to the Weather App, a Flutter application designed to track weather conditions for the upcoming shows of a rock'n'roll band. This app allows the band staff to monitor the current weather and the forecast for the next 5 days in the main cities where the shows are taking place.

## Project Overview

### Functionality

The app includes these main screens:

1. **City list:**
    - Supports searching for a city by name.

2. **Current weather:**
    - Displays the current weather information for the selected city.
   
3. **Forecast:**
    - Presents the weather forecast for the next 5 days in the selected city.
   
### Main Cities

The app focuses on the following main cities where the band's shows are scheduled:

- Silverstone, UK
- São Paulo, Brazil
- Melbourne, Australia
- Monte Carlo, Monaco

## Offline Support

   The Weather App is designed to work offline, ensuring that you can access previously fetched weather data even without an internet connection.

## Getting Started

Follow these steps to set up the project and obtain the necessary OpenWeatherMap API key:

### Getting OpenWeatherMap API Key

To run the Weather App and access weather data from the OpenWeatherMap API, you need an API key. Follow these steps to obtain your API key:

1. Visit the OpenWeatherMap website: [https://openweathermap.org/](https://openweathermap.org/).
2. Create a free account or log in if you already have one.
3. After logging in, go to the "API keys" section in your account dashboard.
4. Generate a new API key by following the provided instructions.
5. Copy the generated API key.

### Configuring the Project

1. **Clone the repository:**

   ```bash
   git clone https://github.com/andrealvaradodearaujo/weather_app.git

2. **Navigate to the project directory:**

    ```bash
    cd weather-app

3. **Create a file named `config.dart` in the `lib/config/` directory. This file should contain your OpenWeatherMap API key:**

    ```dart
    // lib/config/config.dart

    const apiKey = 'YOUR_OPENWEATHERMAP_API_KEY';
    ```

   Replace `'YOUR_OPENWEATHERMAP_API_KEY'` with the API key you obtained from OpenWeatherMap.

   **Note:** Ensure that you add `config.dart` to your `.gitignore` file to prevent it from being versioned.

4. **Install dependencies:**

    ```bash
    flutter pub get
    ```

5. **Run the app:**

    ```bash
    flutter run
    ```

## Code Compilation

   To compile the Flutter code, use the following command:
   ```bash
    flutter build
   ```

## Running Tests

   To execute tests, run the following command:
   ```bash
    flutter test
   ```

## Integration Tests

Integration tests ensure that different parts of the application work together correctly. These tests may involve multiple screens and functionalities. To run integration tests, use the following command:
   ```bash
    flutter test integration_test
   ```
Make sure that you have a connected device or emulator before running the integration tests.

## Deploying the App

### Deploying for Android
   To deploy the app on an Android device, use the following command:
   ```bash
    flutter build apk
    flutter install
   ```

### Deploying for iOS
   To deploy the app on an iOS device, use the following command:
   ```bash
    flutter build ios
    flutter install
   ```

Make sure to have the appropriate development environment set up for each platform.

## Development Environment

### Flutter Version
   The Weather App has been tested with Flutter version 3.16.0. You can check your Flutter version using the following command:
   ```bash
    flutter --version
   ```

### Java Version
   This project has been tested with Java version 17. Verify the Java version flutter is using with:
   ```bash
    flutter doctor --verbose
   ```

### iOS Development Environment
   The Weather App has been tested on iOS with Xcode 14.0.1 and CocoaPods 1.11.3. Verify the iOS development environment flutter is using with:
   ```bash
    flutter doctor --verbose
   ```

Make sure to have the appropriate versions installed before building and running the project.

## Project Structure

The project follows a clean architecture and is organized into the following directories:

- **lib/config:** Contains the `config.dart` file for storing the OpenWeatherMap API key.
- **lib/core:** Includes common functionalities and error handling.
- **lib/features/cities:** Displays the list of cities and allows searching.
- **lib/features/weather:** Displays the current weather information and presents the 5-day weather forecast for a selected city.