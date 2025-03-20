import 'package:cli_pkg/cli_pkg.dart' as pkg;
import 'package:grinder/grinder.dart';

import 'utils/npm.dart';
import 'utils/pub.dart';

main(args) {
  final pubspec = readPubspecYaml();
  final packageJson = readPackageJson();
  // set
  pkg.humanName.value = 'Document View';

  pkg.executables.value = {"docview": "bin/docview.dart"};
  pkg.jsModuleMainLibrary.value = "lib/js/main.dart";
  pkg.npmPackageJson.fn = () => packageJson.raw;

  // add tasks
  pkg.addNpmTasks();
  return grind(args);
}

@Task()
test() => new TestRunner().testAsync();

@Task()
jsTest() {

}

@Task()
@Depends('pkg-npm-dev')
dev() {
  // run dev

  // 
}

@DefaultTask()
@Depends(test, 'pkg-npm-release')
build() {
  // build
  Pub.build();

  // bundle js code

  // generate/emit .d.ts code
}

@Task()
clean() => defaultClean();
