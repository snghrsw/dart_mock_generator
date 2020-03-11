import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'test_annotation.dart';

class TestGenerator extends GeneratorForAnnotation<TestAnnotation> {
  const TestGenerator();

  @override
  dynamic generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return '// generated';
  }
}
