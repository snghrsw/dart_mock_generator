library mock_generator.create_mock_genereator;

import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'mock_annotation.dart';
import 'mock_parser.dart';

class CreateMockGenerator extends GeneratorForAnnotation<Mock> {
  const CreateMockGenerator();
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
    return CreateMockParser().getParsedString(element);
  }
}
