
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

class PackageJson {
  final Map<String, dynamic> raw;

  PackageJson(this.raw);
}

final jsDir = 'js';

PackageJson readPackageJson() {
  return PackageJson(json.decode(File(p.join(jsDir, 'package.json')).readAsStringSync()));
}