import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheAdapter {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> writeStorage(String key, dynamic value) async {
    await storage.write(key: key, value: value);
  }

  dynamic read(String key) async {
    dynamic string = await storage.read(key: key);
    return string;
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  Future<void> clear() async {
    await storage.deleteAll();
  }
}
