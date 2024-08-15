Steps to reproduce:

- Clone this repository
- Do a global search of `path: /Users/remirousselet/dev/rrousselGit/fake_riverpod/packages/custom_lint` and replace it with an absolute path that points to `packages/custom_lint`
- Run `dart pub get` everywhere (the IDE should suggest it)
- Enable analyzer logs
- Restart the analyzer server


In the logs, you will see _some_ requests made to the analyzer plugin. Such as:

```
1723714208683:PluginReq:{"id"::"14","method"::"plugin.versionCheck","params"::{"byteStorePath"::"/Users/remirousselet/.dartServer/.analysis-driver","sdkPath"::"/Users/remirousselet/dev/flutter/bin/cache/dart-sdk","version"::"1.0.0-alpha.0"}}:file::///Users/remirousselet/.dartServer/.plugin_manager/12c93ced09bb72bc715613b8b9aeae4c/analyzer_plugin/bin/plugin.dart::
1723714208690:PluginRes:{"id"::"14","requestTime"::1723714208686,"result"::{"isCompatible"::true,"name"::"Custom Lint","version"::"1.0.0-alpha.0","interestingFiles"::["*.dart"]}}:file::///Users/remirousselet/.dartServer/.plugin_manager/12c93ced09bb72bc715613b8b9aeae4c/analyzer_plugin/bin/plugin.dart::
```

But there's never a `analysis.setContextRoots` request sent by default.

> [Note]
> If you restart the analyzer server while the plugin is running, and override
> `ServerPlugin.handleAnalysisSetContextRoots` to log somewhere in a while,
> you will see that the method is invoked right before `shutdown` is invoked.
>
> It is hard to see in the analyzer logs, because the request appears in the log right
> before the log file is cleared.