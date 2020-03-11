import 'package:mock_annotation/mock_annotation.dart';

part 'list_entity.g.dart';

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

  factory ListEntity.createMock() => _$MockToListEntity();
}
