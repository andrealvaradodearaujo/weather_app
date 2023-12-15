import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/features/weather/data/models/sys_info_model.dart';

void main() {
  group('SysInfoModel', () {
    late SysInfoModel sysInfoModel;

    setUp(() {
      sysInfoModel = const SysInfoModel('US', 1638826800, 1638870000);
    });

    test('toJson should return a valid map', () {
      // Act
      final result = sysInfoModel.toJson();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['country'], 'US');
      expect(result['sunrise'], 1638826800);
      expect(result['sunset'], 1638870000);
    });

    test('fromJson should create a valid SysInfoModel from a map', () {
      // Arrange
      final jsonData = {'country': 'US', 'sunrise': 1638826800, 'sunset': 1638870000};

      // Act
      final result = SysInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<SysInfoModel>());
      expect(result.country, 'US');
      expect(result.sunrise, 1638826800);
      expect(result.sunset, 1638870000);
    });

    test('fromJson should handle null values', () {
      // Arrange
      final jsonData = <String, dynamic>{};

      // Act
      final result = SysInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<SysInfoModel>());
      expect(result.country, isNull);
      expect(result.sunrise, isNull);
      expect(result.sunset, isNull);
    });

    test('props should return a list of correct props', () {
      // Arrange
      final expectedProps = ['US', 1638826800, 1638870000];

      // Act
      final result = sysInfoModel.props;

      // Assert
      expect(result, equals(expectedProps));
    });
  });
}
