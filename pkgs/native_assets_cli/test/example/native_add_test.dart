// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:native_assets_cli/native_assets_cli.dart';
import 'package:test/test.dart';

import '../helpers.dart';

void main() async {
  late Uri tempUri;

  setUp(() async {
    tempUri = (await Directory.systemTemp.createTemp()).uri;
  });

  tearDown(() async {
    await Directory.fromUri(tempUri).delete(recursive: true);
  });

  test('native_add build', () async {
    final testTempUri = tempUri.resolve('test1/');
    await Directory.fromUri(testTempUri).create();
    final testPackageUri = packageUri.resolve('example/native_add/');
    final dartUri = Uri.file(Platform.resolvedExecutable);

    final processResult = await Process.run(
      dartUri.path,
      [
        'build.dart',
        '-Dout_dir=${tempUri.path}',
        '-Dpackage_root=${testPackageUri.path}',
        '-Dtarget=${Target.current}',
        '-Dpackaging=dynamic',
        if (cc != null) '-Dcc=${cc!.toFilePath()}',
      ],
      workingDirectory: testPackageUri.path,
    );
    if (processResult.exitCode != 0) {
      print(processResult.stdout);
      print(processResult.stderr);
      print(processResult.exitCode);
    }
    expect(processResult.exitCode, 0);

    final buildOutputUri = tempUri.resolve('build_output.yaml');
    final buildOutput = BuildOutput.fromYamlString(
        await File.fromUri(buildOutputUri).readAsString());
    final assets = buildOutput.assets;
    expect(assets.length, 1);
    final dependencies = buildOutput.dependencies;
    expect(await assets.allExist(), true);
    expect(
      dependencies.dependencies,
      [
        testPackageUri.resolve('src/native_add.c'),
        testPackageUri.resolve('build.dart'),
      ],
    );
  });
}