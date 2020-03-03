import 'package:test/test.dart';
import 'package:build_test/build_test.dart';
import 'package:mock_generator/src/mock_parser.dart';

import 'test_utils.dart';

enum TestEnum { first, second }

void main() {
  group('CreateMockGenerator', () {
    test('Enum field: JsonSerializeAnnotationが無い場合はnull', () async {
      final assets = {
        'mock_generator|lib/src/mock_annotation.dart': annotationTemplate,
        'mock_generator|lib/src/mock_entity.dart': _inputOnlyMock,
      };

      final outputs = {
        'mock_generator|lib/src/mock_entity.g.dart': _outputNull,
      };

      await testBuilder(
        builder,
        assets,
        outputs: outputs,
      );
    });

    // test('Enum field: JsonSerializeAnnotationがある場合はenum値がとれる', () async {
    //   final assets = {
    //     'mock_generator|lib/src/mock_annotation.dart': annotationTemplate,
    //     'mock_generator|lib/src/mock_entity.dart': _inputWithSerializable,
    //     'mock_generator|lib/src/mock_entity.g.dart': _inputGenerated,
    //   };

    //   final outputs = {
    //     'mock_generator|lib/src/mock_entity.g.dart': _outputWithSerializable,
    //   };

    //   await testBuilder(
    //     builder,
    //     assets,
    //     outputs: outputs,
    //   );
    // });
  });
}

// const _inputGenerated = r'''
// part of 'test_entity.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// TestEntity _$TestEntityFromJson(Map<String, dynamic> json) {
//   return $checkedNew('TeacherEntity', json, () {
//     final val = TestEntity(
//       enumValue: (v) => v == null
//               ? null
//               : TestEntity.fromJson(v as Map<String, dynamic>)),
//     );
//     return val;
//   });
// }

// Map<String, dynamic> _$TestEntityToJson(TestEntity instance) =>
//     <String, dynamic>{
//       'enumValue': instance.enumValue,
//     };
// ''';

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

// String _inputWithSerializable = '''
// $inputPrefixTemplate
// import 'package:flutter/material.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:mock_generator/src/mock_annotation.dart';

// part 'test_entity.g.dart';

// @Mock()
// @JsonSerializable()
// class TestEntity {
//   const TestEntity({
//     @required this.enumValue,
//   });

//   final TestEnum enumValue;

//   factory TestEntity.fromJson(Map<String, dynamic> json) =>
//       _\$TestEntityFromJson(json);

//   factory TestEntity.createMock() => _\$MockToTestEntity();

//   Map<String, dynamic> toJson() => _\$TestEntityToJson(this);
// }

// ''';

// final _outputWithSerializable = '''
// $outputPrefixTemplate
// TestEntity _\$MockToTestEntity() {
//   const _faker = Faker();
//   return TestEntity(
//     enumValue: ${CreateMockParser().fakerEnumString('TestEnum')},
//   );
// }
// ''';

final _outputNull = '''
$outputPrefixTemplate
TestEntity _\$MockToTestEntity() {
  const _faker = Faker();
  return TestEntity(
    enumValue: null,
  );
}
''';
