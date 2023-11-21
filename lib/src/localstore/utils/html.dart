import 'dart:async';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;
// import 'package:web/web.dart';

import 'utils_impl.dart';

/// Utils class
class Utils implements UtilsImpl {
  Utils._();
  static final Utils _utils = Utils._();
  static Utils get instance => _utils;

  @override
  void clearCache() {
    // no cache on web
  }

  @override
  Future<Map<String, dynamic>?> get(String path,
      [bool? isCollection = false, List<List>? conditions]) async {
    // Fetch the documents for this collection
    throw UnimplementedError();
  }

  @override
  Future<dynamic>? set(Map<String, dynamic> data, String path) {
    return _writeToStorage(data, path);
  }

  @override
  Future delete(String path) async {
    _deleteFromStorage(path);
  }

  @override
  Stream<Map<String, dynamic>> stream(String path, [List<List>? conditions]) {
    // ignore: close_sinks
    final storage = _storageCache[path] ??
        _storageCache.putIfAbsent(
            path, () => StreamController<Map<String, dynamic>>.broadcast());

    _initStream(storage, path);
    return storage.stream;
  }

  Map<String, dynamic>? _getAll(MapEntry<String, String> dataCol) {
    final items = <String, dynamic>{};
    try {
      final mapCol = json.decode(dataCol.value) as Map<String, dynamic>;
      mapCol.forEach((key, value) {
        final data = value as Map<String, dynamic>;
        items[key] = data;
      });
      if (items.isEmpty) return null;
      return items;
    } catch (error) {
      rethrow;
    }
  }

  void _initStream(
      StreamController<Map<String, dynamic>> storage, String path) {
    throw UnimplementedError();
  }

  final _storageCache = <String, StreamController<Map<String, dynamic>>>{};

  Future<dynamic> _readFromStorage(String path) async {
    throw UnimplementedError();
  }

  Future<dynamic> _writeToStorage(
    Map<String, dynamic> data,
    String path,
  ) async {
    throw UnimplementedError();
  }

  Future<dynamic> _deleteFromStorage(String path) async {
    throw UnimplementedError();
  }
}
