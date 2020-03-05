import 'package:mock_annotation/mock_annotation.dart';

@Mock()
class TestEntity {
  const TestEntity({
    this.intValue,
    this.stringValue,
  });

  final int intValue;
  final String stringValue;
}
