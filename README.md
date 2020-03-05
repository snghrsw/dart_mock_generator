

# Example


### Target file

```dart
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

```


### Export file

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primitive_entity.dart';

// **************************************************************************
// CreateMockGenerator
// **************************************************************************

PrimitiveEntity _$MockToPrimitiveEntity() {
  const _faker = Faker();
  return PrimitiveEntity(
    intValue: _faker.randomGenerator.integer(99999),
    stringValue: _faker.address.city(),
  );
}

```