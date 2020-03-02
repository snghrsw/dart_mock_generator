import 'dart:async';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../mock.dart';

class CreateMockGenerator extends GeneratorForAnnotation<Mock> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element.kind != ElementKind.CLASS) {
      return null;
    }

    final classElement = element as ClassElement;

    final result = classElement.fields
        .map((e) {
          // fieldでない場合
          if (e.kind.name != 'FIELD') {
            return '\n${e.displayName}: ${e.constantValue},';
          }
          // fieldの場合
          return '\n${e.displayName}: ${getMethod(e.type)},';
        })
        .toList()
        .join('');

    return '''
      ${element.name} _\$MockTo${element.name}() {
        const _faker = Faker();
        return ${element.name}(
          $result
        );
      }
      ''';
  }
}

String getMethod(DartType type) {
  if (type.toString() == 'DateTime') {
    return '_faker.date.dateTime()';
  }

  if (type.isDartCoreInt) {
    return '_faker.randomGenerator.integer(99999)';
  }

  if (type.isDartCoreString) {
    return '_faker.address.city()';
  }

  if (type.isDynamic) {
    return 'null';
  }

  if (type.isDartCoreDouble) {
    return '_faker.randomGenerator.decimal()';
  }

  if (type.isDartCoreBool) {
    return '_faker.randomGenerator.element([true, false])';
  }
  if (type is InterfaceType) {
    if (type.element.isEnum) {
      final typeStr = type.getDisplayString();
      return '_faker.randomGenerator.element($typeStr.values())';
    }
  }

  if (type.toString() == 'List') {
    return '[]';
  }

  if (type.isObject) {
    return 'null';
  }

  return 'null';
}
