/// Interface/Abstract class defining methods for the caching DataSource.
/// This is to be implemented by the cache layer,
/// using this interface as a way of communicating.
abstract class CacheDataSource<T> {
  /// Method to save cache data
  Future<bool> saveCache(T data);

  /// Get main data in local storage
  Future<T> getData();

  // Get status cache
  Future<bool> isCached();

  /// Clear cache from storage
  Future<bool> clearCache();

  /// Cache key, must be unique
  late String cacheKey;
}

/// Interface/Abstract class defining methods for the expiry caching DataSource.
abstract class ExpiryCacheDataSource {
  /// Get status cache is expired or not
  Future<bool> isExpired();

  /// Set expired date cache
  Future<bool> setExpired(DateTime date);
}
