// import 'package:source_gen_test/src/build_log_tracking.dart';
// import 'package:source_gen_test/src/init_library_reader.dart';
// import 'package:source_gen_test/src/test_annotated_classes.dart';
// import 'package:test/test.dart';

// import 'test_src/annotated_generator.dart';
// import 'test_src/test_annotation.dart';

// void main() {
//   test('SourceGenTest', () async {
//     final reader = await initializeLibraryReaderForDirectory(
//       // 'mock_generator/test/example/src',
//       // 'mock_generator/test/example/src/source_gen_src.dart',
//       'example/src',
//       'example/src/source_gen_src.dart',
//     );

//     initializeBuildLogTracking();
//     testAnnotatedElements<TestAnnotation>(
//       reader,
//       const TestGeneratorAnnot(),
//       // additionalGenerators: const {},
//     );
//   });
// }

// import 'package:test/test.dart';

import '../example/example.dart' as example_test;

Future<void> main() async {
  await example_test.main();
}
