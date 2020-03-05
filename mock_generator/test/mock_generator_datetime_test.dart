import 'package:test/test.dart';
import 'package:build_test/build_test.dart';
import 'package:mock_generator/src/mock_parser.dart';

import 'test_utils.dart';

void main() {
  group('CreateMockGenerator', () {
    test('DateTime fields', () async {
      final assets = {
        'mock_generator|lib/src/mock_annotation.dart': annotationTemplate,
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
$inputPrefixTemplate
@Mock()
class TestEntity {
  const TestEntity({
    this.dateTimeValue,
  });

  final DateTime dateTimeValue;
}

''';

final _output = '''
$outputPrefixTemplate
TestEntity _\$MockToTestEntity() {
  const _faker = Faker();
  return TestEntity(
    dateTimeValue: ${CreateMockParser().fakerDateTimeString},
  );
}
''';
