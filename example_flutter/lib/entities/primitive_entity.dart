import 'package:mock_annotation/mock_annotation.dart';

part 'primitive_entity.g.dart';

@Mock()
class PrimitiveEntity {
  const PrimitiveEntity({
    this.intValue,
    this.stringValue,
  });

  final int intValue;
  final String stringValue;

  factory PrimitiveEntity.createMock() => _$MockToPrimitiveEntity();
}
