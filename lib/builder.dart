library mock_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/mock_generator.dart';

export 'src/mock_annotation.dart';

Builder mockGeneratorBuilder(BuilderOptions options) => SharedPartBuilder(
      [const CreateMockGenerator()],
      'create_mock_annotation',
    );
