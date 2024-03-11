import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:buku_masjid/core/network/network_info.dart';

class FakeInternetConnectionChecker implements InternetConnectionChecker {
  bool _hasConnection = true;

  @override
  Future<bool> get hasConnection async {
    return _hasConnection;
  }

  void setConnectionStatus(bool status) {
    _hasConnection = status;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late NetworkInfoImpl networkInfo;
  late FakeInternetConnectionChecker fakeConnectionChecker;

  setUp(() {
    fakeConnectionChecker = FakeInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(fakeConnectionChecker);
  });

  group('isConnected', () {
    test('should return true when FakeInternetConnectionChecker has connection',
        () async {
      // Arrange
      fakeConnectionChecker.setConnectionStatus(true);

      // Act
      final result = await networkInfo.isConnected;

      // Assert
      expect(result, true);
    });

    test(
        'should return false when FakeInternetConnectionChecker does not have connection',
        () async {
      // Arrange
      fakeConnectionChecker.setConnectionStatus(false);

      // Act
      final result = await networkInfo.isConnected;

      // Assert
      expect(result, false);
    });
  });
}
