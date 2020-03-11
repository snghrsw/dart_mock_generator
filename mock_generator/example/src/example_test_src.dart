import 'package:source_gen_test/annotations.dart';

import 'example_annotation.dart';

@ShouldGenerate(
  r'''
const TestClass1NameLength = 10;

const TestClass1NameLowerCase = testclass1;
''',
)
@ExampleAnnotation()
class TestClass1 {}
