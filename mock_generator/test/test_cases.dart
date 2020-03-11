import 'package:mock_annotation/mock_annotation.dart';
import 'package:source_gen_test/annotations.dart';

part 'test_utils.dart';

@ShouldGenerate('''
PrimitiveEntity _\$MockToPrimitiveEntity() {
  const _faker = Faker();
  return PrimitiveEntity(
    intValue: _faker.randomGenerator.integer(99999),
    stringValue: _faker.address.city(),
    dateTimeValue: _faker.date.dateTime(),
    childEntity: _ChildEntity.createMock(),
  );
}
''')
@Mock()
class PrimitiveEntity {
  const PrimitiveEntity({
    this.intValue,
    this.stringValue,
    this.dateTimeValue,
    this.childEntity,
  });

  factory PrimitiveEntity.createMock() => _$MockToPrimitiveEntity();

  final int intValue;
  final String stringValue;
  final DateTime dateTimeValue;
  final _ChildEntity childEntity;
}
