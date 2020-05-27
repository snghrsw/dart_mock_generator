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

@ShouldGenerate('''
ListEntity _\$MockToListEntity() {
  const _faker = Faker();
  return ListEntity(
    listIntValue: _faker.randomGenerator
        .numbers(99999, _faker.randomGenerator.integer(10)),
    listStringValue: _faker.randomGenerator
        .amount((_) => _faker.address.city(), 20, min: 0)
        .map((dynamic v) => v.toString())
        .toList(),
    listDynamicValue:
        _faker.randomGenerator.amount((_) => _faker.address.city(), 20, min: 0),
    listDoubleValue: _faker.randomGenerator
        .amount((_) => _faker.randomGenerator.decimal(), 20, min: 0),
  );
}
''')
@Mock()
class ListEntity {
  const ListEntity({
    this.listIntValue,
    this.listStringValue,
    this.listDynamicValue,
    this.listDoubleValue,
  });

  final List<int> listIntValue;
  final List<String> listStringValue;
  final List<dynamic> listDynamicValue;
  final List<double> listDoubleValue;
}

@ShouldGenerate('''
EnumEntity _\$MockToEnumEntity() {
  const _faker = Faker();
  return EnumEntity(
    enumValue: _faker.randomGenerator.element(EnumData.values),
  );
}
''')
@Mock()
class EnumEntity {
  const EnumEntity({
    this.enumValue,
  });

  final EnumData enumValue;
}

@ShouldGenerate('''
ListClassEntity _\$MockToListClassEntity() {
  const _faker = Faker();
  return ListClassEntity(
    listChildValues: _faker.randomGenerator
        .amount((_) => null, _faker.randomGenerator.integer(30), min: 0)
        .map<_ChildEntity>((dynamic _) => _ChildEntity.createMock())
        .toList(),
  );
}
''')
@Mock()
class ListClassEntity {
  const ListClassEntity({
    this.listChildValues,
  });

  final List<_ChildEntity> listChildValues;
}
