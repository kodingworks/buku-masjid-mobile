import 'package:hive/hive.dart';
import 'package:buku_masjid/core/core.dart';

abstract class AuthLocalDataSource implements CacheDataSource<String?> {}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this.hive);

  final HiveInterface hive;

  @override
  String cacheKey = 'AUTH_DATA_SOURCE_KEY';

  @override
  Future<bool> clearCache() async {
    try {
      final box = await _getBox();
      await box?.clear();

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<String?> getData() async {
    try {
      final box = await _getBox();
      final boxData = box?.get('data');
      if (boxData != null && boxData is String) {
        return boxData;
      } else {
        return null;
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> isCached() async {
    try {
      final box = await _getBox();

      return box?.get('data') != null;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> saveCache(String? data) async {
    try {
      final box = await _getBox();

      await box?.put('data', data);

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<Box<Object?>?> _getBox() async {
    if (!hive.isBoxOpen(cacheKey)) {
      return hive.openBox(cacheKey);
    }

    return hive.box(cacheKey);
  }
}
