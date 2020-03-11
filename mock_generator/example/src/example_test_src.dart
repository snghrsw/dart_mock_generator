import 'package:source_gen_test/annotations.dart';

import 'test_annotation.dart';

@ShouldGenerate(r'''
// generated
''')
@TestAnnotation()
class TestEntity {}
