import 'package:mock_generator/src/mock_annotation.dart';

@Mock()
class TestEntity {
  const TestEntity({
    this.intValue,
    this.stringValue,
  });

  final int intValue;
  final String stringValue;
}
