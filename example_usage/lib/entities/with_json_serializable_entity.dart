import 'package:json_annotation/json_annotation.dart';
import 'package:mock_annotation/mock_annotation.dart';

part 'with_json_serializable_entity.g.dart';

@Mock()
@JsonSerializable()
class WithJsonSerializableEntity {
  const WithJsonSerializableEntity({
    this.intValue,
    this.stringValue,
  });

  factory WithJsonSerializableEntity.fromJson(Map<String, dynamic> json) =>
      _$WithJsonSerializableEntityFromJson(json);

  factory WithJsonSerializableEntity.createMock() =>
      _$MockToWithJsonSerializableEntity();

  Map<String, dynamic> toJson() => _$WithJsonSerializableEntityToJson(this);

  final int intValue;
  final String stringValue;
}
