import 'package:analyzer/dart/element/type.dart';
import 'package:mock_generator/src/mock_parser.dart';
import 'package:test/test.dart';
import 'package:analyzer/dart/element/element.dart';

enum TestEnum { first, second }

class TestStringClass {
  String stringValue;
}

class TestDateTimeClass {
  DateTime dateValue;
}

class TestClassTimeClass {
  TestDateTimeClass classValue;
}

void main() {
  group('MockParser', () {
    final _parser = CreateMockParser();
    test('getMethod() => DateTime', () {
      // final field = ((TestStringClass as Element) as ClassElement).fields[0];
      final resultString = _parser.getMethod();
      expect(
        resultString,
        equals(_parser.fakerDateTimeString),
      );
    });
    test('getMethod() => String', () {
      // final field = (TestDateTimeClass() as ClassElement).fields[0];

      final resultString = _parser.getMethod(String as DartType);
      expect(
        resultString,
        equals('_faker.address.city()'),
      );
    });

    test('getMethod() => Enum', () {
      // final field = (TestEnum as ClassElement).fields[0];
      final resultString = _parser.getMethod(TestEnum as DartType);
      expect(
        resultString,
        equals('_faker.randomGenerator.element(TestEnum.values)'),
      );
    });

    test('getMethod() => Class', () {
      // final field = (TestClassTimeClass() as ClassElement).fields[0];
      final resultString = _parser.getMethod(TestDateTimeClass as DartType);
      expect(
        resultString,
        equals('TestDateTimeClass.createMock()'),
      );
    });
  });
}
