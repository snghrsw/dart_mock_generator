import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mock_generator/example/test_annotation.dart';
import 'package:source_gen/source_gen.dart';

class TestGenerator extends GeneratorForAnnotation<TestAnnotation> {
  const TestGenerator();
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element.kind != ElementKind.CLASS) {
      return '''
      // this is class
      ''';
    }
    final classElement = element as ClassElement;
    final fieldStrings = classElement.fields.map((field) {
      return '// ${field.type.toString()}';
    }).join('\n');
    return '''
    $fieldStrings
    ''';
  }
}
