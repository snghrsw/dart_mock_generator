import 'package:analyzer/dart/element/type.dart';
import 'package:mock_generator/src/mock_generator.dart';
import 'package:test/test.dart';

enum TestEnum { first, second }

void main() {
  group('MockGenerator', () {
    test('getMethod() => String', () {
      final resultString = getMethod(String as DartType);
      expect(
        resultString,
        equals('_faker.address.city()'),
      );
    });

    test('getMethod() => Enum', () {
      final resultString = getMethod(TestEnum as DartType);
      expect(
        resultString,
        equals('_faker.randomGenerator.element(TestEnum.values)'),
      );
    });
  });
}
