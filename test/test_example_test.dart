import 'package:mock_generator/src/annotated_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:build_test/build_test.dart';

void main() {
  group('generator tests', () {
    test('generator test', () async {
      var builder = PartBuilder([TestGeneratorAnnot()], '.g.dart');
      var assets = {
        'annotations|lib/annotations.dart': annotations,
        'annotations|lib/src/annotations_base.dart': annotationsBase,
        'source_gen_test|lib/test.dart': input
      };
      var outputs = {'source_gen_test|lib/test.g.dart': output};
      await testBuilder(builder, assets,
          outputs: outputs, rootPackage: 'source_gen_test');
    });
  });
}

var input = r'''
library source_gen_test;
import 'package:annotations/annotations.dart';
part 'test.g.dart';
@TestAnnot()
class Test {
  
}
''';

var annotations = r'''
export 'src/annotations_base.dart';
''';

var annotationsBase = r'''
class TestAnnot{
  const TestAnnot();
}
''';

var output = r'''
// GENERATED CODE - DO NOT MODIFY BY HAND
part of source_gen_test;
// **************************************************************************
// Generator: TestGeneratorAnnot
// **************************************************************************
//It worked!
''';
