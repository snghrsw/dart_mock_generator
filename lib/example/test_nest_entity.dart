import 'package:mock_generator/src/mock_annotation.dart';

@Mock()
class TestEntity {
  const TestEntity({
    this.childEntity,
  });

  final TestChildEntity childEntity;
}

@Mock()
class TestChildEntity {
  const TestChildEntity({
    this.intValue,
  });

  final int intValue;
}
