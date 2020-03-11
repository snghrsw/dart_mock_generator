import 'dart:async';

import 'package:source_gen_test/src/build_log_tracking.dart';
import 'package:source_gen_test/src/init_library_reader.dart';
import 'package:source_gen_test/src/test_annotated_classes.dart';

import 'src/test_annotation.dart';
import 'src/test_generator.dart';

Future<void> main() async {
  final reader = await initializeLibraryReaderForDirectory(
      'example/src', 'example_test_src.dart');

  initializeBuildLogTracking();
  testAnnotatedElements<TestAnnotation>(
    reader,
    const TestGenerator(),
    // additionalGenerators: const {
    //   'no-prefix-required': ExampleGenerator(requireTestClassPrefix: false)
    // },
  );
}
