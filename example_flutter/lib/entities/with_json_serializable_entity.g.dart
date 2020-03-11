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
  return WithJsonSerializableEntity(
    intValue: json['intValue'] as int,
    stringValue: json['stringValue'] as String,
  );
}

Map<String, dynamic> _$WithJsonSerializableEntityToJson(
        WithJsonSerializableEntity instance) =>
    <String, dynamic>{
      'intValue': instance.intValue,
      'stringValue': instance.stringValue,
    };
