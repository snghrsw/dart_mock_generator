import 'package:json_annotation/json_annotation.dart';
import 'package:mock_annotation/mock_annotation.dart';
// import 'package:mock_generator/src/mock_annotation.dart';

enum TestSerialEnum { one, two }

@Mock()
@JsonSerializable()
class TestEntity {
  const TestEntity({
    this.enumValue,
  });

  final TestSerialEnum enumValue;
}
