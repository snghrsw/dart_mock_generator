import 'package:test/test.dart';
import 'package:build_test/build_test.dart';
import 'package:mock_generator/src/mock_parser.dart';

import 'test_utils.dart';

void main() {
  group('CreateMockGenerator', () {
    test('List fields', () async {
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
    this.listIntValue,
    this.listStringValue,
    this.listDynamicValue,
    this.listDoubleValue,
  });

  final List<int> listIntValue;
  final List<String> listStringValue;
  final List<dynamic> listDynamicValue;
  final List<double> listDoubleValue;
}

''';

final _output = '''
$outputPrefixTemplate
TestEntity _\$MockToTestEntity() {
  const _faker = Faker();
  return TestEntity(
    listIntValue: _faker.randomGenerator
              .amount((_) => null, _faker.randomGenerator.integer(20))
              .map((dynamic _) => _faker.randomGenerator.integer(99999))
              .toList(),
    listStringValue: _faker.randomGenerator
              .amount((_) => null, _faker.randomGenerator.integer(20))
              .map((dynamic _) => _faker.address.city())
              .toList(),
    listDynamicValue: _faker.randomGenerator
              .amount((_) => null, _faker.randomGenerator.integer(20))
              .map((dynamic _) => _faker.address.city())
              .toList(),
    listDoubleValue: _faker.randomGenerator
              .amount((_) => null, _faker.randomGenerator.integer(20))
              .map((dynamic _) => _faker.randomGenerator.double(99999))
              .toList(),
  );
}
''';
