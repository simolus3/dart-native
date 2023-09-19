// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

/// Dart_Handle Test
class NativeLibrary {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  NativeLibrary(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  NativeLibrary.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void func1(
    Object arg0,
  ) {
    return _func1(
      arg0,
    );
  }

  late final _func1Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Handle)>>('func1');
  late final _func1 = _func1Ptr.asFunction<void Function(Object)>();

  Object func2() {
    return _func2();
  }

  late final _func2Ptr =
      _lookup<ffi.NativeFunction<ffi.Handle Function()>>('func2');
  late final _func2 = _func2Ptr.asFunction<Object Function()>();

  ffi.Pointer<ffi.Pointer<ffi.Handle>> func3(
    ffi.Pointer<ffi.Handle> arg0,
  ) {
    return _func3(
      arg0,
    );
  }

  late final _func3Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Pointer<ffi.Handle>> Function(
              ffi.Pointer<ffi.Handle>)>>('func3');
  late final _func3 = _func3Ptr.asFunction<
      ffi.Pointer<ffi.Pointer<ffi.Handle>> Function(ffi.Pointer<ffi.Handle>)>();

  void func4(
    Typedef1 arg0,
  ) {
    return _func4(
      arg0,
    );
  }

  late final _func4Ptr =
      _lookup<ffi.NativeFunction<ffi.Void Function(Typedef1)>>('func4');
  late final _func4 = _func4Ptr.asFunction<void Function(Typedef1)>();
}

typedef Typedef1 = ffi.Pointer<ffi.NativeFunction<Typedef1_function>>;
typedef Typedef1_function = ffi.Void Function(ffi.Handle);

final class Struct1 extends ffi.Opaque {}

final class Struct2 extends ffi.Struct {
  external ffi.Pointer<ffi.Handle> h;
}
