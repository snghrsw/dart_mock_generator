import '../builder.dart';

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
