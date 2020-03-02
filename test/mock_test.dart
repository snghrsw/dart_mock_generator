import 'package:mock_generator/mock.dart';
import 'package:test/test.dart';

@Mock()
class TestClass {
  final int value = 5;
}

void main() {
  group('Mock', () {
    test('@Mock()', () {
      expect(
        TestClass().value,
        equals(5),
      );
    });
  });
}
