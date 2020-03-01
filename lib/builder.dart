import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/mock_generator.dart';

Builder mockGeneratorBuilder(BuilderOptions options) => SharedPartBuilder(
      [CreateMockGenerator()],
      'create_mock_annotation',
    );
