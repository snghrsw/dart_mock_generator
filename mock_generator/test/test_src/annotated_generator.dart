import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'test_annotation.dart';

class TestGeneratorAnnot extends GeneratorForAnnotation<TestAnnotation> {
  const TestGeneratorAnnot();

  @override
  dynamic generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    return '// generated';
  }
}

class TestGenerator extends Generator {
  const TestGenerator();

  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    return '// generated';
  }
}
