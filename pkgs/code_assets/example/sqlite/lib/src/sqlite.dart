// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:ffi/ffi.dart';

import 'third_party/sqlite3.g.dart';

/// The version of SQLite.
String get version {
  final nativeString = sqlite3_libversion();
  return nativeString.cast<Utf8>().toDartString();
}

/// Initializes internal SQLite structures.
void initialize() {
  final rc = sqlite3_initialize();
  if (rc != 0) {
    throw Exception('sqlite3_initialize() returned $rc');
  }
}
