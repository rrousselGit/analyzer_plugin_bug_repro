import 'dart:isolate';

import 'package:custom_lint/custom_lint.dart';

Future<void> main(List<String> args, SendPort sendPort) async {
  await start(args, sendPort);
}
