import 'dart:isolate';
import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
import 'package:analyzer_plugin/starter.dart';

Future<void> start(List<String> args, SendPort sendPort) async {
  ServerPluginStarter(Plugin()).start(sendPort);
}

class Plugin extends ServerPlugin {
  Plugin() : super(resourceProvider: PhysicalResourceProvider.INSTANCE);

  @override
  Future<void> analyzeFile({
    required AnalysisContext analysisContext,
    required String path,
  }) async {}

  @override
  List<String> get fileGlobsToAnalyze => ['*.dart'];

  @override
  String get name => 'Custom Lint';

  @override
  String get version => '1.0.0-alpha.0';
}
