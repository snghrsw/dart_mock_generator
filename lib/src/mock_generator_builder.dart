import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'mock_generator.dart';

Builder mockGeneratorBuilder(BuilderOptions options) => SharedPartBuilder(
      [const CreateMockGenerator()],
      'create_mock_annotation',
    );
