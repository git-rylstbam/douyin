import 'package:get_storage/get_storage.dart';

/// CreateDate: 2025/1/17 16:37
/// Author: Lee
/// Description:

enum StorageKeyEnum { initial, font }

class StorageUtil {
  static const defaultKey = 'douyin';

  static final shared = GetStorageUtilCore();

  static T? read<T>(StorageKeyEnum key) => shared.read<T>(key);

  static Future<void> write(StorageKeyEnum key, dynamic value) =>
      shared.write(key, value);

  static bool has(StorageKeyEnum key) => shared.has(key);

  static Future<void> remove(StorageKeyEnum key) => shared.remove(key);

  static Future<void> clear() => shared.clear();
}

class GetStorageUtilCore implements StorageUtilCore {
  GetStorageUtilCore([String key = 'douyin']) : instance = GetStorage(key);

  final GetStorage instance;

  @override
  T? read<T>(StorageKeyEnum key) => instance.read<T>(key.name);

  @override
  Future<void> write(StorageKeyEnum key, value) =>
      instance.write(key.name, value);

  @override
  bool has(StorageKeyEnum key) => instance.hasData(key.name);

  @override
  Future<void> remove(StorageKeyEnum key) => instance.remove(key.name);

  @override
  Future<void> clear() => instance.erase();
}

abstract class StorageUtilCore {
  T? read<T>(StorageKeyEnum key);

  Future<void> write(StorageKeyEnum key, dynamic value);

  bool has(StorageKeyEnum key);

  Future<void> remove(StorageKeyEnum key);

  Future<void> clear();
}
