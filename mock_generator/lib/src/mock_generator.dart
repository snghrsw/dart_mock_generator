import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mock_annotation/mock_annotation.dart';
// import 'package:mock_generator/mock_generator.dart';
import 'package:mock_generator/src/mock_parser.dart';
import 'package:source_gen/source_gen.dart';

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
