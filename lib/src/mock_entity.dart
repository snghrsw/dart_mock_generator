import 'package:mock_generator/mock_generator.dart';

@Mock()
class TestEntity {
  const TestEntity({
    this.intValue,
    this.stringValue,
  });

  final int intValue;
  final String stringValue;
}
