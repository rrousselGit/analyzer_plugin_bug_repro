import 'dart:io';

final file = File('/Users/remirousselet/dev/rrousselGit/fake_riverpod/log.txt');

@Deprecated('message')
void log(Object msg) {
  file
    ..createSync(recursive: true)
    ..writeAsStringSync('$msg\n', mode: FileMode.append);
}
