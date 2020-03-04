import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:mock_generator/example/test_annotation.dart';
import 'package:source_gen/source_gen.dart';

class TestGeneratorAnnot extends GeneratorForAnnotation<TestAnnotation> {
  const TestGeneratorAnnot();

  @override
  dynamic generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    var code = '''
    //It worked!
    ''';
    return code;
  }
}

class TestGenerator extends Generator {
  const TestGenerator();

  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    var code = '''
    //It worked!
    ''';
    return code;
  }
}
