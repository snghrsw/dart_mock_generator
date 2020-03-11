import 'package:test/test.dart';
import 'package:build_test/build_test.dart';
import 'package:mock_generator/src/mock_parser.dart';

import 'test_utils.dart';

enum TestEnum { first, second }

void main() {
  group('CreateMockGenerator', () {
    test(DateTime.now().toIso8601String(), () async {
      final assets = {
        'mock_generator|lib/src/mock_annotation.dart': annotationTemplate,
        'mock_generator|lib/src/mock_entity.dart': _inputOnlyMock,
        'mock_generator|lib/src/mock_entity.g.dart': _outputNull,
      };

      final outputs = {
        'mock_generator|lib/src/mock_entity.g.dart': _outputNull,
      };

      await testBuilder(
        builder,
        assets,
        reader: await PackageAssetReader.currentIsolate(),
        outputs: outputs,
      );
    });
  });
}

String _inputOnlyMock = '''
$inputPrefixTemplate

@Mock()
class TestEntity {
  const TestEntity({
    this.enumValue,
  });

  final TestEnum enumValue;
}
''';

final _outputNull = '''
$outputPrefixTemplate
TestEntity _\$MockToTestEntity() {
  const _faker = Faker();
  return TestEntity(
    enumValue: null,
  );
}
''';
