// ignore_for_file: avoid_print

import 'dart:io';

class Deploy {
  static void start({required String repoUrl, String? customBuildCommand}) {
    try {
      // Define variables
      var repoName = repoUrl.split('/').last.replaceAll('.git', '');

      var timestamp = DateTime.now().millisecondsSinceEpoch;
      print("🛠️  Building Web Project...");
      if (customBuildCommand != null) {
        _runProcess(command: customBuildCommand);
      } else {
        // Building Project
        _runProcess(command: "flutter clean");
        _runProcess(command: "flutter flutter pub get");
        _runProcess(command: "flutter build web --base-href /$repoName/");
      }
      // preparing changes
      print("🚀 Preparing for deploy ...");
      _runProcess(command: "cp index.html 404.html", workingDir: "build/web");
      _runProcess(command: "mkdir temp", workingDir: "build/web");
      _runProcess(
          command: "git clone $repoUrl .", workingDir: "build/web/temp");
      _runProcess(command: "cp -r temp/.git .", workingDir: "build/web");
      _runProcess(command: "rm -rf temp", workingDir: "build/web");

      // pushing the changes
      _runProcess(command: "git add .", workingDir: "build/web");
      _runProcess(
          command: "git commit -m 'Automatic_deploy_$timestamp'",
          workingDir: "build/web");
      _runProcess(command: "git push origin main", workingDir: "build/web");

      // cleaning up
      _runProcess(
        command: "rm -rf build/web",
      );
      print('✅ Successfully Deployed');

      String githubPageUrl = "";
      if (repoUrl.startsWith("https")) {
        String tempUrl =
            repoUrl.split('github.com/').last.replaceAll('.git', '');
        githubPageUrl = 'https://${tempUrl.replaceAll('/', '.github.io/')}';
      } else {
        String tempUrl = repoUrl.split(':').last.replaceAll('.git', '');
        githubPageUrl = 'https://${tempUrl.replaceAll('/', '.github.io/')}';
      }

      print("Your changes are live here 👉 : $githubPageUrl");
    } catch (e) {
      print(e.toString());
    }
  }

  static void _runProcess({required String command, String workingDir = "."}) {
    try {
      var commandArgs = command.split(" ");
      var arguments = [...commandArgs];
      arguments.removeAt(0);
      Process.runSync(commandArgs[0], arguments,
          runInShell: true, workingDirectory: workingDir);
    } catch (e) {
      print(e.toString());
    }
  }
}
