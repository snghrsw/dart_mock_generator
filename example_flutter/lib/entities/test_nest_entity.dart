import 'package:mock_annotation/mock_annotation.dart';

import 'primitive_entity.dart';

part 'test_nest_entity.g.dart';

@Mock()
class TestNestEntity {
  const TestNestEntity({
    this.childEntity,
  });

  final PrimitiveEntity childEntity;

  factory TestNestEntity.createMock() => _$MockToTestNestEntity();
}
