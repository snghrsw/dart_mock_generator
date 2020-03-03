import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';

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

    return '''
      ${element.name} _\$MockTo${element.name}() {
        const _faker = Faker();
        return ${element.name}(
          $fieldStrings
        );
      }
      ''';
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

      if (_elm.type is List) {
        return '[]';
      }

      if (_elm.type.isObject) {
        return 'null';
      }

      if (_elm.type.isDynamic) {
        return 'null';
      }

      return 'null';
    } catch (e) {
      print(e.toString());
      return 'null';
    }
  }
}
