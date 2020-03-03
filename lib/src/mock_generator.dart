import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'mock_annotation.dart';
import 'mock_parser.dart';
// import 'mock_annotation.dart';

// class CreateMockGenerator extends GeneratorForAnnotation<Mock> {
//   const CreateMockGenerator();
//   @override
//   FutureOr<String> generateForAnnotatedElement(
//     Element element,
//     ConstantReader annotation,
//     BuildStep buildStep,
//   ) {
//     if (element.kind != ElementKind.CLASS) {
//       return null;
//     }

//     return CreateMockParser().getParsedString(element);
//   }
// }

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
