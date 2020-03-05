import 'package:mock_annotation/mock_annotation.dart';

part 'enum_entity.g.dart';

enum TestSerialEnum { one, two }

@Mock()
class EnumEntity {
  const EnumEntity({
    this.enumValue,
  });

  final TestSerialEnum enumValue;

  factory EnumEntity.createMock() => _$MockToEnumEntity();
}
