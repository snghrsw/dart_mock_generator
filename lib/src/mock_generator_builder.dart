import 'package:build/build.dart';
import 'package:mock_generator/src/mock_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder mockGeneratorBuilder(BuilderOptions options) => SharedPartBuilder(
      [const CreateMockGenerator()],
      'create_mock_annotation',
    );
