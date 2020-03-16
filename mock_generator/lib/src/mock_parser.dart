import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dart_style/dart_style.dart';

class CreateMockParser {
  String getParsedString(Element element) {
    final classElement = element as ClassElement;
    final fieldStrings = classElement.fields
        .map((_field) {
          // fieldでない場合
          if (_field.kind is! ElementKind) {
            return '\n${_field.displayName}: ${_field.constantValue},';
          }
          // fieldの場合
          final fieldValue = getMethod(_field);
          return '\n${_field.displayName}: $fieldValue,';
        })
        .toList()
        .join('');

    return DartFormatter().format('''
      ${element.name} _\$MockTo${element.name}() {
        const _faker = Faker();
        return ${element.name}(
          $fieldStrings
        );
      }
      ''');
  }

  final String fakerDateTimeString = '_faker.date.dateTime()';
  String fakerEnumString(String typeStr) =>
      '_faker.randomGenerator.element($typeStr.values)';

  String fakerClassString<T>(T typeStr) => 'typeStr.createMock()';

  String getMethod(FieldElement _elm) {
    try {
      if (_elm.type.isDartCoreInt) {
        return '_faker.randomGenerator.integer(99999)';
      }

      if (_elm.type.isDartCoreString) {
        return '_faker.address.city()';
      }

      if (_elm.type.getDisplayString() == 'DateTime') {
        return fakerDateTimeString;
      }

      if (_elm.type.isDartCoreDouble) {
        return '_faker.randomGenerator.decimal()';
      }

      if (_elm.type.isDartCoreBool) {
        return '_faker.randomGenerator.element([true, false])';
      }

      if (_elm.kind == ElementKind.CLASS) {
        return fakerClassString(_elm.type.getDisplayString());
      }

      if (_elm.isEnumConstant) {
        return fakerEnumString(_elm.type.getDisplayString());
      }

      if (_elm.type is InterfaceType) {
        if (_elm.isEnumConstant) {
          return fakerEnumString(_elm.type.getDisplayString());
        }
      }

      // Next Class
      if (((_elm.type as InterfaceType).constructors ?? [])
          .any((field) => field.name == 'createMock')) {
        return '${_elm.type.getDisplayString()}.createMock()';
      }

      // Enum
      if (((_elm.type as InterfaceType).constructors ?? [])
          .any((field) => field.name == 'values')) {
        return fakerEnumString(_elm.type.getDisplayString());
      }

      // List
      // if ((_elm.type as InterfaceType).isDartCoreList) {
      //   return 'list:${(_elm.type as InterfaceType).getDisplayString()}';
      // }

      // List<int>
      if (_elm.type.getDisplayString().contains('List<int>')) {
        return '''_faker.randomGenerator.numbers(99999, _faker.randomGenerator.integer(10))''';
      }

      // List<String>
      if (_elm.type.getDisplayString().contains('List<String>')) {
        return '''_faker.randomGenerator.amount((_) => _faker.address.city(), 20, min: 0)''';
      }

      // List<double>
      if (_elm.type.getDisplayString().contains('List<double>')) {
        return '''_faker.randomGenerator.amount((_) => _faker.randomGenerator.decimal(), 20, min: 0)''';
      }

      // List<dynamic>
      if (_elm.type.getDisplayString().contains('List<dynamic>')) {
        return '''_faker.randomGenerator.amount((_) => _faker.address.city(), 20, min: 0)''';
      }

      // List<Class>
      if (_elm.type.getDisplayString().contains('List<')) {
        final className = _elm.type
            .getDisplayString()
            .substring(5, _elm.type.getDisplayString().length - 1);
        return '''_faker.randomGenerator.amount((_) => $className.createMock(), 20, min: 0)''';
      }

      if (_elm.type is List) {
        return '[]';
      }

      if (_elm.type.isObject) {
        return 'null';
      }

      if (_elm.type.isDynamic) {
        return 'null';
      }

      return fakerEnumString(_elm.type.getDisplayString());
    } catch (e) {
      print(e.toString());
      return 'null';
    }
  }
}
