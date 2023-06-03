// ignore_for_file: avoid_print

import 'dart:io';

import 'package:yaml/yaml.dart';

import 'deploy.dart';

class CliCommands {
  /// Deploy app to Github Pages
  void deployApp({required String? path}) {
    final config = _getConfig(configFile: path);
    _deployToGithubPages(config);
  }

  /// Deploy app to github pages based on a config argument
  void _deployToGithubPages(Map<String, dynamic> config) {
    String? repository = config[_Parameter.repository];
    if (repository == null) {
      print("Kindly add repository url to pubspec.yaml");
      return;
    }
    Deploy.start(
        repoUrl: repository, customBuildCommand: config[_Parameter.build]);
  }

  /// Get config from `pubspec.yaml` or `flutter_sitesurface_deploy.yaml`
  Map<String, dynamic> _getConfig({required String? configFile}) {
    // if `flutter_sitesurface_deploy.yaml` exists use it as config file, otherwise use `pubspec.yaml`
    String? filePath;
    if (configFile != null) {
      if (File(configFile).existsSync()) {
        filePath = configFile;
      } else {
        print('The config file `$configFile` was not found.');
        exit(1);
      }
    } else if (File('sitesurface_flutter_deploy.yaml').existsSync()) {
      filePath = 'sitesurface_flutter_deploy.yaml';
    } else {
      filePath = 'pubspec.yaml';
    }

    final Map yamlMap = loadYaml(File(filePath).readAsStringSync()) as Map;

    if (yamlMap['sitesurface_flutter_deploy'] is! Map) {
      throw Exception(
        'Your `$filePath` file does not contain a '
        '`sitesurface_flutter_deploy` section.',
      );
    }

    // yamlMap has the type YamlMap, which has several unwanted side effects
    return _yamlToMap(yamlMap['sitesurface_flutter_deploy'] as YamlMap);
  }

  Map<String, dynamic> _yamlToMap(YamlMap yamlMap) {
    final Map<String, dynamic> map = <String, dynamic>{};
    for (final MapEntry<dynamic, dynamic> entry in yamlMap.entries) {
      if (entry.value is YamlList) {
        final list = <String>[];
        for (final value in entry.value as YamlList) {
          if (value is String) {
            list.add(value);
          }
        }
        map[entry.key as String] = list;
      } else if (entry.value is YamlMap) {
        map[entry.key as String] = _yamlToMap(entry.value as YamlMap);
      } else {
        map[entry.key as String] = entry.value;
      }
    }
    return map;
  }
}

class _Parameter {
  static const repository = 'repository';
  static const build = "build";
}
