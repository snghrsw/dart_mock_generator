import 'package:mock_generator/src/mock_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:build_test/build_test.dart';

void main() {
  group('CreateMockGenerator', () {
    test('primitive fields', () async {
      const generator = CreateMockGenerator();
      final builder = PartBuilder([generator], '.g.dart');

      final assets = {
        'mock_generator|lib/src/mock_annotation.dart': _annotation,
        'mock_generator|lib/src/mock_entity.dart': _input,
      };

      final outputs = {
        'mock_generator|lib/src/mock_entity.g.dart': _output,
      };

      await testBuilder(
        builder,
        assets,
        outputs: outputs,
      );
    });
  });
}

String _input = '''
import 'package:mock_generator/src/mock_annotation.dart';

part 'mock_entity.g.dart';

@Mock()
class TestEntity {
  const TestEntity({
    this.intValue,
    this.stringValue,
  });

  final int intValue;
  final String stringValue;
}

''';

const _output = r'''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mock_entity.dart';

// **************************************************************************
// CreateMockGenerator
// **************************************************************************

TestEntity _$MockToTestEntity() {
  const _faker = Faker();
  return TestEntity(
    intValue: _faker.randomGenerator.integer(99999),
    stringValue: _faker.address.city(),
  );
}
''';

const _annotation = '''
class Mock {
  const Mock();
}
''';
