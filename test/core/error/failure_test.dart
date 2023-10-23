import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/error/failure.dart';

void main() {
  const testError = 'testErorr';

  group('testErorr', () {
    test('should return server error message', () {
      expect(const ServerFailure(testError).props, [testError]);
    });

    test('should return connection error message', () {
      expect(const ConnectioFailure(testError).props, [testError]);
    });
  });
}
