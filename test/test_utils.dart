import 'package:mock_generator/src/mock_generator.dart';
import 'package:source_gen/source_gen.dart';

const inputPrefixTemplate = '''
import 'package:mock_generator/src/mock_annotation.dart';

part 'mock_entity.g.dart';
''';

const outputPrefixTemplate = '''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mock_entity.dart';

// **************************************************************************
// CreateMockGenerator
// **************************************************************************
''';

const annotationTemplate = '''
class Mock {
  const Mock();
}
''';

const generator = CreateMockGenerator();
final PartBuilder builder = PartBuilder([generator], '.g.dart');
