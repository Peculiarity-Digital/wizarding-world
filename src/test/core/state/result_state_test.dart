import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wizarding_world/core/index.dart';

void main() {
  group('ResultState', () {
    test('ResultSuccess - provided result should be success', () {
      // Arrange
      const expectedResult = "Success Data";

      // Act
      const resultState = ResultSuccess(expectedResult);

      // Assert
      expect(resultState.result, expectedResult);
      expect(resultState.error, null);
    });

    test('ResultException - provided result should be exception', () {
      // Arrange
      final expectedResult = DioException(
        requestOptions: RequestOptions(
          data: "Exception",
        ),
      );

      // Act
      final resultState = ResultException<DioException>(expectedResult);

      // Assert
      expect(resultState.error, expectedResult);
      expect(resultState.result, null);
    });
  });
}
