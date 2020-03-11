import 'test_annotation.dart';

@TestAnnotation()
class TestEntity {
  const TestEntity({
    this.intValue,
    this.stringValue,
  });

  final int intValue;
  final String stringValue;
}
