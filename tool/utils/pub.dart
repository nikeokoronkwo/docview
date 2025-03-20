import 'dart:convert';
import 'dart:io';

import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as p;

class PubspecYaml {
  Map<String, dynamic> _map;

  PubspecYaml(this._map);
}

PubspecYaml readPubspecYaml() {
  return PubspecYaml(json.decode(loadYaml(File(p.join(p.current, 'package.json')).readAsStringSync())));
}