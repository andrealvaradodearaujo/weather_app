import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/core/resources/widget_keys.dart';
import 'package:weather_app/features/weather/presentation/page/current_weather_page.dart';
import 'package:weather_app/features/weather/presentation/page/next_days_forecast_page.dart';
import 'package:weather_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Test integration flow", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    // Assuming your search field has a specific key or some unique identifier.
    await tester.enterText(find.byKey(const Key(WidgetKeys.searchTextField)), 'Sao');
    await tester.pumpAndSettle();

    // Assuming the first result is "Sao Paulo, Brazil".
    await tester.tap(find.text(Strings.citySaoPauloBrazil));
    await tester.pumpAndSettle();

    // Verify if the current weather page is loaded.
    expect(find.byType(CurrentWeatherPage), findsOneWidget);

    // Assuming the button to view the next 5 days forecast has a specific key.
    await tester.tap(find.byKey(const Key(WidgetKeys.nextDaysForecastButton)));
    await tester.pumpAndSettle();

    // Verify if the next days forecast page is loaded.
    expect(find.byType(NextDaysForecastPage), findsOneWidget);

    await tester.pumpAndSettle();

  });
}