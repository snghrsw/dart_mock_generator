import 'package:test/test.dart';
import 'package:build_test/build_test.dart';

import 'test_utils.dart';

void main() {
  group('CreateMockGenerator', () {
    test('ChildEntity', () async {
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

const _input = '''
$inputPrefixTemplate
@Mock()
class TestEntity {
  const TestEntity({
    this.childEntity,
  });

  final TestChildEntity childEntity;
  factory TestEntity.createMock() => _\$MockToTestEntity();
}

@Mock()
class TestChildEntity {
  const TestChildEntity({
    this.intValue,
  });

  final int intValue;
  factory TestChildEntity.createMock() => _\$MockToTestChildEntity();
}
''';

const _output = '''
$outputPrefixTemplate
TestEntity _\$MockToTestEntity() {
  const _faker = Faker();
  return TestEntity(
    childEntity: TestChildEntity.createMock(),
  );
}

TestChildEntity _\$MockToTestChildEntity() {
  const _faker = Faker();
  return TestChildEntity(
    intValue: _faker.randomGenerator.integer(99999),
  );
}
''';
