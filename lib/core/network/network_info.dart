import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Internet connection checker.
/// Getting current info internet connection status.
abstract class NetworkInfo {
  /// Get current status internet connection.
  /// Connected on Internet or not.
  ///
  /// - Return `true` when user/device has internet connection.
  /// - Return `false` when user/device hasn't internet connection.
  Future<bool> get isConnected;
}

/// Implementation of [NetworkInfo] using [InternetConnectionChecker].
class NetworkInfoImpl implements NetworkInfo {
  /// Constructor for creating a [NetworkInfoImpl].
  const NetworkInfoImpl(this.connectionChecker);

  /// Instance of [InternetConnectionChecker].
  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
