import 'dart:async';

import 'package:mock_annotation/mock_annotation.dart';
import 'package:mock_generator/src/mock_generator.dart';
import 'package:source_gen_test/src/build_log_tracking.dart';
import 'package:source_gen_test/src/init_library_reader.dart';
import 'package:source_gen_test/src/test_annotated_classes.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
    'test',
    'test_cases.dart',
  );

  initializeBuildLogTracking();
  testAnnotatedElements<Mock>(
    reader,
    const CreateMockGenerator(),
  );
}
