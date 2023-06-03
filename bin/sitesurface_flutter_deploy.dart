import 'package:args/args.dart';
import 'package:sitesurface_flutter_deploy/src/cli_commands.dart';

void main(List<String> args) {
  final parser = ArgParser();
  final cliCommands = CliCommands();
  parser.addOption('path');

  final parsedArgs = parser.parse(args);

  cliCommands.deployApp(
    path: parsedArgs['path']?.toString(),
  );
}
