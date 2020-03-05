// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'with_json_serializable_entity.dart';

// **************************************************************************
// CreateMockGenerator
// **************************************************************************

WithJsonSerializableEntity _$MockToWithJsonSerializableEntity() {
  const _faker = Faker();
  return WithJsonSerializableEntity(
    intValue: _faker.randomGenerator.integer(99999),
    stringValue: _faker.address.city(),
  );
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithJsonSerializableEntity _$WithJsonSerializableEntityFromJson(
    Map<String, dynamic> json) {
  return $checkedNew('WithJsonSerializableEntity', json, () {
    final val = WithJsonSerializableEntity(
      intValue: $checkedConvert(json, 'intValue', (v) => v as int),
      stringValue: $checkedConvert(json, 'stringValue', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$WithJsonSerializableEntityToJson(
        WithJsonSerializableEntity instance) =>
    <String, dynamic>{
      'intValue': instance.intValue,
      'stringValue': instance.stringValue,
    };
