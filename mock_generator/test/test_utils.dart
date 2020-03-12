part of 'test_cases.dart';

PrimitiveEntity _$MockToPrimitiveEntity() {
  const _faker = Faker();
  return PrimitiveEntity(
    intValue: _faker.randomGenerator.integer(99999),
    stringValue: _faker.address.city(),
    dateTimeValue: _faker.date.dateTime(),
    childEntity: _ChildEntity.createMock(),
  );
}

class _ChildEntity {
  const _ChildEntity({
    this.intValue,
  });
  factory _ChildEntity.createMock() => _$MockToChildEntity();
  final int intValue;
}

_ChildEntity _$MockToChildEntity() {
  const _faker = Faker();

  return _ChildEntity(
    intValue: _faker.randomGenerator.integer(99999),
  );
}

enum EnumData { data1, data2, data3 }
